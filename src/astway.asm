.model small

.stack 100H

.data
    
    ; --------------------------- elements --------------------------
    
    ship     db 00H,00H,00H,00H,00H,0FH,07H,0FH,00H,00H
             db 00H,00H,07H,07H,00H,07H,07H,07H,07H,06H
             db 04H,07H,07H,07H,07H,07H,07H,00H,00H,00H
             db 06H,0FH,0FH,0FH,07H,07H,0FH,0FH,00H,00H
             db 00H,00H,00H,00H,0FH,09H,09H,09H,0FH,0FH
             db 00H,00H,00H,00H,0FH,09H,09H,09H,0FH,0FH
             db 04H,0FH,0FH,0FH,07H,07H,0FH,0FH,00H,00H
             db 06H,07H,07H,07H,07H,07H,07H,00H,00H,00H
             db 00H,00H,07H,07H,00H,07H,07H,07H,07H,06H
             db 00H,00H,00H,00H,00H,0FH,02H,0FH,00H,00H
    
    asteroid db 00H,00H,00H,00H,0FH,0FH,00H,00H,00H,00H
             db 00H,00H,0FH,0FH,07H,07H,07H,07H,00H,00H
             db 00H,0FH,07H,07H,0FH,0FH,07H,07H,08H,00H
             db 00H,0FH,07H,07H,07H,07H,08H,08H,08H,08H
             db 07H,07H,07H,0FH,0FH,07H,07H,07H,08H,08H
             db 07H,07H,07H,07H,07H,08H,07H,08H,08H,08H
             db 00H,07H,07H,08H,08H,07H,08H,07H,08H,08H
             db 00H,07H,08H,07H,08H,07H,08H,08H,08H,00H
             db 00H,00H,08H,08H,08H,08H,08H,08H,00H,00H
             db 00H,00H,00H,00H,08H,08H,00H,00H,00H,00H
             
    shield   db 00H,00H,07H,07H,07H,07H,07H,08H,00H,00H
             db 00H,07H,09H,09H,09H,0FH,0FH,0FH,08H,00H
             db 07H,09H,0FH,09H,09H,0FH,0FH,0FH,0FH,08H
             db 07H,09H,09H,09H,09H,0FH,0FH,0FH,0FH,08H
             db 07H,09H,09H,09H,09H,0FH,0FH,0FH,0FH,08H
             db 00H,07H,0FH,0FH,0FH,09H,09H,09H,08H,00H
             db 00H,07H,0FH,0FH,0FH,09H,09H,09H,08H,00H
             db 00H,00H,07H,0FH,0FH,09H,09H,08H,00H,00H
             db 00H,00H,07H,0FH,0FH,09H,09H,08H,00H,00H
             db 00H,00H,00H,07H,08H,08H,08H,00H,00H,00H
           
    life     db 00H,00H,07H,07H,00H,00H,07H,08H,00H,00H
             db 00H,07H,04H,04H,07H,07H,04H,04H,08H,00H
             db 07H,04H,0FH,04H,04H,04H,04H,04H,04H,08H
             db 07H,04H,04H,04H,04H,04H,04H,04H,04H,08H
             db 07H,04H,04H,04H,04H,04H,04H,04H,04H,08H
             db 07H,04H,04H,04H,04H,04H,04H,04H,04H,08H
             db 00H,07H,04H,04H,04H,04H,04H,04H,08H,00H
             db 00H,00H,07H,04H,04H,04H,04H,08H,00H,00H
             db 00H,00H,00H,07H,04H,04H,08H,00H,00H,00H
             db 00H,00H,00H,00H,08H,08H,00H,00H,00H,00H

    ; --------------------------- strings ---------------------------
    
    startup_title db "     _       _               _    _ ",10,13
                  db "    /_\   __| |_ ___ _ _ ___(_)__| |",10,13
                  db "   / _ \ (_-<  _/ -_) '_/ _ \ / _` |",10,13
                  db "  /_/ \_\/__/\__\___|_| \___/_\__,_|",10,13
                  db "          \ \    / /_ _ _  _        ",10,13
                  db "           \ \/\/ / _` | || |       ",10,13
                  db "            \_/\_/\__,_|\_, |       ",10,13
                  db "                        |__/        ",10,13
    
    ; startup screen title length
    startup_title_length equ $-startup_title
    
    ; play option on the startup screen
    startup_play_option db "  Start  "
    
    ; startup screen play option length
    startup_play_option_length equ $-startup_play_option
    
    ; exit option on the startup screen
    startup_exit_option db "  Leave  "
    
    ; startup screen exit option length
    startup_exit_option_length equ $-startup_exit_option
    
    ; game-over title on the final screen
    final_lost_title db "  G A M E  O V E R !  "
                    
    ; game-over title length
    final_lost_title_length equ $-final_lost_title
    
    ; victory title on the final screen
    final_win_title db "Y O U  W I N !"
                    
    ; victory title length
    final_win_title_length equ $-final_win_title
    
    ; -------------------------- constants --------------------------
    
    ; video memory address
    video_memory equ 0A000H
    
    ; game interval in milliseconds (ms)
    run_interval_ms equ 17
    
    ; game interval in microseconds (us)
    run_interval_u equ run_interval_ms * 1000
    
    ; level duration in seconds (s)
    level_interval equ 30
    
    ; number of iterations required to decrease the time bar by one pixel
    ; (1000000 / (150 / level_interval)) / (run_interval * 1000) = 20 * level_interval / (3 * run_interval)
    decrease_time_bar_interval equ 20 * level_interval / (3 * run_interval_ms)
    
    ; shield duration in seconds (s)
    shield_duration equ 5
    
    ; number of iterations corresponding to shield_duration
    shield_duration_interval equ shield_duration * 1000 / run_interval_ms
    
    ; shield cooldown in seconds (s)
    shield_wait_duration equ 10
    
    ; number of iterations corresponding to shield_wait_duration
    shield_wait_interval equ shield_wait_duration * 1000 / run_interval_ms
    
    ; level at which the player wins
    level_win equ 6
    
    ; -------------------------- variables --------------------------
    
    ; ship position
    ship_position dw 0
    
    ; projectile position
    shoot_position dw 0
    
    ; positions of asteroids (i = 0 and i = 1), shield (i = 2), and life (i = 3)
    elements_position dw 4 dup (0)
    
    ; indicates whether all asteroids can spawn
    all_asteroids_spawn db 0
    
    ; current game level
    level db 1
    
    ; ship damage (0 to 10)
    ship_damage db 0
    
    ; indicates whether the shield is active
    shield_active db 0
    
    ; indicates whether the shield is on cooldown
    shield_wait db 1
    
    ; stores the generated pseudorandom number
    pseudo_random_number dw 0
    
