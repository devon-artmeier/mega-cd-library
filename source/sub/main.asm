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
; Initialize system program
; ------------------------------------------------------------------------------

Initialize:
	move.b	#"I",MCD_SUB_FLAG				; Mark as initializing
	andi.b	#~(MCDR_MODE|MCDR_RET),MCD_MEM_MODE		; Set to 2M mode
	
UserCall:
	rts

; ------------------------------------------------------------------------------
; Main routine
; ------------------------------------------------------------------------------

Main:
	bsr.w	UserInitialize					; Call user initialization

.WaitMainReady:
	cmpi.b	#"R",MCD_MAIN_FLAG				; Is the Main CPU ready?
	bne.s	.WaitMainReady					; If not, wait

	move.b	#"R",MCD_SUB_FLAG				; Tell the Main CPU we are ready

.WaitMainStart:
	tst.b	MCD_MAIN_FLAG					; Is the Main CPU ready to send commands?
	bne.s	.WaitMainStart					; If not, wait

	clr.b	MCD_SUB_FLAG					; Mark as ready

; ------------------------------------------------------------------------------

.Loop:
	bsr.w	CommandHandler					; Check for commands
	bra.s	.Loop						; Loop

; ------------------------------------------------------------------------------
; Mega Drive interrupt
; ------------------------------------------------------------------------------

MegaDriveIrq:
	rts

; ------------------------------------------------------------------------------
