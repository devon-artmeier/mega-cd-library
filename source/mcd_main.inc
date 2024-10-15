; ------------------------------------------------------------------------------
; Sega Mega CD Library
; ------------------------------------------------------------------------------
; Copyright (c) 2024 Devon Artmeier
;
; Permission to use, copy, modify, and/or distribute this software
; for any purpose with or without fee is hereby granted.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
; WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIE
; WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
; AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
; DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
; PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER 
; TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
; PERFORMANCE OF THIS SOFTWARE.
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Addresses
; ------------------------------------------------------------------------------

; Mode 2 memory mapping
CARTRIDGE		equ 0x400000				; Cartridge start
EXPANSION		equ 0					; Expansion start

; Mode 1 memory mapping
;CARTRIDGE		equ 0					; Cartridge start
;EXPANSION		equ 0x400000				; Expansion start
	
; Cartridge
CARTRIDGE_SIZE		equ 0x000000				; Cartridge size
CARTRIDGE_END		equ CARTRIDGE+CARTRIDGE_SIZE		; Cartridge end

; Expansion
EXPANSION_SIZE		equ 0x400000				; Expansion memory end
EXPANSION_END		equ EXPANSION+EXPANSION_SIZE		; Expansion memory size

; Mega CD BIOS ROM
CD_BIOS			equ EXPANSION				; BIOS start
CD_BIOS_SIZE		equ 0x20000				; BIOS size
CD_BIOS_END		equ CD_BIOS+CD_BIOS_SIZE		; BIOS end

; Mega CD PRG-RAM
PRG_RAM_BANK		equ EXPANSION+0x20000			; Program RAM bank start
PRG_RAM_BANK_SIZE	equ 0x40000				; Program RAM bank size
PRG_RAM_BANK_END	equ PRG_RAM_BANK+PRG_RAM_BANK_SIZE	; Program RAM bank end

; Mega CD Word RAM
WORD_RAM_1M		equ EXPANSION+0x200000			; Word RAM start (1M/1M)
WORD_RAM_1M_SIZE	equ 0x20000				; Word RAM size (1M/1M)
WORD_RAM_1M_END		equ WORD_RAM_1M+WORD_RAM_1M_SIZE	; Word RAM end (1M/1M)
WORD_RAM_2M		equ EXPANSION+0x200000			; Word RAM start (2M)
WORD_RAM_2M_SIZE	equ 0x40000				; Word RAM size (2M)
WORD_RAM_2M_END		equ WORD_RAM_2M+WORD_RAM_2M_SIZE	; Word RAM end (2M)
WORD_RAM_IMAGE		equ EXPANSION+0x220000			; Word RAM image start (1M/1M)
WORD_RAM_IMAGE_SIZE	equ 0x20000				; Word RAM image size (1M/1M)
WORD_RAM_IMAGE_END	equ WORD_RAM_IMAGE+WORD_RAM_IMAGE_SIZE	; Word RAM image size (1M/1M)

; Backup RAM cartridge
RAM_CART_ID		equ CARTRIDGE+1				; RAM cartridge ID
RAM_CART_DATA		equ CARTRIDGE+0x200001			; RAM cartridge data
RAM_CART_DATA_SIZE	equ 0x80000				; RAM cartridge data size
RAM_CART_DATA_END	equ RAM_CART_DATA+RAM_CART_DATA_SIZE	; RAM cartridge data end
RAM_CART_PROTECT	equ CARTRIDGE+0x3FFFFF			; RAM cartridge memory protection flag

; Special cartridge
SPECIAL_CART_ID		equ CARTRIDGE+0x10			; Special cartridge ID
SPECIAL_CART_START	equ CARTRIDGE+0x20			; Special cartridge entry point

; Z80 RAM
Z80_RAM			equ 0xA00000				; Z80 RAM start
Z80_RAM_SIZE		equ 0x2000				; Z80 RAM size
Z80_RAM_END		equ Z80_RAM+Z80_RAM_SIZE		; Z80 RAM end

; YM2612
YM_ADDR_0		equ 0xA04000				; YM2612 address port 0
YM_DATA_0		equ 0xA04001				; YM2612 data port 0
YM_ADDR_1		equ 0xA04002				; YM2612 address port 1
YM_DATA_1		equ 0xA04003				; YM2612 data port 1

