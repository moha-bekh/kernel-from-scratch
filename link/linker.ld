ENTRY(_start)

SECTIONS {

    . = 0x00100000;   /* x86 std load addr */

	.multiboot ALIGN(4) : {
		*(.multiboot)
	}

    .text ALIGN(4) : {
        *(.text)
    }

    .rodata : {
		*(.rodata)
	}

    .data : {
		*(.data)
	}

    .bss : {
        __bss_start = .;
        *(.bss)
        *(COMMON)
        __bss_end = .;
    }
}