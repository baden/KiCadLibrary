.SILENT:
.PHONY: models images clean distclean add_to_kicad system_deps

SRC_PATH := 3dshapes-src
SRC_SYMBOLS_PATH := symbols-src
SYMBOLS := symbols.lib
BUILD_PATH := 3dshapes
TEMP_PATH := tmp
IMAGES_PATH := images
MODELS_PATH := models
FOOTPRINTS_PATH := footprints

OPENSCAD := openscad
MESHCONV := ./tools/meshconv
MKDIR := mkdir -p

KICAD_CONFIG_PATH := ~/.config/kicad

KICAD_COMMON_CONFIG  := $(KICAD_CONFIG_PATH)/kicad_common
KICAD_SYM_LIB_CONFIG := $(KICAD_CONFIG_PATH)/sym-lib-table
KICAD_FP_LIB_CONFIG  := $(KICAD_CONFIG_PATH)/fp-lib-table

# recursive wildcard function, call with params:
#  - start directory (finished with /) or empty string for current dir
#  - glob pattern
# (taken from http://blog.jgc.org/2011/07/gnu-make-recursive-wildcard-function.html)
rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))


DEPS := $(call rwildcard,$(SRC_PATH)/,*Makefile)
# DEPS := $(patsubst %,$(SRC_PATH)/%/Makefile,$(MODELS))

# ALL_SYMBOLS := $(call rwildcard,$(SRC_SYMBOLS_PATH)/,*.lib)

# MODELS = SIM800C
MODELS =
TARGETS =
TEMP_FILES =

all: add_to_kicad system_deps models images models_x3d

# Color table {diffuseColor},{specularColor}
#
# Green
COLOR_PCB := 0 0.33 0
# Gold
COLOR_PIN := 1.0 0.83 0
# Silver shield
COLOR_SHIELD := 0.5 0.5 0.5
# White paper label
COLOR_LABEL := 1.0 1.0 1.0
# Pin1 red marker
COLOR_RED_DOT := 1.0 0 0

system_deps:
	if ! command -v "openscad" > /dev/null 2>&1; then \
	  if [ "$(lsb_release -rs)" = "18.04" ]; then \
			sudo add-apt-repository ppa:openscad/releases; \
			sudo apt-get update; \
		fi; \
		echo -n "Installing openscad..."; \
		sudo apt install openscad openscad-mcad -y; \
		echo "TBD"; \
	fi

	if ! command -v "java" > /dev/null 2>&1; then \
		sudo apt install default-jre -y; \
	fi

	if ! command -v "pip" > /dev/null 2>&1; then \
		sudo apt install -y python-pip; \
	fi

	if ! command -v "freecad" > /dev/null 2>&1; then \
		sudo apt install -y freecad; \
		pip install git+https://github.com/dcowden/cadquery.git; \
		pip install numpy-stl; \
	fi

	# apt install -y freecad libglu1-mesa python-pip

add_to_kicad: $(SYMBOLS)
	if ! grep -q LOCAL_BADEN $(KICAD_COMMON_CONFIG); then \
	  echo -n "Patching kicad common config $(KICAD_COMMON_CONFIG)..."; \
		sed -i.bak '/\[EnvironmentVariables\]/a LOCAL_BADEN=$(shell pwd)' $(KICAD_COMMON_CONFIG); \
		echo "ok."; \
	fi

	if ! grep -q LocalBaden $(KICAD_SYM_LIB_CONFIG); then \
	  echo -n "Patching kicad symbol config $(KICAD_SYM_LIB_CONFIG)..."; \
		sed -i.bak '2i\ \ (lib (name LocalBaden)(type Legacy)(uri $${LOCAL_BADEN}/$(SYMBOLS))(options "")(descr ""))' $(KICAD_SYM_LIB_CONFIG); \
		echo "ok."; \
	fi

	if ! grep -q LocalBaden $(KICAD_FP_LIB_CONFIG); then \
	  echo -n "Patching kicad footprint config $(KICAD_FP_LIB_CONFIG)..."; \
		sed -i.bak '2i\ \ (lib (name LocalBaden)(type KiCad)(uri $${LOCAL_BADEN}/$(FOOTPRINTS_PATH))(options "")(descr ""))' $(KICAD_FP_LIB_CONFIG); \
		echo "ok."; \
	fi

# $(SYMBOLS): $(ALL_SYMBOLS)
# 	echo "EESchema-LIBRARY Version 2.4" > $(SYMBOLS)
# 	for i in $(ALL_SYMBOLS); do \
# 		tail -n +2 $$i >> $(SYMBOLS); \
# 	done

# Создает правило для сборки фрагмента компонента.
define rule

$(TEMP_PATH)/$(1).stl: $(SRC_PATH)/$(1).scad
	@echo "$$<  →  $$@"
	@$(MKDIR) $(dir $(TEMP_PATH)/$(1).stl)
	@$(OPENSCAD) $$< -o $$@ 2>$$@.err

# $(BUILD_PATH)/$(1).wrl: $(TEMP_PATH)/$(1).wrl
# 	@echo "$$<  →  $$@"
# 	@$(MKDIR) $(dir $(BUILD_PATH)/$(1).wrl)
# 	@sed -e 's/diffuseColor.*/diffuseColor $(2)/g' -e '/specularColor.*/d' $$< >$$@

