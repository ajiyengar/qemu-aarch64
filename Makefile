# Set MODULE_TYPE to required binary target
MODULE_TYPE := 10      # Boot time application
#MODULE_TYPE := 11      # Boot services driver
#MODULE_TYPE := 12      # Runtime driver

include gnu-efi.mk

all: hello.efi

clean:
	rm -f *.o *.so *.efi *~