.code

; ====================================================================
; Sets the video mode
VIDEO_MODE macro
    mov AX, video_memory
    mov ES, AX
    mov AH, 00H
    mov AL, 13H
    int 10H
endm

; ====================================================================
; Selects the play option on the startup screen
; Parameters:
;       none
; Returns:
;       none
SELECT_PLAY_OPTION proc
    
    mov [startup_play_option], "["
    mov [startup_play_option + 8], "]"
    
    mov [startup_exit_option], " "
    mov [startup_exit_option + 8], " "
    
    ret
endp

; ====================================================================
; Selects the exit option on the startup screen
; Parameters:
;       none
; Returns:
;       none
SELECT_EXIT_OPTION proc
    
    mov [startup_exit_option], "["
    mov [startup_exit_option + 8], "]"
    
    mov [startup_play_option], " "
    mov [startup_play_option + 8], " "
    
    ret
endp

; ====================================================================
; Writes a character string
; Parameters:
;       DH = row
;       DL = column
;       BL = attribute
;       CX = string length
;       ES:BP = address of the beginning of the string
; Returns:
;       none
WRITE_STRING proc
    
    push AX
    push BX

    mov AH, 13H
    mov AL, 1
    xor BH, BH
    int 10H
    
    pop BX
    pop AX

    ret
endp

; ====================================================================
; Draws an element on the screen
; Parameters:
;       DI = position = row * 320 + column
;       SI = sprite offset in memory
; Returns:
;       none
DRAW_ELEMENT proc
    
    push AX
    push BX
    push CX
    push DI
    push SI

    mov CX, 10
    xor BX, BX

DRAW_ELEMENT_PIXEL:

    lodsb
    stosb
    
    loop DRAW_ELEMENT_PIXEL
    
    inc BL
    cmp BL, 10
    je END_DRAW_ELEMENT
    
    ; advances to the next row
    add DI, 310
    mov CX, 10
    jmp DRAW_ELEMENT_PIXEL

