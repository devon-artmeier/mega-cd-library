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
; Disable Word RAM priority mode
; ------------------------------------------------------------------------------

DisableWordRamPriority:
	andi.b	#~(%11<<MCDR_PM_BIT),MCD_MEM_MODE		; Disable priority mode
	rts

; ------------------------------------------------------------------------------
; Set Word RAM underwrite mode
; ------------------------------------------------------------------------------

SetWordRamUnderwrite:
	move.b	MCD_MEM_MODE,d0					; Set underwrite mode
	andi.b	#~(%11<<MCDR_PM_BIT),d0
	or.b	#MCDR_PM_UNDER,d0
	move.b	d0,MCD_MEM_MODE
	rts

; ------------------------------------------------------------------------------
; Set Word RAM overwrite mode
; ------------------------------------------------------------------------------

SetWordRamOverwrite:
	move.b	MCD_MEM_MODE,d0					; Set overwrite mode
	andi.b	#~(%11<<MCDR_PM_BIT),d0
	or.b	#MCDR_PM_OVER,d0
	move.b	d0,MCD_MEM_MODE
	rts

; ------------------------------------------------------------------------------
; Set Word RAM to 1M/1M mode
; ------------------------------------------------------------------------------

SetWordRam1M:
	bset	#MCDR_MODE_BIT,MCD_MEM_MODE			; Set to 1M/1M mode
	beq.s	SetWordRam1M					; Loop until it's set
	rts

; ------------------------------------------------------------------------------
; Set Word RAM to 2M mode
; ------------------------------------------------------------------------------

SetWordRam2M:
	bclr	#MCDR_MODE_BIT,MCD_MEM_MODE			; Set to 2M mode
	bne.s	SetWordRam2M					; Loop until it's set
	rts

; ------------------------------------------------------------------------------
; Check if Word RAM is in 1M/1M mode
; ------------------------------------------------------------------------------
; RETURNS:
;	eq/ne - 2M mode/1M/1M mode
; ------------------------------------------------------------------------------

CheckWordRam1M:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Check if in 1M/1M mode
	rts

; ------------------------------------------------------------------------------
; Check which Word RAM bank we have access to
; ------------------------------------------------------------------------------
; RETURNS:
;	eq/ne - Bank 0/Bank 1
; ------------------------------------------------------------------------------

CheckWordRamBank:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 1M/1M mode?
	beq.s	.End						; If not, branch

	btst	#MCDR_RET_BIT,MCD_MEM_MODE			; Check which bank we have access to
	eori	#4,sr						; Invert flag

.End:
	rts

; ------------------------------------------------------------------------------
; Swap Word RAM banks (1M/1M mode)
; ------------------------------------------------------------------------------

SwapWordRamBanks:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 1M/1M mode?
	beq.s	.End						; If not, branch

	btst	#MCDR_RET_BIT,MCD_MEM_MODE			; Do we have access to bank 1?
	beq.s	GetWordRam0Access				; If so, get access to bank 0
	bra.s	GetWordRam1Access				; If not, get access to it

.End:
	rts

; ------------------------------------------------------------------------------
; Get access to Word RAM bank 0 (1M/1M mode)
; ------------------------------------------------------------------------------

GetWordRam0Access:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 1M/1M mode?
	beq.s	.End						; If not, branch

.GetAccess:
	bset	#MCDR_RET_BIT,MCD_MEM_MODE			; Get Word RAM 0 access
	beq.s	.GetAccess					; Loop until we have access

.End:
	rts

; ------------------------------------------------------------------------------
; Get access to Word RAM bank 1 (1M/1M mode)
; ------------------------------------------------------------------------------

GetWordRam1Access:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 1M/1M mode?
	beq.s	.End						; If not, branch

.GetAccess:
	bclr	#MCDR_RET_BIT,MCD_MEM_MODE			; Get Word RAM 0 access
	bne.s	.GetAccess					; Loop until we have access

.End:
	rts

; ------------------------------------------------------------------------------
; Check if we have Word RAM access (2M mode)
; ------------------------------------------------------------------------------
; RETURNS:
;	eq/ne - No access/Has access
; ------------------------------------------------------------------------------

CheckWordRamAccess:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 2M mode?
	bne.s	.End						; If not, branch
	btst	#MCDR_DMNA_BIT,MCD_MEM_MODE			; Check if we have Word RAM access

.End:
	rts

; ------------------------------------------------------------------------------
; Wait for Word RAM access (2M mode)
; ------------------------------------------------------------------------------

WaitWordRamAccess:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 2M mode?
	bne.s	.End						; If not, branch

.Wait:
	btst	#MCDR_DMNA_BIT,MCD_MEM_MODE			; Do we have Word RAM access?
	beq.s	.Wait						; If not, wait

.End:
	rts

; ------------------------------------------------------------------------------
; Give Word RAM access to the Main CPU (2M mode)
; ------------------------------------------------------------------------------

GiveWordRamAccess:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 2M mode?
	bne.s	.End						; If not, branch

.Give:
	bset	#MCDR_RET_BIT,MCD_MEM_MODE			; Give Word RAM access
	beq.s	.Give						; Loop until it's given

.End:
	rts

; ------------------------------------------------------------------------------