; I/O
IO_REGS			equ 0xA10000				; I/O registers base
VERSION			equ 0xA10001				; Hardware version
IO_DATA_1		equ 0xA10003				; I/O port 1 data
IO_DATA_2		equ 0xA10005				; I/O port 2 data
IO_DATA_3		equ 0xA10007				; I/O port 3 data
IO_CTRL_1		equ 0xA10009				; I/O port 1 control
IO_CTRL_2		equ 0xA1000B				; I/O port 2 control
IO_CTRL_3		equ 0xA1000D				; I/O port 3 control

; Z80 bus
Z80_BUS			equ 0xA11100				; Z80 bus request
Z80_RESET		equ 0xA11200				; Z80 reset

; Mega CD registers
MCD_REGS		equ 0xA12000				; Mega CD registers base
MCD_IRQ2		equ 0xA12000				; IRQ2 request
MCD_RESET		equ 0xA12001				; Reset
MCD_PROTECT		equ 0xA12002				; Program RAM write protection
MCD_MEM_MODE		equ 0xA12003				; Memory mode
MCD_CDC_DEVICE		equ 0xA12004				; CDC device destination
MCD_USER_HBLANK		equ 0xA12006				; User H-BLANK interrupt address
MCD_CDC_HOST		equ 0xA12008				; CDC data
MCD_STOPWATCH		equ 0xA1200C				; Stopwatch
MCD_COMM_FLAGS		equ 0xA1200E				; Communication flags
MCD_MAIN_FLAG		equ 0xA1200E				; Main CPU communication flag
MCD_SUB_FLAG		equ 0xA1200F				; Sub CPU communication flag
MCD_MAIN_COMMS		equ 0xA12010				; Main CPU communication registers
MCD_MAIN_COMM_0		equ 0xA12010				; Main CPU communication register 0
MCD_MAIN_COMM_1		equ 0xA12011				; Main CPU communication register 1
MCD_MAIN_COMM_2		equ 0xA12012				; Main CPU communication register 2
MCD_MAIN_COMM_3		equ 0xA12013				; Main CPU communication register 3
MCD_MAIN_COMM_4		equ 0xA12014				; Main CPU communication register 4
MCD_MAIN_COMM_5		equ 0xA12015				; Main CPU communication register 5
MCD_MAIN_COMM_6		equ 0xA12016				; Main CPU communication register 6
MCD_MAIN_COMM_7		equ 0xA12017				; Main CPU communication register 7
MCD_MAIN_COMM_8		equ 0xA12018				; Main CPU communication register 8
MCD_MAIN_COMM_9		equ 0xA12019				; Main CPU communication register 9
MCD_MAIN_COMM_10	equ 0xA1201A				; Main CPU communication register 10
MCD_MAIN_COMM_11	equ 0xA1201B				; Main CPU communication register 11
MCD_MAIN_COMM_12	equ 0xA1201C				; Main CPU communication register 12
MCD_MAIN_COMM_13	equ 0xA1201D				; Main CPU communication register 13
MCD_MAIN_COMM_14	equ 0xA1201E				; Main CPU communication register 14
MCD_MAIN_COMM_15	equ 0xA1201F				; Main CPU communication register 15
MCD_SUB_COMMS		equ 0xA12020				; Sub CPU communication registers
MCD_SUB_COMM_0		equ 0xA12020				; Sub CPU communication register 0
MCD_SUB_COMM_1		equ 0xA12021				; Sub CPU communication register 1
MCD_SUB_COMM_2		equ 0xA12022				; Sub CPU communication register 2
MCD_SUB_COMM_3		equ 0xA12023				; Sub CPU communication register 3
MCD_SUB_COMM_4		equ 0xA12024				; Sub CPU communication register 4
MCD_SUB_COMM_5		equ 0xA12025				; Sub CPU communication register 5
MCD_SUB_COMM_6		equ 0xA12026				; Sub CPU communication register 6
MCD_SUB_COMM_7		equ 0xA12027				; Sub CPU communication register 7
MCD_SUB_COMM_8		equ 0xA12028				; Sub CPU communication register 8
MCD_SUB_COMM_9		equ 0xA12029				; Sub CPU communication register 9
MCD_SUB_COMM_10		equ 0xA1202A				; Sub CPU communication register 10
MCD_SUB_COMM_11		equ 0xA1202B				; Sub CPU communication register 11
MCD_SUB_COMM_12		equ 0xA1202C				; Sub CPU communication register 12
MCD_SUB_COMM_13		equ 0xA1202D				; Sub CPU communication register 13
MCD_SUB_COMM_14		equ 0xA1202E				; Sub CPU communication register 14
MCD_SUB_COMM_15		equ 0xA1202F				; Sub CPU communication register 15