END_DRAW_ELEMENT:    
    
    pop SI
    pop DI
    pop CX
    pop BX
    pop AX

    ret
endp

; ====================================================================
; Suspends execution for the interval in CX:DX (microseconds) using
; BIOS interrupt 15H, function AH = 86H. The interval is defined by
; the run_interval constant
; Parameters:
;       none
; Returns:
;       none
DELAY_TIME proc

    push AX
    push CX
    push DX
    
    xor AX, AX
    xor CX, CX
    mov DX, run_interval_u
    
    mov AH, 86H
    int 15H
    
    pop DX
    pop CX
    pop AX
    
    ret
endp

; ====================================================================
; Generates the next pseudorandom number from the previous value (seed)
; stored in pseudo_random_number
; Parameters:
;       none
; Returns:
;       AX = generated number
GENERATE_RANDOM_NUMBER proc
    
    mov AX, 25173
    mul [pseudo_random_number]
    add AX, 13849
    
    mov [pseudo_random_number], AX

    ret
endp

; ====================================================================
; Generates a random position from 18 possible positions
; Parameters:
;       none
; Returns:
;       AX = generated position
RANDOM_INITIALIZATION proc
    
    push BX
    push CX
    push DX

GENERATE_VALID_POSITION:

    call GENERATE_RANDOM_NUMBER
    
    xor DX, DX
    mov BX, 18
    div BX
    
    ; saves the generated position (0 to 18)
    push DX
    
    xor BX, BX
    xor DX, DX
    
CHECK_IS_VALID_POSITION:
    
    ; checks whether the position matches another element
    mov AX, [elements_position + BX]
    
    mov CX, 3200
    div CX
    
    pop DX
    
    ; generates another position when there is a match
    cmp AX, DX
    je GENERATE_VALID_POSITION
    
    
    ; the position is valid when no positions match
    add BX, 2
    cmp BX, 8
    je END_RANDOM_INITIALIZATION
    
    ; compares the next element when the positions do not match
    push DX
    xor DX, DX
    
    jmp CHECK_IS_VALID_POSITION
    
END_RANDOM_INITIALIZATION:    
    
    ; calculates the final position after validation
    mov AX, DX
    
    xor DX, DX
    mov BX, 3200
    mul BX
    
    add AX, 310
    
    pop DX
    pop CX
    pop BX
    
    ret
endp

; ====================================================================
; Draws a rectangle in the specified color
; Parameters:
;       DI = position = row * 320 + column
;       CX = number of columns
;       AH = number of rows
;       AL = color
; Returns:
;       none
DRAW_RECTANGLE proc
    
    push AX
    push BX
    push CX
    push DI
    push SI
    
    mov BX, CX
    
DRAW_RECTANGLE_PIXELS:

    stosb
    
    loop DRAW_RECTANGLE_PIXELS
    
    ; advances to the next row
    mov CX, BX
    sub DI, CX
    add DI, 320
    
    dec AH
    cmp AH, 0
    jne DRAW_RECTANGLE_PIXELS
    
END_DRAW_RECTANGLE:    
    
    pop SI
    pop DI
    pop CX
    pop BX
    pop AX

    ret
endp

; ====================================================================
; Draws the shield indicator
; Parameters:
;       none
; Returns:
;       none
DRAW_SHIELD_INDICATOR proc

    push AX
    push CX

    mov DI, 61597
    mov CX, 6
    mov AH, 6
    
    ; uses color 09H (blue) when the shield is active and 04H (red) otherwise
    cmp [shield_active], 01H
    je COLOR_ACTIVE_INDICATOR
    
    mov AL, 04H
    
    jmp DRAW_SEPARATOR

COLOR_ACTIVE_INDICATOR:

    mov AL, 09H

DRAW_SEPARATOR:

    call DRAW_RECTANGLE
    
    pop CX
    pop AX
    
    ret
endp

; ====================================================================
; Erases an element after a collision or after it reaches the edge of the
; screen, then assigns it a new position
; Parameters:
;       BX = element index in elements_position
; Returns:
;       none
ERASE_ELEMENT proc
    
    push AX
    push CX
    push DI

    ; erases the element
    mov DI, [elements_position + BX]
    mov CX, 10
    mov AH, 10
    mov AL, 00H
    call DRAW_RECTANGLE
    
    cmp BX, 4
    jne GENERATE_NEW_POSITION
    
    mov [shield_wait], 01H

