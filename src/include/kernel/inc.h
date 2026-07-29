#ifndef INC_H
#define INC_H

#include <stdint.h>

#define MULTIBOOT_HEADER_MAGIC 0x2BADB002

typedef struct multiboot_info_s {
	uint32_t flags;
	uint32_t mem_lower;
	uint32_t mem_upper;
	uint32_t boot_device;
	uint32_t cmdline;
	uint32_t mods_count;
	uint32_t mods_addr;
} multiboot_info_t;

void kmain(uint32_t magic_number, multiboot_info_t* mbd);

#endif /* INC_H */