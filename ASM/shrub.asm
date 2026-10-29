; @hooks powder,fire

MagicPowderTest:
    ld a,b
    cp CC_EVENT_POWDER
    jr z,.powder

    cp CC_EVENT_FIRE
    jr z,.fire

    jr .unhandled

.powder:
    ld a,$12                     ; Powder sound and stationary flame
    call CC_PlayNoiseSfx

    ld a,$30
    call CC_SpawnFireImpact
    jr .replace                  ; Replace even if no entity slot is free

.fire:
    ld a,$12                     ; Fire Rod sound and replacement
    call CC_PlayNoiseSfx
	jr .replace

.replace:
    ld a,$04                     ; Page 0 tile 04
    scf
    jp CC_Return

.unhandled:
    and a
    jp CC_Return