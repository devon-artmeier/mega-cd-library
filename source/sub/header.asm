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
; Module header
; ------------------------------------------------------------------------------

ModuleHeader:
	dc.b	"MAIN       "					; Module name
	dc.b	0						; Don't run code at start address
	dc.w	$100						; Version
	dc.w	0						; Type (unused)
	dc.l	$00000000					; Next module
	dc.l	$00000000					; Module size (unused)
	dc.l	.Offsets-ModuleHeader				; Start offset
	dc.l	$00000000					; Work RAM address (unused)

; ------------------------------------------------------------------------------

.Offsets:
	dc.w	Initialize-.Offsets				; Initialization
	dc.w	Main-.Offsets					; Main
	dc.w	MegaDriveIrq-.Offsets				; Mega Drive interrupt
	dc.w	UserCall-.Offsets				; User call
	dc.w	0

; ------------------------------------------------------------------------------