$(TEMP_PATH)/$(1).wrp: $(TEMP_PATH)/$(1).wrl
	@echo "$$<  →  $$@"
	@$(MKDIR) $(dir $(TEMP_PATH)/$(1).wrp)
	@sed -e 's/diffuseColor.*/diffuseColor $(2)/g' -e '/specularColor.*/d' $$< | \
	sed '1,/children/d' | head -n -2 >$$@

TEMP_FILES += $(TEMP_PATH)/$(1).stl $(TEMP_PATH)/$(1).wrl $(TEMP_PATH)/$(1).wrp $(TEMP_PATH)/$(1).stl.err

endef

# SEQ := $(shell seq -w 0 4 359)

# $1 = Component name
define assemble

$(foreach part,$(PARTS_$1),$(eval $(call rule,$(1)/$(1)-$(part),$(COLOR_$(1)_$(part)))))

TARGETS += $(BUILD_PATH)/$(1).wrl
MODELS += $(1)

.PHONY: model-$(1)

model-$(1):
	$(OPENSCAD) $(SRC_PATH)/$(1)/$(1).scad

PARTS_$1_WRPS := $(patsubst %,$(TEMP_PATH)/$(1)/$(1)-%.wrp,$(PARTS_$1))

$(BUILD_PATH)/$(1).wrl: $$(PARTS_$1_WRPS)
	@echo "Multiple [$$(PARTS_$1_WRPS)]  →  $$@"
	cat vrml-start.tpl $$(PARTS_$1_WRPS) vrml-stop.tpl >$$@

$(IMAGES_PATH)/$(1).png: $(SRC_PATH)/$(1)/$(1).scad
	@echo "$$<  →  $$@"
	@$(MKDIR) $$(dir $$@)
	$(OPENSCAD) $$< -o $$@ --imgsize=512,512 --colorscheme=Nature
	convert "$$@" -resize 128x128 "$$@"

# TEMP_PNGS_$(1) := $(patsubst %,tmp/$(1)/image-%.png,${SEQ})
# TEMP_FILES += TEMP_PNGS_$(1)

$(TEMP_PATH)/$(1)/image-%.png: $(SRC_PATH)/$(1)/$(1).scad
	@echo "$$<  →  $$@ (p: $$(@:tmp/$(1)/image-%.png=%) )"
	@$(MKDIR) tmp/$(1)
	@$(OPENSCAD) $$< -o $$@ --imgsize=2048,1024 --camera=0,0,0,55,0,$$(@:tmp/$(1)/image-%.png=%),11 --colorscheme=Nature

# $(IMAGES_PATH)/$(1).gif: $$(TEMP_PNGS_$(1))
# 	@echo "$(TEMP_PATH)/$(1)/image-*.png  →  $$@"
# 	@$(MKDIR) $$(dir $$@)
# 	@convert '$(TEMP_PATH)/$(1)/image-*.png' -resize 512x256 -set delay 1x12 $$@

endef


-include $(DEPS)


.SUFFIXES:: .wrl .stl

VPATH := $(TEMP_PATH)

%.wrl: %.stl
	@$(MKDIR) $(dir $@)
	@echo "$<  →  $@"
	@$(MESHCONV) $< -c wrl >/dev/null

#
# use this like:
# 'make print-PATH print-CFLAGS make print-ALL_OBJS'
# to see the value of make variable PATH and CFLAGS, ALL_OBJS, etc.
#
# examples:
#
# make print-TARGETS
#
print-%:
	@echo $* is $($*)


models: $(TARGETS)

# TARGETS_X3D := $(TARGETS:.wrl=.x3d)
TARGETS_X3D := $(patsubst $(BUILD_PATH)/%.wrl,$(MODELS_PATH)/%.x3d,$(TARGETS))

models_x3d:	$(TARGETS_X3D)

$(MODELS_PATH)/%.x3d: $(BUILD_PATH)/%.wrl
	@echo "$<  →  $@"
	@#aopt -i $< -x $@
	CLASSPATH=tools/Vrml97ToX3dNist.jar java iicm.vrml.vrml2x3d.vrml2x3d $< $@

# IMAGES := $(TARGETS:%1.wrl:)
# IMAGES := $(patsubst $(BUILD_PATH)/%.wrl,$(IMAGES_PATH)/%.gif,$(TARGETS))
# IMAGES += $(patsubst $(BUILD_PATH)/%.wrl,$(IMAGES_PATH)/%.png,$(TARGETS))

# $(IMAGES_PATH)/%.png: $(SRC_PATH)/%/%.scad
# $(IMAGES_PATH)/$(1).png: $(SRC_PATH)/$(1)/$(1).scad
# 	@echo "$<  →  $@"
# 	echo TBD
# 	# $(OPENSCAD) $< -o $@
#
# $(IMAGES_PATH)/MMA8452Q.png: $(SRC_PATH)/MMA8452Q/MMA8452Q.scad
# 	@echo "$<  →  $@"
# 	echo TBD

images: $(IMAGES)
	# @ echo -n "## Список компонентов библиотеки\n\n" > List.md
	# @for i in $(MODELS) ; do \
	# 	(echo "1. ![$$i]($(IMAGES_PATH)/$$i.gif) $$i" >> List.md) ; \
	# done
	@echo -n "[" > list.json
	@D= ; for i in $(MODELS) ; do \
		(echo -n "$$D\"$$i\"" >> list.json) ; D=, ; \
	done
	@ echo -n "]\n" >> list.json

clean:
	@rm -f $(TEMP_FILES)

distclean: clean
	@rm -f $(TARGETS)
