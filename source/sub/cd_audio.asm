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
; Start playing CD audio from track
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d0.w - Starting track ID
; ------------------------------------------------------------------------------

StartCdAudioTrack:
	lea	CdAudioParam(pc),a0				; Play from track
	move.w	d0,(a0)
	moveq	#MSCPLAY,d0
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Start playing CD audio from time
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d0.l - Starting timecode
; ------------------------------------------------------------------------------

StartCdAudioTime:
	lea	CdAudioParam(pc),a0				; Play from time
	move.l	d0,(a0)
	moveq	#MSCPLAYT,d0
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Play CD audio track
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d0.w - Track ID
; ------------------------------------------------------------------------------

PlayCdAudioTrack:
	lea	CdAudioParam(pc),a0				; Play track
	move.w	d0,(a0)
	moveq	#MSCPLAY1,d0
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Loop CD audio track
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d0.w - Track ID
; ------------------------------------------------------------------------------

LoopCdAudioTrack:
	lea	CdAudioParam(pc),a0				; Play track
	move.w	d0,(a0)
	moveq	#MSCPLAYR,d0
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Seek to CD audio track
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d0.w - Track ID
; ------------------------------------------------------------------------------

SeekCdAudioTrack:
	lea	CdAudioParam(pc),a0				; Seek to track
	move.w	d0,(a0)
	moveq	#MSCSEEK,d0
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Seek to CD audio time
; ------------------------------------------------------------------------------
; PARAMETERS:
;	d0.l - Timecode
; ------------------------------------------------------------------------------

SeekCdAudioTime:
	lea	CdAudioParam(pc),a0				; Seek to time
	move.l	d0,(a0)
	moveq	#MSCSEEKT,d0
	jmp	_CDBIOS
	
; ------------------------------------------------------------------------------
; Stop CD audio
; ------------------------------------------------------------------------------

StopCdAudio:
	moveq	#MSCSTOP,d0					; Stop CD audio
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Pause CD audio
; ------------------------------------------------------------------------------

PauseCdAudio:
	moveq	#MSCPAUSEON,d0					; Pause CD audio
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Unpause CD audio
; ------------------------------------------------------------------------------

UnpauseCdAudio:
	moveq	#MSCPAUSEOFF,d0					; Unpause CD audio
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Set normal CD audio speed
; ------------------------------------------------------------------------------

NormalSpeedCdAudio:
	moveq	#MSCSCANOFF,d0					; Set normal CD audio speed
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Fast forward CD audio
; ------------------------------------------------------------------------------

FastForwardCdAudio:
	moveq	#MSCSCANFF,d0					; Set fast forward
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; Fast rewind CD audio
; ------------------------------------------------------------------------------

FastRewindCdAudio:
	moveq	#MSCSCANFR,d0					; Set fast rewind
	jmp	_CDBIOS

; ------------------------------------------------------------------------------
; CD audio function parameter
; ------------------------------------------------------------------------------

CdAudioParam:
	dc.l	0

; ------------------------------------------------------------------------------
