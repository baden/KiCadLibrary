# TODO: Пока правила написаны вручную, чуть позже сделаю шаблон

# PCB
$(TEMP_PATH)/SIM800C-pcb.stl: $(SRC_PATH)/SIM800C/SIM800C-pcb.scad
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(OPENSCAD) $< -o $@

$(BUILD_PATH)/SIM800C/SIM800C-pcb.wrl: $(TEMP_PATH)/SIM800C-pcb.wrl
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(call color, 0 0.33 0, 0 0.5 0) $< >$@

TARGETS += $(BUILD_PATH)/SIM800C/SIM800C-pcb.wrl


# Pins
$(TEMP_PATH)/SIM800C-pins.stl: $(SRC_PATH)/SIM800C/SIM800C-pins.scad
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(OPENSCAD) $< -o $@

$(BUILD_PATH)/SIM800C/SIM800C-pins.wrl: $(TEMP_PATH)/SIM800C-pins.wrl
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(call color, 1.0 0.83 0, 1.0 1.0 1.0) $< >$@

TARGETS += $(BUILD_PATH)/SIM800C/SIM800C-pins.wrl

# Shield
$(TEMP_PATH)/SIM800C-shield.stl: $(SRC_PATH)/SIM800C/SIM800C-shield.scad
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(OPENSCAD) $< -o $@

$(BUILD_PATH)/SIM800C/SIM800C-shield.wrl: $(TEMP_PATH)/SIM800C-shield.wrl
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(call color, 0.5 0.5 0.5, 1.0 1.0 1.0) $< >$@

TARGETS += $(BUILD_PATH)/SIM800C/SIM800C-shield.wrl

# Label
$(TEMP_PATH)/SIM800C-label.stl: $(SRC_PATH)/SIM800C/SIM800C-label.scad
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(OPENSCAD) $< -o $@

$(BUILD_PATH)/SIM800C/SIM800C-label.wrl: $(TEMP_PATH)/SIM800C-label.wrl
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(call color, 1.0 1.0 1.0, 1.0 1.0 1.0) $< >$@

TARGETS += $(BUILD_PATH)/SIM800C/SIM800C-label.wrl

# Pin1
$(TEMP_PATH)/SIM800C-pin1.stl: $(SRC_PATH)/SIM800C/SIM800C-pin1.scad
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(OPENSCAD) $< -o $@

$(BUILD_PATH)/SIM800C/SIM800C-pin1.wrl: $(TEMP_PATH)/SIM800C-pin1.wrl
	@$(MKDIR) $(dir $@)
	@echo "$<"  →  "$@"
	@$(call color, 1.0 0 0, 1.0 0 0) $< >$@

TARGETS += $(BUILD_PATH)/SIM800C/SIM800C-pin1.wrl
