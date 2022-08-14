CFLAGS += \
  -DSTM32L412xx \

# All source paths should be relative to the top level.
# LD_FILE = $(BOARD_PATH)/STM32L4P5ZGTX_FLASH.ld
LD_FILE = $(BOARD_PATH)/STM32L412KBTx_FLASH.ld


#SRC_S += $(ST_CMSIS)/Source/Templates/gcc/startup_stm32l412xx.s
#use a local version (to avoid comminting in the submodule, USB handler missing in original STM file)
SRC_S += $(BOARD_PATH)/startup_stm32l412xx.s

# For flash-jlink target
JLINK_DEVICE = STM32L412KB
