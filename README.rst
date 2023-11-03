Hello World using GNU-EFI for AARCH64
-------------------------------------
The goal of the project is to demonstrate building a hello world app using gnu-efi for AARCH64 targets.

*NOTE*: Clang supports natively building PECOFF images that may be recommended over gnu-efi. For header files, add Tianocore EDK2 <pkg> Include directories to your include path.

gnu-efi.mk
----------
| This utility makefile makes working with gnu-efi easier.
| Define ``MODULE_TYPE`` in your Makefile and include ``gnu-efi.mk`` in your own projects.

Instructions
------------

1. Sync with ``sync.sh``
1. Build with ``build.sh``
1. Use AARCH64 QEMU to execute the demo app in UEFI Shell -- see ``ajiyengar/qemu-edk2-sdboot`` repo and add it to ``VirtualDrive`` folder.

