.include "deps/Header.inc"
.include "deps/InitSnes.asm"

VBlank:   ; Needed to satisfy interrupt definition in "Header.inc"
  RTI

Start:
  InitSnes ; Initialize the SNES
  sep #$20

  ; Force VBlank
  lda #%10000000
  sta $2100

  ; Set background colour registers
  lda #%11100000
  sta $2122
  lda #%00000000
  sta $2122

  ; End VBlank
  lda #%00001111
  sta $2100

  ; Loop
Main:
  jmp Main
