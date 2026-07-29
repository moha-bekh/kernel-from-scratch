#include "../include/kernel/inc.h"

#define VGA_MEMORY 0xB8000

static void put_char(char c, int x, int y) {
    uint16_t *video = (uint16_t*)VGA_MEMORY;
    video[y * 80 + x] = (uint8_t)c | (0x0F << 8);
}

void clean_screen() {

	int i = 0;
	while (i < 50) {
		put_char(' ', i, 0);
		int j = 0;
		while (j < 50) {
			put_char(' ', i, j);
			j++;
		}
		i++;
	}
}

void kmain(uint32_t magic_number, multiboot_info_t* mbi) {
	
	if (magic_number != MULTIBOOT_HEADER_MAGIC)
		return ;

	// uint32_t lower;
	// uint32_t upper;

	if (mbi->flags & (1 << 0)) {
		// lower = mbi->mem_lower;
		// upper = mbi->mem_upper;
	}

	clean_screen();

	put_char('4', 0, 0);
	put_char('2', 0, 0);

	while (1) {
		asm volatile ("hlt");
	}
}