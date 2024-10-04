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
	eori	#4,sr						; Invert flag

.End:
	rts

; ------------------------------------------------------------------------------
; Wait for Word RAM access (2M mode)
; ------------------------------------------------------------------------------

WaitWordRamAccess:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 2M mode?
	bne.s	.End						; If not, branch

.Wait:
	btst	#MCDR_RET_BIT,MCD_MEM_MODE			; Do we have Word RAM access?
	beq.s	.Wait						; If not, wait

.End:
	rts

; ------------------------------------------------------------------------------
; Give Word RAM access to the Sub CPU (2M mode)
; ------------------------------------------------------------------------------

GiveWordRamAccess:
	btst	#MCDR_MODE_BIT,MCD_MEM_MODE			; Are we in 2M mode?
	bne.s	.End						; If not, branch

.Give:
	bset	#MCDR_DMNA_BIT,MCD_MEM_MODE			; Give Word RAM access
	beq.s	.Give						; Loop until it's given

.End:
	rts

; ------------------------------------------------------------------------------
