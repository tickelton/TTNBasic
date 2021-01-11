ARMGNU ?= arm-none-eabi

BUILD = build/
SRC = src/kernel/

TARGET = target.img
LIST = target.list
MAP = target.map
LINKER = target.ld

OBJECTS := $(patsubst $(SRC)%.S,$(BUILD)%.o,$(wildcard $(SRC)*.S))

all: $(TARGET) $(LIST)

rebuild: all

$(LIST) : $(BUILD)target.elf
	$(ARMGNU)-objdump -d $(BUILD)target.elf > $(LIST)

$(TARGET) : $(BUILD)target.elf
	$(ARMGNU)-objcopy $(BUILD)target.elf -O binary $(TARGET) 

$(BUILD)target.elf : $(OBJECTS) $(LINKER)
	$(ARMGNU)-ld --no-undefined $(OBJECTS) -Map $(MAP) -o $(BUILD)target.elf -T $(LINKER)

$(BUILD)%.o: $(SRC)%.S $(BUILD)
	$(ARMGNU)-as -I $(SRC) $< -o $@

$(BUILD):
	mkdir $@

clean : 
	-rm -rf $(BUILD)
	-rm -f $(TARGET)
	-rm -f $(LIST)
	-rm -f $(MAP)
