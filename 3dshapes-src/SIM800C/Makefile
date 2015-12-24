# Component parts

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

.PHONY: model-SIM800C

model-SIM800C:
	$(OPENSCAD) $(SRC_PATH)/SIM800C/SIM800C.scad