GENERATE_NEW_POSITION:

    ; assigns a new position
    call RANDOM_INITIALIZATION
    
    mov [elements_position + BX], AX

    pop DI
    pop CX
    pop AX
    
    ret
endp

; ====================================================================
; Moves the projectile
; Parameters:
;       none
; Returns:
;       none
PROJECTILE_MOVEMENT proc

    push AX
    push BX
    push CX
    push DX
    push DI
    push SI
    
    ; exits when there is no active projectile
    cmp [shoot_position], 0
    je END_PROJECTILE_MOVEMENT
    
    mov AX, [shoot_position]
    mov DI, AX
    
    ; erases the projectile when it reaches the right edge of the screen
    xor DX, DX
    mov CX, 320
    div CX
    cmp DX, 0
    jz ERASE_PROJECTILE
    
    ; compares bytes with SCASB to detect a collision
    mov AL, [ES]:[DI]
    scasb
    
    ; no collision occurred when the subtraction does not produce zero
    cmp AL, 0
    jne PROJECTILE_COLLISION
    
    ; draws the projectile and erases it from its previous position
    mov AL, 0FH
    stosb
    
    sub DI, 3
    mov AL, 00H
    stosb
    add DI, 2
    
    ; updates the projectile position
    mov [shoot_position], DI
    
    jmp END_PROJECTILE_MOVEMENT
    
PROJECTILE_COLLISION:

    xor BX, BX
    
CHECK_NEXT_PROJECTILE_COLLISION:

    ; checks every element position to identify the element that was hit
    mov AX, [elements_position + BX]
    
    mov CX, DI
    dec DI
    sub CX, AX
    
    cmp CX, 2889
    jbe COLLIDED_ELEMENT
    
    add BX, 2
    
    cmp BX, 8
    je END_PROJECTILE_MOVEMENT
    
    jmp CHECK_NEXT_PROJECTILE_COLLISION
    
COLLIDED_ELEMENT:

    ; erases the collided element
    call ERASE_ELEMENT
  
ERASE_PROJECTILE:

    ; erases the projectile
    mov DI, [shoot_position]
    xor AL, AL
    dec DI
    stosb
    
    mov [shoot_position], 0
    
END_PROJECTILE_MOVEMENT:
    
    pop SI
    pop DI
    pop DX
    pop CX
    pop BX
    pop AX

    ret
endp

; ====================================================================
; Checks for collisions with the ship
; Parameters:
;       none
; Returns:
;       none
CHECK_COLLISIONS proc

    push AX
    push BX
    push CX
    push DX

    xor BX, BX

CHECK_NEXT_ELEMENT_COLLISION:

    ; checks whether the element column is between 141 and 159
    mov AX, [elements_position + BX]
    
    xor DX, DX
    mov CX, 320
    div CX
    
    cmp DX, 159
    ja CHECK_NEXT_ELEMENT
    
    cmp DX, 141
    jb CHECK_NEXT_ELEMENT
    
    ; when the column is in range, checks whether its row is between the
    ; current row minus 9 and the current row plus 9
    push AX 
    mov AX, [ship_position]
    xor DX, DX
    div CX
    
    mov DX, AX
    pop AX
    
    add DX, 9
    cmp AX, DX
    ja CHECK_NEXT_ELEMENT
    
    sub DX, 9
    
    ; does not subtract 9 when the ship row is below 9
    cmp DX, 9
    jb DONT_SUBTRACT
    
    sub DX, 9
    
    jmp CONTINUE_COLLISION_CHECK
    
DONT_SUBTRACT:

    xor DX, DX

CONTINUE_COLLISION_CHECK:
    
    cmp AX, DX
    jb CHECK_NEXT_ELEMENT

    ; erases an element within the collision rows and columns
    call ERASE_ELEMENT
    
    ; checks for a shield collision
    cmp BX, 4
    je SHIELD_COLLISION
    
    ; checks for a life collision
    cmp BX, 6
    je LIFE_COLLISION
    
    ; prevents damage while the shield is active
    cmp [shield_active], 01H
    je CHECK_NEXT_ELEMENT
    
    ; increases ship damage and updates the health bar when the element is
    ; neither a shield nor a life pickup
    inc ship_damage
    
    mov DI, 61758
    
    mov AH, [ship_damage]
    mov AL, 15
    mul AH
   
    sub DI, AX
    mov CX, AX
    mov AH, 6
    mov AL, 0AH
    call DRAW_RECTANGLE
    
