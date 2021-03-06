ADA_RTS = $(BUILD_BASE_DIR)/var/libcache/ada

ADA_RTS_SOURCE = $(call select_from_ports,ada-runtime)/ada-runtime/contrib/gcc-6.3.0
ADA_RUNTIME_COMMON_DIR = $(call select_from_ports,ada-runtime)/ada-runtime/src/common
ADA_RUNTIME_DIR = $(call select_from_ports,ada-runtime)/ada-runtime/src/fat
ADA_RUNTIME_LIB_DIR = $(call select_from_ports,ada-runtime)/ada-runtime/src/lib
ADA_RUNTIME_PLATFORM_DIR = $(call select_from_ports,ada-runtime)/ada-runtime/platform

INC_DIR += $(ADA_RUNTIME_LIB_DIR)
INC_DIR += $(ADA_RTS_SOURCE)
INC_DIR += $(ADA_RUNTIME_DIR)
INC_DIR += $(ADA_RUNTIME_COMMON_DIR)
