# Component parts
PARTS = body label pins

#COLOR_WQFN-30_6x6mm_P0.5mm_body = 0.2 0.2 0.2
#COLOR_WQFN-30_6x6mm_P0.5mm_label = 0.8 0.8 0.8
#COLOR_WQFN-30_6x6mm_P0.5mm_pins = $(COLOR_PIN)

#$(eval $(call assemble, WQFN-30_6x6mm_P0.5mm))

NAME = WQFN-30_4x6mm_P0.5mm

$(TEMP_PATH)/$(NAME)/%.stl: $(SRC_PATH)/$(NAME)/%.scad
	mkdir -p $(dir $@)
	$(OPENSCAD) $< -o $@


$(BUILD_PATH)/$(NAME).wrl: $(SRC_PATH)/$(NAME)/make.py $(TEMP_PATH)/$(NAME)/body.stl $(TEMP_PATH)/$(NAME)/label.stl
	# echo "TBD $? to $@"
	mkdir -p $(dir $@)
	python $< $@ $(TEMP_PATH)/$(NAME)
