.PHONY: models clean distclean

SRC_PATH := 3dshapes-src
BUILD_PATH := 3dshapes
TEMP_PATH := tmp

OPENSCAD := openscad
MESHCONV := ./tools/meshconv
MKDIR := mkdir -p

# recursive wildcard function, call with params:
#  - start directory (finished with /) or empty string for current dir
#  - glob pattern
# (taken from http://blog.jgc.org/2011/07/gnu-make-recursive-wildcard-function.html)
rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))


DEPS := $(call rwildcard,$(SRC_PATH)/,*Makefile)
# DEPS := $(patsubst %,$(SRC_PATH)/%/Makefile,$(MODELS))

# MODELS = SIM800C
MODELS =
TARGETS =
TEMP_FILES =

all: models

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

# Создает правило для сборки фрагмента компонента.
define rule

$(TEMP_PATH)/$(1).stl: $(SRC_PATH)/$(1).scad
	@echo "$$<  →  $$@"
	@$(MKDIR) $(dir $(TEMP_PATH)/$(1).stl)
	@$(OPENSCAD) $$< -o $$@ 2>$$@.err

$(BUILD_PATH)/$(1).wrl: $(TEMP_PATH)/$(1).wrl
	@echo "$$<  →  $$@"
	@$(MKDIR) $(dir $(BUILD_PATH)/$(1).wrl)
	@sed -e 's/diffuseColor.*/diffuseColor $(2)/g' -e '/specularColor.*/d' $$< >$$@

TARGETS += $(BUILD_PATH)/$(1).wrl
TEMP_FILES += $(TEMP_PATH)/$(1).stl $(TEMP_PATH)/$(1).wrl

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
print-%:
	@echo $* is $($*)

models: $(TARGETS)

clean:
	@rm -f $(TEMP_FILES)

distclean: clean
	@rm -f $(TARGETS)
