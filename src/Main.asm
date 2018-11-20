.include "deps/Header.inc"
.include "deps/InitSnes.asm"

.include "VBlank.asm"

VBlank:   ; Needed to satisfy interrupt definition in "Header.inc"
  RTI

Start:
  InitSnes ; Initialize the SNES
  SEP #$20 ; Reset Processor Status bits and set accumulator to 8 bits

  ; Initialize background to black
  lda #$00
  sta $2122
  lda #$00
  sta $2122

  GameLoop:
    VBlank_Start

    ; End VBlank
    VBlank_End

  jmp GameLoop

  