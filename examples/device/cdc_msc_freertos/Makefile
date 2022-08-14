DEPS_SUBMODULES += lib/FreeRTOS-Kernel

include ../../../tools/top.mk
include ../../make.mk

FREERTOS_SRC = lib/FreeRTOS-Kernel

INC += \
	src \
	src/FreeRTOSConfig \
	$(TOP)/hw \
	$(TOP)/$(FREERTOS_SRC)/include \
	$(TOP)/$(FREERTOS_SRC)/portable/GCC/$(FREERTOS_PORT)
	

#NOTE>>> DM >>>>> The Template for the init assembly source (startup_stm32l412xx.s) is missing the USB handler
# 	.weak      USB_IRQHandler
#  	.thumb_set USB_IRQHandler,Default_Handler
# if this is not in place we don't get the USB IRQ

# Example source
EXAMPLE_SOURCE = \
	src/freertos_hook.c \
	src/main.c \
	src/msc_disk.c \
	src/usb_descriptors.c

SRC_C += $(addprefix $(CURRENT_PATH)/, $(EXAMPLE_SOURCE))

# FreeRTOS source, all files in port folder
SRC_C += \
	$(FREERTOS_SRC)/list.c \
	$(FREERTOS_SRC)/queue.c \
	$(FREERTOS_SRC)/tasks.c \
	$(FREERTOS_SRC)/timers.c \
	$(subst ../../../,,$(wildcard ../../../$(FREERTOS_SRC)/portable/GCC/$(FREERTOS_PORT)/*.c))

# Suppress FreeRTOS warnings
CFLAGS += -Wno-error=cast-qual -Wno-error=redundant-decls

# FreeRTOS (lto + Os) linker issue
LDFLAGS += -Wl,--undefined=vTaskSwitchContext

include ../../rules.mk
