# Component parts
PARTS = label pcb pin1 pins shield

# PCB (green)
$(eval $(call rule,SIM800C/SIM800C-pcb,$(COLOR_PCB)))
# Pins (gold)
$(eval $(call rule,SIM800C/SIM800C-pins,$(COLOR_PIN)))
# Shield (silver)
$(eval $(call rule,SIM800C/SIM800C-shield,$(COLOR_SHIELD)))
# Label (white)
$(eval $(call rule,SIM800C/SIM800C-label,$(COLOR_LABEL)))
# Pin1 (red)
$(eval $(call rule,SIM800C/SIM800C-pin1,$(COLOR_RED_DOT)))

# PARTS_WRLS = $(patsubst %,$(TEMP_PATH)/SIM800C/SIM800C-%.wrl,$(PARTS))
PARTS_WRPS = $(patsubst %,$(TEMP_PATH)/SIM800C/SIM800C-%.wrp,$(PARTS))

# %.wrp: %.wrl
# 	# @sed '1,/children/d;/^\w\w\[/,$d' $< >$@
# 	@sed '1,/children/d' $< | head -n -2 >$@
# 	# @sed -e '/children/,$ d' $< >$@
# 	# @sed '$d' $< >$@


$(BUILD_PATH)/SIM800C.wrl: $(PARTS_WRPS)
	@echo "Multiple  →  $@"
	cat vrml-start.tpl $(PARTS_WRPS) vrml-stop.tpl >$@
	# @sed '1,3d' $(PARTS_WRPS) >$@
	# @$(MKDIR) $(dir $(BUILD_PATH)/SIM800C.wrl)


TARGETS += $(BUILD_PATH)/SIM800C.wrl
MODELS += SIM800C

.PHONY: model-SIM800C

model-SIM800C:
	$(OPENSCAD) $(SRC_PATH)/SIM800C/SIM800C.scad
