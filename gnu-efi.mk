TOPDIR           := $(dir $(lastword $(MAKEFILE_LIST)))
GNUEFI_DIR        = $(TOPDIR)/gnu-efi

include $(GNUEFI_DIR)/Make.defaults

CRTOBJS           = $(GNUEFI_DIR)/$(ARCH)/gnuefi/crt0-efi-$(ARCH).o
LDSCRIPT          = $(GNUEFI_DIR)/gnuefi/elf_$(ARCH)_efi.lds
INCDIR            = -I$(GNUEFI_DIR)/inc -I$(GNUEFI_DIR)/inc/protocol -I$(GNUEFI_DIR)/inc/$(ARCH)

LDFLAGS          += -shared -Bsymbolic -L$(GNUEFI_DIR)/$(ARCH)/lib -L$(GNUEFI_DIR)/$(ARCH)/gnuefi $(CRTOBJS)

LOADLIBES        += -lefi -lgnuefi
LOADLIBES        += $(LIBGCC)
LOADLIBES        += -T $(LDSCRIPT)

# Override HAVE_EFI_OBJCOPY set in Make.defaults to auto
OBJCOPY_INFO     := $(shell ${CROSS_COMPILE}objcopy -v --info | grep efi)
HAVE_EFI_OBJCOPY := $(if $(OBJCOPY_INFO),y,n)
ifeq ($(HAVE_EFI_OBJCOPY), y)
  ifeq ($(MODULE_TYPE), 10)
    FORMAT       := --target efi-app-$(ARCH)
  endif
  ifeq ($(MODULE_TYPE), 11)
    FORMAT       := --target efi-bsdrv-$(ARCH)
  endif
  ifeq ($(MODULE_TYPE), 11)
    FORMAT       := --target efi-rtdrv-$(ARCH)
  endif
else
  FORMAT         := -O binary
  LDFLAGS        += --defsym=EFI_SUBSYSTEM=$(MODULE_TYPE)
endif

include $(GNUEFI_DIR)/Make.rules