; TMSS
TMSS_SEGA		equ 0xA14000				; TMSS write register

; VDP/PSG
VDP_DATA		equ 0xC00000				; VDP data port
VDP_CTRL		equ 0xC00004				; VDP control port
VDP_HV			equ 0xC00008				; VDP H/V counter
PSG_CTRL		equ 0xC00011				; PSG control port

; Work RAM
WORK_RAM		equ 0xFF0000				; Work RAM start
WORK_RAM_SIZE		equ 0x10000				; Work RAM size
WORK_RAM_END		equ WORK_RAM+WORK_RAM_SIZE		; Work RAM end

; ------------------------------------------------------------------------------
; BIOS entry points
; ------------------------------------------------------------------------------

_EXCPT			equ 0xFFFFFD00				; Exception
_LEVEL6			equ 0xFFFFFD06				; V-BLANK interrupt
_LEVEL4			equ 0xFFFFFD0C				; H-BLANK interrupt
_LEVEL2			equ 0xFFFFFD12				; External interrupt
_TRAP00			equ 0xFFFFFD18				; TRAP #00
_TRAP01			equ 0xFFFFFD1E				; TRAP #01
_TRAP02			equ 0xFFFFFD24				; TRAP #02
_TRAP03			equ 0xFFFFFD2A				; TRAP #03
_TRAP04			equ 0xFFFFFD30				; TRAP #04
_TRAP05			equ 0xFFFFFD36				; TRAP #05
_TRAP06			equ 0xFFFFFD3C				; TRAP #06
_TRAP07			equ 0xFFFFFD42				; TRAP #07
_TRAP08			equ 0xFFFFFD48				; TRAP #08
_TRAP09			equ 0xFFFFFD4E				; TRAP #09
_TRAP10			equ 0xFFFFFD54				; TRAP #10
_TRAP11			equ 0xFFFFFD5A				; TRAP #11
_TRAP12			equ 0xFFFFFD60				; TRAP #12
_TRAP13			equ 0xFFFFFD66				; TRAP #13
_TRAP14			equ 0xFFFFFD6C				; TRAP #14
_TRAP15			equ 0xFFFFFD72				; TRAP #15
_CHKERR			equ 0xFFFFFD78				; CHK exception
_ADRERR			equ 0xFFFFFD7E				; Address error
_CODERR			equ 0xFFFFFD7E				; Illegal instruction
_DIVERR			equ 0xFFFFFD84				; Division by zero
_TRPERR			equ 0xFFFFFD8A				; TRAPV exception
_NOCOD0			equ 0xFFFFFD90				; Line A emulator
_NOCOD1			equ 0xFFFFFD96				; Line F emulator
_SPVERR			equ 0xFFFFFD9C				; Privilege violation
_TRACE			equ 0xFFFFFDA2				; TRACE exception
_BURAM			equ 0xFFFFFDAE				; Cartridge Backup RAM function

; ------------------------------------------------------------------------------
; Register bits
; ------------------------------------------------------------------------------

; VERSION
VERR_VER_BIT		equ 0					; Hardware version
VERR_VER		equ 1<<VERR_VER_BIT
VERR_DISK_BIT		equ 5					; Expansion connected flag
VERR_DISK		equ 1<<VERR_DISK
VERR_VMOD_BIT		equ 6					; Video mode flag
VERR_VMOD		equ 1<<VERR_VMOD_BIT
VERR_MODE_BIT		equ 7					; Region flag
VERR_MODE		equ 1<<VERR_MODE_BIT

; Z80_BUS
Z80R_BUSREQ_BIT		equ 0					; Z80 bus request flag
Z80R_BUSREQ		equ 1<<Z80R_BUSREQ_BIT
Z80R_RESET_BIT		equ 0					; Z80 reset flag
Z80R_RESET		equ 1<<Z80R_RESET_BIT

; MCD_IRQ2
MCDR_IFL2_BIT		equ 0					; IRQ2 trigger flag
MCDR_IFL2		equ 1<<MCDR_IFL2_BIT
MCDR_IEN2_BIT		equ 7					; IRQ2 enabled flag
MCDR_IEN2		equ 1<<MCDR_IEN2_BIT

; MCD_RESET
MCDR_SRES_BIT		equ 0					; Reset flag
MCDR_SRES		equ 1<<MCDR_SRES_BIT
MCDR_SBRQ_BIT		equ 1					; Bus request flag
MCDR_SBRQ		equ 1<<MCDR_SBRQ_BIT
	
