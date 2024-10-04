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
; Check for commands
; ------------------------------------------------------------------------------

CheckCommand:
	moveq	#0,d0						; Get command
	move.b	MCD_MAIN_FLAG,d0
	beq.s	.End						; If there is none, branch

	move.b	#"B",MCD_SUB_FLAG				; Mark as busy

.WaitMain:
	tst.b	MCD_MAIN_FLAG					; Has the Main CPU ackhowledged us?
	bne.s	.WaitMain					; If not, wait

	add.w	d0,d0						; Run command
	add.w	d0,d0
	jsr	.Commands-4(pc,d0.w)

	clr.b	MCD_SUB_FLAG					; Mark as ready

.End:
	rts

; ------------------------------------------------------------------------------
; Commands
; ------------------------------------------------------------------------------

.Commands:
	bra.w	StartCdAudioTrackCmd				; Start playing CD audio from track
	bra.w	StartCdAudioTimeCmd				; Start playing CD audio from time
	bra.w	PlayCdAudioTrackCmd				; Play CD audio track
	bra.w	LoopCdAudioTrackCmd				; Loop CD audio track
	bra.w	SeekCdAudioTrackCmd				; Seek to CD audio track
	bra.w	SeekCdAudioTimeCmd				; Seek to CD audio time
	bra.w	StopCdAudio					; Stop CD audio
	bra.w	PauseCdAudio					; Pause CD audio
	bra.w	UnpauseCdAudio					; Unpause CD audio
	bra.w	NormalSpeedCdAudio				; Set normal CD audio speed
	bra.w	FastForwardCdAudio				; Fast forward CD audio
	bra.w	FastReverseCdAudio				; Fast reverse CD audio
	bra.w	DisableWordRamPriority				; Disable Word RAM priority mode
	bra.w	SetWordRamUnderwrite				; Set Word RAM underwrite mode
	bra.w	SetWordRamOverwrite				; Set Word RAM overwrite mode
	bra.w	SetWordRam1M					; Set Word RAM to 1M/1M mode
	bra.w	SetWordRam2M					; Set Word RAM to 2M mode
	bra.w	SwapWordRamBanks				; Swap Word RAM banks
	bra.w	GetWordRam1Access				; Give Word RAM bank 0 access to the Main CPU (1M/1M)
	bra.w	GetWordRam0Access				; Give Word RAM bank 1 access to the Main CPU (1M/1M)
	bra.w	GiveWordRamAccess				; Give Word RAM access to the Main CPU (2M)

; ------------------------------------------------------------------------------
; Start playing CD audio from track
; ------------------------------------------------------------------------------
; PARAMETERS:
;	Comm 0.w - Starting track ID
; ------------------------------------------------------------------------------

StartCdAudioTrackCmd:
	move.w	MCD_MAIN_COMM_0,d0				; Play from track
	bra.w	StartCdAudioTrack

; ------------------------------------------------------------------------------
; Start playing CD audio from time
; ------------------------------------------------------------------------------
; PARAMETERS:
;	Comm 0.l - Starting timecode
; ------------------------------------------------------------------------------

StartCdAudioTimeCmd:
	move.l	MCD_MAIN_COMM_0,d0				; Play from time
	bra.w	StartCdAudioTime

; ------------------------------------------------------------------------------
; Play CD audio track
; ------------------------------------------------------------------------------
; PARAMETERS:
;	Comm 0.w - Track ID
; ------------------------------------------------------------------------------

PlayCdAudioTrackCmd:
	move.w	MCD_MAIN_COMM_0,d0				; Play track
	bra.w	PlayCdAudioTrack

; ------------------------------------------------------------------------------
; Loop CD audio track
; ------------------------------------------------------------------------------
; PARAMETERS:
;	Comm 0.w - Track ID
; ------------------------------------------------------------------------------

LoopCdAudioTrackCmd:
	move.w	MCD_MAIN_COMM_0,d0				; Loop track
	bra.w	LoopCdAudioTrack

; ------------------------------------------------------------------------------
; Seek to CD audio track
; ------------------------------------------------------------------------------
; PARAMETERS:
;	Comm 0.w - Track ID
; ------------------------------------------------------------------------------

SeekCdAudioTrackCmd:
	move.w	MCD_MAIN_COMM_0,d0				; Seek to track
	bra.w	SeekCdAudioTrack

; ------------------------------------------------------------------------------
; Seek to CD audio time
; ------------------------------------------------------------------------------
; PARAMETERS:
;	Comm 0.l - Timecode
; ------------------------------------------------------------------------------

SeekCdAudioTimeCmd:
	move.l	MCD_MAIN_COMM_0,d0				; Seek to time
	bra.w	SeekCdAudioTime

; ------------------------------------------------------------------------------
