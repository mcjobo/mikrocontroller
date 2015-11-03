MCU=atmega328p

F_CPU=8000000

TARGET=ir_send

LIBDIR=../common/
CLIBS=uart.c rprintf.c dhcp_client.c enc28j60.c ip_arp_udp_tcp.c irmp.c timerx8.c
FUSES      = -U lfuse:w:0xe2:m -U hfuse:w:0xd9:m -U efuse:w:0x07:m

CFLAGS = -g -Os -mmcu=$(MCU)
CFLAGS += -D__AVR_ATmega328P__
CFLAGS += -DF_CPU=$(F_CPU)UL


# you should not need to change anything below here
#--------------------------------------------------------------------------------
CSRC=$(TARGET).c $(CLIBS)
CSRCDIR=$(TARGET).c $(patsubst %.c, $(LIBDIR)/%.o,$(CSRC))
OBJS=$(patsubst %.c, $(OBJDIR)/%.o,$(CSRC))


#CFLAGS += -Wno-deprecated-declarations -D__PROG_TYPES_COMPAT__

OBJDIR=obj

.PHONY: program fuses
all: output setup hex
	
output:
	@echo "objs: " $(OBJS)
	@echo "_objs_: " $(OBJS)	
	@echo "objs dir: " $(OBJDIR)/%.o	

hex: $(OBJDIR)/$(TARGET).hex
	@echo "hex"
	avr-size --format=avr --mcu=$(MCU) $(OBJDIR)/$(TARGET).elf 

$(OBJDIR)/$(TARGET).hex: $(OBJDIR)/$(TARGET).elf
	@echo "creating hex file"
	avr-objcopy -j .text -j .data -O ihex $(OBJDIR)/$(TARGET).elf  $(OBJDIR)/$(TARGET).hex
	avr-objcopy -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 -O ihex $(OBJDIR)/$(TARGET).elf $(OBJDIR)/$(TARGET).eeprom.hex
	
$(OBJDIR)/$(TARGET).elf: $(OBJS)
	@echo "running linker"
	avr-gcc $(CFLAGS) -o $(OBJDIR)/$(TARGET).elf $(OBJS)

$(OBJDIR)/%.o: $(LIBDIR)/%.c
	@echo "running compiler compiles sources in libsrc directory"
	avr-gcc $(CFLAGS) -c $^ -o $@

obj/%.o: %.c
	@echo "running compiler compiles sources in src directory"
	avr-gcc $(CFLAGS) -c $^ -o $@




setup:
	@echo "creating objects directory"
	mkdir -p $(OBJDIR)

program:
	avrdude -P usb -p $(MCU) -c avrispv2 -B 1 -e -U flash:w:$(OBJDIR)/$(TARGET).hex
	date

fuses:
	avr-objcopy -j lfuses --change-section-address lfuses=0 -O ihex $(OBJDIR)/$(TARGET).elf $(OBJDIR)/$(TARGET)-lfuse.hex
	avr-objcopy -j hfuses --change-section-address hfuses=0 -O ihex $(OBJDIR)/$(TARGET).elf $(OBJDIR)/$(TARGET)-hfuse.hex
	avr-objcopy -j efuses --change-section-address efuses=0 -O ihex $(OBJDIR)/$(TARGET).elf $(OBJDIR)/$(TARGET)-efuse.hex

program-fuses:
	avrdude -P usb -p $(MCU) -c avrispv2  $(FUSES) -B 32
	#avrdude -P usb -p $(MCU) -c avrispv2  -U lfuse:w:0xe2:m
	#avrdude -P usb -p $(MCU) -c avrispv2  -U hfuse:w:0xd9:m
	#avrdude -P usb -p $(MCU) -c avrispv2  -U efuse:w:0x07:m
    
	#avrdude -P usb -p $(MCU) -c avrispv2  -U lfuse:w:$(OBJDIR)/$(TARGET)-lfuse.hex
	#avrdude -P usb -p $(MCU) -c avrispv2  -U hfuse:w:$(OBJDIR)/$(TARGET)-hfuse.hex
	#avrdude -P usb -p $(MCU) -c avrispv2  -U efuse:w:$(OBJDIR)/$(TARGET)-efuse.hex
    #avrdude -p$(avrType) -c$(programmerType) -P$(programmerDev) -b$(baud) -v -U hfuse:w:$(src).hfuse.hex
    #avrdude -p$(avrType) -c$(programmerType) -P$(programmerDev) -b$(baud) -v -U efuse:w:$(src).efuse.hex
	date

clean:
	rm -rf $(OBJDIR)