; MCD_MEM_MODE
MCDR_RET_BIT		equ 0					; Main CPU Word RAM access flag
MCDR_RET		equ 1<<MCDR_RET_BIT
MCDR_DMNA_BIT		equ 1					; Sub CPU Word RAM access flag
MCDR_DMNA		equ 1<<MCDR_DMNA_BIT
MCDR_MODE_BIT		equ 2					; Word RAM mode
MCDR_MODE		equ 1<<MCDR_MODE_BIT

; MCD_CDC_DEVICE
MCDR_MAIN_READ		equ 2					; Main CPU read
MCDR_SUB_READ		equ 3					; Sub CPU read
MCDR_PCM_DMA		equ 4					; PCM wave RAM DMA
MCDR_PRG_DMA		equ 5					; Program RAM DMA
MCDR_WORD_DMA		equ 7					; Word RAM DMA
MCDR_DSR_BIT		equ 6					; Data set ready flag
MCDR_DSR		equ 1<<MCDR_DSR_BIT
MCDR_EDT_BIT		equ 7					; End of data transfer flag
MCDR_EDT		equ 1<<MCDR_EDT_BIT

; VDP_CTRL
VDPR_PAL_BIT		equ 0					; PAL mode flag
VDPR_PAL		equ 1<<VDPR_PAL_BIT
VDPR_DMA_BIT		equ 1					; DMA flag
VDPR_DMA		equ 1<<VDPR_DMA_BIT
VDPR_HB_BIT		equ 2					; H-BLANK flag
VDPR_HB			equ 1<<VDPR_HB_BIT
VDPR_VB_BIT		equ 3					; V-BLANK flag
VDPR_VB			equ 1<<VDPR_VB_BIT
VDPR_ODD_BIT		equ 4					; Odd interlaced frame flag
VDPR_ODD		equ 1<<VDPR_ODD_BIT
VDPR_C_BIT		equ 5					; Sprite collision flag
VDPR_C			equ 1<<VDPR_C_BIT
VDPR_SOVR_BIT		equ 6					; Too many sprites on scanline flag
VDPR_SOVR		equ 1<<VDPR_SOVR_BIT
VDPR_F_BIT		equ 7					; V-BLANK interrupt flag
VDPR_F			equ 1<<VDPR_F_BIT
VDPR_FULL_BIT		equ 8					; FIFO full flag
VDPR_FULL		equ 1<<VDPR_FULL_BIT
VDPR_EMPT_BIT		equ 8					; FIFO empty flag
VDPR_EMPT		equ 1<<VDPR_EMPT_BIT

; VDP register 00
VDPR_M3_BIT		equ 1					; H/V counter latch flag
VDPR_M3			equ 1<<VDPR_M3_BIT
VDPR_IE1_BIT		equ 4					; H-BLANK interrupt enable flag
VDPR_IE1		equ 1<<VDPR_IE1_BIT
VDPR_L_BIT		equ 5					; Leftmost 8 pixels blanked flag
VDPR_L			equ 1<<VDPR_L_BIT

; VDP register 01
VDPR_M5_BIT		equ 2					; Mode 5 (Mega Drive mode) flag
VDPR_M5			equ 1<<VDPR_M5_BIT
VDPR_M2_BIT		equ 3					; V30 mode flag (PAL only)
VDPR_M2			equ 1<<VDPR_M2_BIT
VDPR_M1_BIT		equ 4					; DMA enable flag
VDPR_M1			equ 1<<VDPR_M1_BIT
VDPR_IE0_BIT		equ 5					; V-BLANK interrupt enable flag
VDPR_IE0		equ 1<<VDPR_IE0_BIT
VDPR_DISP_BIT		equ 6					; Display enable flag
VDPR_DISP		equ 1<<VDPR_DISP_BIT
VDPR_VRAM_BIT		equ 7					; 128 KiB VRAM mode flag
VDPR_VRAM		equ 1<<VDPR_VRAM_BIT

; VDP register 02
VDPR_SA_SHIFT		equ 10					; Plane A address shift
VDPR_SA_MASK		equ %00111000				; Plane A address mask

; VDP register 03
VDPR_WD_SHIFT		equ 10					; Window plane address shift
VDPR_WD_MASK		equ %00111110				; Window plane address mask

; VDP register 04
VDPR_SB_SHIFT		equ 13					; Plane B address shift
VDPR_SB_MASK		equ %00000111				; Plane B address mask

