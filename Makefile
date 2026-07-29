BUILD_DIR = build

ASM_SRCS = \
	src/boot/boot.asm \
	src/boot/multiboot.asm

C_SRCS = \
	src/kernel/kmain.c

OBJS := $(patsubst src/%.c, $(BUILD_DIR)/%.o, $(C_SRCS)) \
		$(patsubst src/%.asm, $(BUILD_DIR)/%.o, $(ASM_SRCS))

ELF = iso/boot/kfs.elf
all: $(ELF)

build/%.o: src/%.asm
	mkdir -p $(dir $@)
	nasm -f elf32 $< -o $@

CFLAGS = -ffreestanding -m32 -nostdlib -Wall -Wextra -fno-pic
INC := -I src/include/kernel
build/%.o: src/%.c
	mkdir -p $(dir $@)
	gcc $(CFLAGS) $(INC) -c $< -o $@

LDFLAGS = -m elf_i386 -T link/linker.ld -nostdlib
$(ELF): $(OBJS)
	mkdir -p iso/boot
	ld $(LDFLAGS) -o $(ELF) $^

ISO = $(BUILD_DIR)/iso/kfs.iso
$(ISO): $(ELF)
	mkdir -p build/iso
	grub-mkrescue iso -o $(ISO)

QEMU_FLAGS = -no-reboot -no-shutdown -d int,cpu_reset
run: $(ISO)
	qemu-system-i386 -cdrom $(ISO) $(QEMU_FLAGS)

clean:
	rm -rf build $(ELF)