CHECK_NEXT_ELEMENT:
    
    add BX, 2
    cmp BX, 8
    jne CHECK_NEXT_ELEMENT_COLLISION
    
    jmp END_COLLISION_CHECK
    
LIFE_COLLISION:

    ; resets ship damage and restores the health bar after collecting a life
    mov DI, 61608
    mov CX, 150
    mov AH, 6
    mov AL, 02H
    call DRAW_RECTANGLE
    
    mov [ship_damage], 00H
    
    jmp CHECK_NEXT_ELEMENT

SHIELD_COLLISION:

    mov [shield_active], 01H
    
    ; activates the shield and draws its indicator after collecting a shield
    call DRAW_SHIELD_INDICATOR
    
    jmp CHECK_NEXT_ELEMENT

END_COLLISION_CHECK:

    pop DX
    pop CX
    pop BX
    pop AX
    
    ret
endp

; ====================================================================
; Moves asteroids, life pickups, and shields
; Parameters:
;       none
; Returns:
;       none
ELEMENTS_MOVEMENT proc
    
    push AX
    push BX
    push CX
    push DX
    push DI
    push SI

    xor BX, BX

NEXT_ELEMENT_MOVEMENT:

    mov AX, [elements_position + BX]
    mov DI, AX
    
    ; checks whether the element reached the edge of the screen
    xor DX, DX
    mov CX, 320
    div CX
    cmp DX, 5
    jb ERASE_CURRENT_ELEMENT
    
    ; assumes an element speed of 1
    mov AX, 1
    mov CX, 1

    cmp BX, 4
    je IS_SHIELD

    cmp BX, 6
    je IS_LIFE
    
    cmp BX, 0
    je IS_LEVEL1_ASTEROID
    
    ; spawns the second asteroid halfway through level 1
    cmp [all_asteroids_spawn], 0
    jz JUMP_NEXT_ELEMENT
    
IS_LEVEL1_ASTEROID:
    
    ; sets asteroid speed to the current level
    mov SI, offset asteroid
    mov AL, [level]
    xor CX, CX
    mov CL, [level]
    jmp ELEMENTS_MOVE_LEFT_DRAW

IS_SHIELD:
    
    ; prevents shields from appearing during level 1
    cmp [level], 1
    je JUMP_NEXT_ELEMENT
    
    cmp [shield_wait], 1
    je JUMP_NEXT_ELEMENT
    
    ; prevents another shield from appearing while one is active
    cmp [shield_active], 01H
    je JUMP_NEXT_ELEMENT

    mov SI, offset shield
    jmp ELEMENTS_MOVE_LEFT_DRAW 

IS_LIFE:
    
    ; spawns a life pickup only when ship damage is greater than 5
    cmp [ship_damage], 5
    jb JUMP_NEXT_ELEMENT

    mov SI, offset life

ELEMENTS_MOVE_LEFT_DRAW:

    ; draws the element
    sub DI, AX
    call DRAW_ELEMENT

    mov [elements_position + BX], DI
    
    ; draws a rectangle to erase pixels left behind after movement
    add DI, 10
    mov AH, 10
    mov AL, 00H
    call DRAW_RECTANGLE
    
JUMP_NEXT_ELEMENT:

    add BX, 2
    cmp BX, 8
    jne NEXT_ELEMENT_MOVEMENT
    
    jmp END_ELEMENTS_MOVEMENT

ERASE_CURRENT_ELEMENT:
    
    ; erases the element
    call ERASE_ELEMENT
    jmp JUMP_NEXT_ELEMENT

END_ELEMENTS_MOVEMENT:

    pop SI
    pop DI
    pop DX
    pop CX
    pop BX
    pop AX

    ret
endp