; VDP register 05
VDPR_AT_SHIFT		equ 9					; Sprite table address shift
VDPR_AT_MASK_H32	equ %01111111				; Sprite table address mask (H32 mode)
VDPR_AT_MASK_H40	equ %01111110				; Sprite table address mask (H40 mode)

; VDP register 07
VDPR_COL_BIT		equ 0					; Background color index
VDPR_CPT_BIT		equ 4					; Background color palette line

; VDP register 0B
VDPR_LSCR_BIT		equ 0					; Horizontal scroll mode (low)
VDPR_LSCR		equ 1<<VDPR_LSCR_BIT
VDPR_HSCR_BIT		equ 1					; Horizontal scroll mode (high)
VDPR_HSCR		equ 1<<VDPR_HSCR_BIT
VDPR_HSCR_FULL		equ 0<<VDPR_LSCR_BIT			; Full horizontal scroll mode
VDPR_HSCR_BLOCK		equ 2<<VDPR_LSCR_BIT			; Block horizontal scroll mode
VDPR_HSCR_LINE		equ 3<<VDPR_LSCR_BIT			; Line horizontal scroll mode
VDPR_VSCR_BIT		equ 2					; Vertical scroll mode
VDPR_VSCR_FULL		equ 0<<VDPR_VSCR_BIT			; Full vertical scroll mode
VDPR_VSCR_BLOCK		equ 1<<VDPR_VSCR_BIT			; Block vertical scroll mode
VDPR_IE2_BIT		equ 3					; External interrupt enable flag
VDPR_IE2		equ 1<<VDPR_IE2_BIT

; VDP register 0C
VDPR_RS1_BIT		equ 0					; Horizontal resolution mode (low)
VDPR_RS1		equ 1<<VDPR_RS1_BIT
VDPR_LSM_BIT		equ 1					; Interlace mode
VDPR_LSM_OFF		equ 0<<VDPR_LSM_BIT			; No interlace
VDPR_LSM_ON		equ 1<<VDPR_LSM_BIT			; Interlace enabled
VDPR_LSM_2X		equ 3<<VDPR_LSM_BIT			; Double resolution interlace mode
VDPR_STE_BIT		equ 3					; Shadow/highlight mode flag
VDPR_STE		equ 1<<VDPR_STE_BIT
VDPR_RS0_BIT		equ 7					; Horizontal resolution mode (high)
VDPR_RS0		equ 1<<VDPR_RS0_BIT
VDPR_RS_H32		equ 0					; H32 mode
VDPR_RS_H40		equ VDPR_RS1|VDPR_RS0			; H40 mode

; VDP register 0D
VDPR_HS_SHIFT		equ 10					; Horizontal scroll table address shift
VDPR_HS_MASK		equ %00111111				; Horizontal scroll table address mask

; VDP register 10
VDPR_HSZ_BIT		equ 0					; Horizontal plane size
VDPR_HSZ_32		equ 0<<VDPR_HSZ_BIT			; 32 tile wide plane
VDPR_HSZ_64		equ 1<<VDPR_HSZ_BIT			; 64 tile wide plane
VDPR_HSZ_128		equ 3<<VDPR_HSZ_BIT			; 128 tile wide plane
VDPR_VSZ_BIT		equ 4					; Vertical plane size
VDPR_VSZ_32		equ 0<<VDPR_VSZ_BIT			; 32 tile wide plane
VDPR_VSZ_64		equ 1<<VDPR_VSZ_BIT			; 64 tile tall plane
VDPR_VSZ_128		equ 3<<VDPR_VSZ_BIT			; 128 tile tall plane

; VDP register 11
VDPR_RIGT_BIT		equ 7					; Window plane horizontal direction
VDPR_RIGT		equ 1<<VDPR_RIGT_BIT

; VDP register 12
VDPR_DOWN_BIT		equ 7					; Window plane vertical direction
VDPR_DOWN		equ 1<<VDPR_DOWN_BIT

; ------------------------------------------------------------------------------
; BIOS function codes
; ------------------------------------------------------------------------------

BRMINIT			equ 0					; Initialize Backup RAM interaction
BRMSTAT			equ 1					; Get Backup RAM status
BRMSERCH		equ 2					; Search Backup RAM
BRMREAD			equ 3					; Read Backup RAM data
BRMWRITE		equ 4					; Write Backup RAM data
BRMDEL			equ 5					; Delete Backup RAM data
BRMFORMAT		equ 6					; Format Backup RAM
BRMDIR			equ 7					; Get Backup RAM directory
BRMVERIFY		equ 8					; Verify written Backup RAM data

; ------------------------------------------------------------------------------
