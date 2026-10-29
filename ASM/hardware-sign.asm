; @hooks buttons
; Hardware Detection Test

HardwareDialog:
    CC_IsButtonAB					; Pressed A or B button
    jr nz,.unhandled

    call CC_GetHardwareType
    jr nc,.unhandled              	; Hardware detection unavailable.

    cp CC_HARDWARE_GBA
    jr z,.gba

    cp CC_HARDWARE_GBC
    jr z,.gbc

    jr .unhandled                 	; Other hardware, no dialog.

.gba:
    ld de,$011                    	; Play Dialog ID 011, "You are playing on a GBA"
    jr .show

.gbc:
    ld de,$010                    	; Play Dialog ID 010, "You are playing on a GBC"

.show:
    call CC_ShowDialog
    jp CC_Return

.unhandled:
    and a
    jp CC_Return