; ====================================================================
; Moves the ship and handles firing
; Parameters:
;       none
; Returns:
;       none
SHIP_MOVEMENT proc
    
    push AX
    push BX
    push CX
    push DI
    push SI
    
    mov DI, ship_position
    mov SI, offset ship
    
    ; BIOS interrupt 16H, function AH = 01H checks for a buffered keystroke;
    ; ZF is set when the buffer is empty
    mov AH, 01H
    int 16H
    jz END_SHIP_MOVEMENT
    
    ; BIOS interrupt 16H, function AH = 00H reads and removes the keystroke
    mov AH, 00H
    int 16H
    
    ; Space key
    cmp AH, 39H
    je SHIP_SHOOT
    
    ; Up arrow key
    cmp AH, 48H
    je SHIP_MOVE_UP
    
    ; Down arrow key
    cmp AH, 50H
    je SHIP_MOVE_DOWN
    
    jmp END_SHIP_MOVEMENT
    
SHIP_SHOOT:

    ; does not create another projectile while one is active
    cmp [shoot_position], 0
    jne END_SHIP_MOVEMENT

    mov DI, [ship_position]
    add DI, 1612
    mov [shoot_position], DI

    jmp END_SHIP_MOVEMENT
    
SHIP_MOVE_UP:

    ; stops the ship at the top edge of the screen
    cmp DI, 470
    jb END_SHIP_MOVEMENT
    
    ; subtracts 960 to move three rows upward
    sub DI, 960
    call DRAW_ELEMENT
    
    ; saves the ship position and prepares DI to draw the rectangle
    mov [ship_position], DI
    add DI, 3200
    
    jmp ERASE_SHIP_REMAINING_PIXELS
    
SHIP_MOVE_DOWN:

    ; stops the ship when it reaches the bottom panel
    cmp DI, 57430
    ja END_SHIP_MOVEMENT
    
    ; adds 960 to move three rows downward
    add DI, 960
    call DRAW_ELEMENT
    
    ; saves the ship position and prepares DI to draw the rectangle
    mov [ship_position], DI
    sub DI, 960
    
ERASE_SHIP_REMAINING_PIXELS:

    ; draws a three-pixel-high rectangle to erase pixels left by movement
    mov CX, 10
    mov AH, 3
    mov AL, 00H
    call DRAW_RECTANGLE
    
END_SHIP_MOVEMENT:

    pop SI
    pop DI
    pop CX
    pop BX
    pop AX
    
    ret
endp

; ====================================================================
; Updates the time bar size
; Parameters:
;       DX = time bar size
; Returns:
;       DX = updated time bar size
UPDATE_TIME_BAR proc
    
    push AX
    push CX
    push DI

    ; paints the elapsed portion of the time bar
    mov DI, 61591 ; pos(192, 151)
    sub DI, DX
    mov CX, 1
    mov AH, 6
    mov AL, 09H
    call DRAW_RECTANGLE
    
    ; increases the elapsed portion of the time bar
    inc DX
    
    ; enables the second asteroid halfway through level 1
    cmp [level], 1
    jne CONTINUE_UPDATE_TIME_BAR
    
    cmp DX, 75
    jne CONTINUE_UPDATE_TIME_BAR

    mov [all_asteroids_spawn], 1
    
CONTINUE_UPDATE_TIME_BAR:
    
    ; resets the 150-pixel time bar and advances the level when it is full
    cmp DX, 150
    jne END_UPDATE_TIME_BAR
    
    ; resets the time counter
    mov DI, 61442
    mov CX, 150
    mov AH, 6
    mov AL, 01H
    call DRAW_RECTANGLE
    
    ; resets the elapsed portion of the time bar
    xor DX, DX
    
    ; advances the level
    inc [level]
    
END_UPDATE_TIME_BAR:

    pop DI
    pop CX
    pop AX
    
    ret
endp

; ====================================================================
; Checks whether the time bar should be updated
; Parameters:
;       CX = iterations required to decrement the time bar by one pixel
; Returns:
;       CX = remaining iterations
;       DX = updated time bar size
CHECK_TIME_BAR_DECREASE_INTERVAL proc
    
    dec CX
    cmp CX, 0
    jnz END_CHECK_TIME_BAR_DECREASE

    call UPDATE_TIME_BAR
    mov CX, decrease_time_bar_interval
    
END_CHECK_TIME_BAR_DECREASE:
    
    ret
endp

