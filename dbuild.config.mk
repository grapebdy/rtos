RASPPI	?= 2

ifeq ($(strip $(RASPPI)),1)
ARCH	?= -march=armv6j -mtune=arm1176jzf-s -mfloat-abi=hard 
else
ARCH	?= -march=armv7-a -mtune=cortex-a7 -mfloat-abi=hard
endif

AFLAGS ?= $(ARCH) -DRASPPI=$(RASPPI)
CFLAGS += $(ARCH) -g -std=gnu99 -Wno-psabi -fsigned-char -DRASPPI=$(RASPPI) -nostdlib -Wno-implicit -mfloat-abi=softfp 
## CFLAGS += -finstrument-functions
CFLAGS += -mno-unaligned-access
CFLAGS += -I $(BASE)core/portable/GCC/RaspberryPi/
CFLAGS += -I $(BASE)core/include/
CFLAGS += -I $(BASE)drivers/
CFLAGS += -I $(BASE)drivers/lan9514/include/
CFLAGS += -I $(BASE)drivers/FreeRTOS-Plus-TCP/include/

TOOLCHAIN=arm-none-eabi-
