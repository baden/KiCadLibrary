.PHONY: models

SRC_PATH := 3dshapes-src
BUILD_PATH := 3dshapes
TEMP_PATH := tmp

OPENSCAD := openscad
MESHCONV := ./tools/meshconv
MKDIR := mkdir -p

MODELS := SIM800C

DEPS := $(patsubst %,$(SRC_PATH)/%/Makefile,$(MODELS))

TARGETS =

define color
	@sed \
		-e 's/diffuseColor.*/diffuseColor $(1)/g' \
		-e 's/specularColor.*/specularColor $(2)/g'
endef


-include $(DEPS)

.SUFFIXES:: .wrl .stl

VPATH := $(TEMP_PATH)

%.wrl: %.stl
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(MESHCONV) $< -c wrl

# $(BUILD_PATH)/%.wrl: $(TEMP_PATH)/%.stl Makefile $(DEPS)
# 	echo Make "$@" from "@<"
#
# $(TEMP_PATH)/%.stl: $(SRC_PATH)/%.scad
# 	echo Make "$@" from "@<"

#
# use this like:
# 'make print-PATH print-CFLAGS make print-ALL_OBJS'
# to see the value of make variable PATH and CFLAGS, ALL_OBJS, etc.
#
print-%:
	@echo $* is $($*)

models: $(TARGETS)