; ====================================================================
; Checks the shield duration
; Parameters:
;       BX = iterations that determine the shield duration
; Returns:
;       BX = remaining iterations
CHECK_SHIELD_DURATION proc

    cmp [shield_active], 01H
    jne END_CHECK_SHIELD_DURATION

    dec BX
    cmp BX, 0
    jne END_CHECK_SHIELD_DURATION
    
    mov [shield_active], 00H

    call DRAW_SHIELD_INDICATOR
    mov BX, shield_duration_interval
    
END_CHECK_SHIELD_DURATION:
    
    ret
endp

; ====================================================================
; Checks the shield cooldown
; Parameters:
;       AX = iterations that determine the shield cooldown
; Returns:
;       AX = remaining iterations
CHECK_SHIELD_WAIT_DURATION proc

    cmp [shield_wait], 01H
    jne END_CHECK_SHIELD_WAIT_DURATION

    dec AX
    cmp AX, 0
    jne END_CHECK_SHIELD_WAIT_DURATION
    
    mov [shield_wait], 00H
    
    mov AX, shield_wait_interval
    
END_CHECK_SHIELD_WAIT_DURATION:
    
    ret
endp

; ====================================================================
; Startup screen
; Parameters:
;       none
; Returns:
;       AL = 0 for Exit or 1 for Play
START_SCREEN proc
    
    push BX
    push CX
    push DX
    push DI
    push SI

    ; enables video mode
    VIDEO_MODE

    ; draws the ship
    mov DI, 28885
    mov SI, offset ship
    call DRAW_ELEMENT
    
    ; draws the asteroid
    add DI, 50
    mov SI, offset asteroid
    call DRAW_ELEMENT
    
    ; draws the life pickup
    add DI, 50
    mov SI, offset life
    call DRAW_ELEMENT
    
    ; draws the shield
    add DI, 50
    mov SI, offset shield
    call DRAW_ELEMENT
    
    ; switches to text-writing mode
    mov AX, @data
    mov ES, AX
    
    call SELECT_PLAY_OPTION

    ; writes the title
    mov BL, 0AH
    mov BP, offset startup_title
    mov CX, startup_title_length
    mov DH, 0H
    mov DL, 0H
    call WRITE_STRING
    
    ; starts with the Play option selected
    mov BH, 1

DRAW_OPTIONS:
 
    ; writes the Play option
    mov BL, 0FH
    mov BP, offset startup_play_option
    mov CX, startup_play_option_length
    mov DH, 16
    mov DL, 16
    call WRITE_STRING
    
    ; writes the Exit option
    mov BP, offset startup_exit_option
    mov CX, startup_exit_option_length
    mov DH, 18
    call WRITE_STRING

WAIT_KEY:
    
    ; BIOS interrupt 16H, function AH = 01H checks for a buffered keystroke;
    ; ZF is set when the buffer is empty
    mov AH, 01H
    int 16H
    jz WAIT_KEY
    
    ; BIOS interrupt 16H, function AH = 00H reads and removes the keystroke
    mov AH, 00H
    int 16H
    
    ; Down arrow key
    cmp AH, 50H
    je DOWN_ARROW
    
    ; Up arrow key
    cmp AH, 48H
    je UP_ARROW
    
    ; Enter key
    cmp AH, 1CH
    je END_START_SCREEN
    
    jmp WAIT_KEY
    
DOWN_ARROW:

    ; selects Exit
    call SELECT_EXIT_OPTION
    
    mov BH, 0
    
    jmp DRAW_OPTIONS
    
UP_ARROW:

    ; selects Play
    call SELECT_PLAY_OPTION
    
    mov BH, 1
    
    jmp DRAW_OPTIONS
    
END_START_SCREEN:

    mov AL, BH

    pop SI
    pop DI
    pop DX
    pop CX
    pop BX
    
    ret
endp

; ====================================================================
; Game screen
; Parameters:
;       none
; Returns:
;       AL = 04H for defeat or 0EH for victory
GAME_SCREEN proc
    
    push BX
    push CX
    push DX
    push DI
    push SI
    
    VIDEO_MODE

    ; draws the bottom panel at position (0, 190)
    mov DI, 60800
    mov CX, 320
    mov AH, 10
    mov AL, 0FH
    call DRAW_RECTANGLE
    
    ; draws the shield indicator at position (192, 157)
    mov DI, 61597
    mov CX, 6
    mov AH, 6
    mov AL, 04H
    call DRAW_RECTANGLE
    
    ; draws the time bar at position (192, 2)
    mov DI, 61442
    mov CX, 150
    mov AH, 6
    mov AL, 01H
    call DRAW_RECTANGLE
    
    ; draws the health bar at position (192, 168)
    mov DI, 61608
    mov CX, 150
    mov AH, 6
    mov AL, 02H
    call DRAW_RECTANGLE
    
    ; draws the ship at the center of the screen, position (90, 150)
    mov DI, 28950
    mov SI, offset ship
    mov [ship_position], DI
    call DRAW_ELEMENT
    
    ; initializes pseudo_random_number from the system clock using BIOS
    ; interrupt 1AH, function AH = 00H, which returns the time in CX:DX
    mov AH, 00H
    int 1AH
    mov [pseudo_random_number], DX
    
    ; controls the time bar update interval
    mov CX, decrease_time_bar_interval
    
    ; tracks the elapsed portion of the time bar
    xor DX, DX
    
    ; tracks the shield duration interval
    mov BX, shield_duration_interval
    
    ; tracks the shield cooldown interval
    mov AX, shield_wait_interval
    
GAME_LOOP:

    call SHIP_MOVEMENT
    
    call PROJECTILE_MOVEMENT
    
    call ELEMENTS_MOVEMENT
    
    call CHECK_COLLISIONS
    
    cmp [ship_damage], 10
    je GAME_OVER
    
    cmp [level], level_win
    je GAME_WIN
    
    call DELAY_TIME
    
    call CHECK_TIME_BAR_DECREASE_INTERVAL
    
    call CHECK_SHIELD_DURATION
   
    call CHECK_SHIELD_WAIT_DURATION

    jmp GAME_LOOP 
    
GAME_OVER:

    mov AL, 04H
    jmp END_GAME_SCREEN
    
GAME_WIN:

    mov AL, 0EH    
    
END_GAME_SCREEN:
    
    pop SI
    pop DI
    pop DX
    pop CX
    pop BX
    
    ret
endp

; ====================================================================
; Final screen
; Parameters:
;       AL = 04H for defeat or 0EH for victory
; Returns:
;       none
FINAL_SCREEN proc
    
    mov DI, 0
    mov CX, 190

DRAW_BACKGROUND:

    push CX
    
    ; paints the screen for defeat or victory with an initialization delay
    mov CX, 320
    mov AH, 1
    call DRAW_RECTANGLE
    
    call DELAY_TIME
    
    add DI, 320
    
    pop CX
    
    loop DRAW_BACKGROUND
    
    push AX
    
    ; paints the black strip below the title
    mov DI, 23360
    mov CX, 320
    mov AH, 20
    mov AL, 0H
    call DRAW_RECTANGLE
    
    ; switches to text-writing mode
    mov AX, @data
    mov ES, AX
    
    pop AX
    
    ; writes the victory or defeat message
    cmp AL, 04H
    je WRITE_GAME_OVER
    
    mov BP, offset final_win_title
    mov CX, final_win_title_length
    mov DL, 0DH
    
    jmp WRITE_FINAL_STRING
    
WRITE_GAME_OVER:

    mov BP, offset final_lost_title
    mov CX, final_lost_title_length
    mov DL, 0AH

WRITE_FINAL_STRING:
    
    ; writes the final message
    mov BL, 0FH
    mov DH, 0AH
    call WRITE_STRING

CHECK_KEYBOARD_BUFFER:

    ; checks for a keystroke in the keyboard buffer
    mov AH, 01H
    int 16H
    jz CHECK_KEYBOARD_BUFFER
    
    ; reads and removes the keystroke from the buffer
    mov AH, 00H
    int 16H
    
    jmp CHECK_KEYBOARD_BUFFER
    
END_FINAL_SCREEN:
    
    ret
endp

; ====================================================================
; Program entry point
MAIN:

    mov AX, @data
    mov DS, AX
    
    call START_SCREEN
    
    cmp AL, 0
    jz END_PROGRAM
    
    call GAME_SCREEN
    
    call FINAL_SCREEN
    
END_PROGRAM:

    ; terminates the program
    mov AH, 4CH
    mov AL, 0
    int 21H

end MAIN
