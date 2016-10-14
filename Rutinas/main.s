/* Universidad del Valle de Guatemala */
/* Taller de Assembler - Seccion 31 */
/* Juan Andres Garcia - 15046 */
/* Rodrigo Barrios - 15009 */
/* Guatemala, septiembre 2 de 2016 */

.text
.balign 4
.global main
.func main 

main:

	#obtenemos primero la direccion de la pantalla
	bl getScreenAddr
    ldr r1,=pixelAddr
	str r0,[r1]
	
	ldr r0,=introWidth
	ldr r0,[r0]
	ldr r1,=introHeight
	ldr r1,[r1]
	ldr r2,=intro
	bl pintar_imagen

	@ Utilizando la biblioteca GPIO (gpio0_2.s)
	bl GetGpioAddress @solo se llama una vez
	mov r5,#0
	@ Definicion de pines 26, 19 y 13 (lectura)
	@ 26 BOTON "A"
	@ 19 BOTON "B"
	@ 13 BOTON "C"
	mov r0,#26
	mov r1,#0
	bl SetGpioFunction
	mov r0,#19
	mov r1,#0
	bl SetGpioFunction
	mov r0,#13
	mov r1,#0
	bl SetGpioFunction

/* Verificar si alguien presiono "B" */
loop1:
	mov r0,#19
	bl GetGpio /* Verifica estado puerto 19 */
	cmp r0,#0
	beq loop1
	mov r0,#0x7800000
	bl delay
inicio:	/* Pintar fondo del juego cuando se encuentre presionado el boton */
	mov r0,#0
	ldr r0,=VerdeQuietoWidth
	ldr r0,[r0]
	mov r1,#0
	ldr r1,=VerdeQuietoHeight 
	ldr r1,[r1]
	mov r2,#0
	ldr r2,=VerdeQuieto @ Ahorita tira naranja, penal 1
	bl pintar_imagen
	bl pelotaC0
	mov r0,#0x7800000
	bl delay

loop2:

	mov r0,#26
	bl GetGpio /* Verifica estado puerto 26 */
	cmp r0,#0
	bne TiraIzquierda

	mov r0,#19
	bl GetGpio /* Verifica estado puerto 19 */
	cmp r0,#0
	bne TiraCentro	

	mov r0,#13
	bl GetGpio /* Verifica estado puerto 13 */
	cmp r0,#0
	bne TiraDerecha

	b loop2

TiraIzquierda:
	/* Almacenar decision de tirador naranja a la izquierda - jugador 1*/
	mov r0,#0x7800000
	bl delay
	mov r0,#1
	ldr r1,=decision_n
	str r0,[r1]
	b loop3
TiraCentro:
	/* Almacenar decision de tirador naranja a la centro - jugador 1*/
	mov r0,#0x7800000
	bl delay
	mov r0,#2
	ldr r1,=decision_n
	str r0,[r1]
	b loop3
TiraDerecha:
	/* Almacenar decision de tirador naranja a la derecha - jugador 1*/
	mov r0,#0x7800000
	bl delay
	mov r0,#3
	ldr r1,=decision_n
	str r0,[r1]
	b loop3

loop3:
	mov r0,#0
	mov r0,#26
	bl GetGpio /* Verifica estado puerto 26 */
	cmp r0,#0
	bne ParaIzquierda

	mov r0,#0
	mov r0,#19
	bl GetGpio /* Verifica estado puerto 19 */
	cmp r0,#0
	bne ParaCentro	

	mov r0,#0
	mov r0,#13
	bl GetGpio /* Verifica estado puerto 13 */
	cmp r0,#0
	bne ParaDerecha

	b loop3

ParaIzquierda:
	/* Almacenar decision de tirador naranja a la izquierda - jugador 1*/
	mov r0,#1
	ldr r1,=decision_v
	str r0,[r1]
	b ejecutar1
ParaCentro:
	/* Almacenar decision de tirador naranja a la centro - jugador 1*/
	mov r0,#2
	ldr r1,=decision_v
	str r0,[r1]
	b ejecutar1
ParaDerecha:
	/* Almacenar decision de tirador naranja a la derecha - jugador 1*/
	mov r0,#3
	ldr r1,=decision_v
	str r0,[r1]
	b ejecutar1
ejecutar1:
	mov r0,#0x7800000
	bl delay
	ldr r0,=decision_n
	ldr r0,[r0]

	ldr r1,=decision_v
	ldr r1,[r1]

	ldr r3,=score1
	ldr r3,[r3]

	cmp r0,r1
	addne r3,r3,#1

	ldr r2,=score1
	str r3,[r2]

	push {r0-r3}
	ldr r0,=formato
	ldr r1,=decision_v
	ldr r1,[r1]
	bl printf
	pop {r0-r3}
	cmp r1,#1
	bleq VerdeIzquierda

	cmp r1,#2
	bleq VerdeMedio

	cmp r1,#3
	bleq VerdeDerecha

/*Ahora el portero es el naranja*/

	mov r0,#0x7800000
	bl delay
	/* Pintar fondo del juego cuando se encuentre presionado el boton */
	mov r0,#0
	ldr r0,=NaranjaQuietoWidth
	ldr r0,[r0]
	mov r1,#0
	ldr r1,=NaranjaQuietoHeight 
	ldr r1,[r1]
	mov r2,#0
	ldr r2,=NaranjaQuieto @ Ahorita tira naranja, penal 1
	bl pintar_imagen 
	bl pelotaC0
	mov r0,#0x7800000
	bl delay

loop4:

	mov r0,#26
	bl GetGpio /* Verifica estado puerto 26 */
	cmp r0,#0
	bne TiraIzquierda2

	mov r0,#19
	bl GetGpio /* Verifica estado puerto 19 */
	cmp r0,#0
	bne TiraCentro2	

	mov r0,#13
	bl GetGpio /* Verifica estado puerto 13 */
	cmp r0,#0
	bne TiraDerecha2

	b loop4

TiraIzquierda2:
	/* Almacenar decision de tirador naranja a la izquierda - jugador 1*/
	mov r0,#0x7800000
	bl delay
	mov r0,#1
	ldr r1,=decision_v
	str r0,[r1]
	b loop5
TiraCentro2:
	/* Almacenar decision de tirador naranja a la centro - jugador 1*/
	mov r0,#0x7800000
	bl delay
	mov r0,#2
	ldr r1,=decision_v
	str r0,[r1]
	b loop5
TiraDerecha2:
	/* Almacenar decision de tirador naranja a la derecha - jugador 1*/
	mov r0,#0x7800000
	bl delay
	mov r0,#3
	ldr r1,=decision_v
	str r0,[r1]
	b loop5

loop5:
	mov r0,#0
	mov r0,#26
	bl GetGpio /* Verifica estado puerto 26 */
	cmp r0,#0
	bne ParaIzquierda2

	mov r0,#0
	mov r0,#19
	bl GetGpio /* Verifica estado puerto 19 */
	cmp r0,#0
	bne ParaCentro2

	mov r0,#0
	mov r0,#13
	bl GetGpio /* Verifica estado puerto 13 */
	cmp r0,#0
	bne ParaDerecha2

	b loop5

ParaIzquierda2:
	/* Almacenar decision de tirador naranja a la izquierda - jugador 1*/
	mov r0,#1
	ldr r1,=decision_n
	str r0,[r1]
	b ejecutar2
ParaCentro2:
	/* Almacenar decision de tirador naranja a la centro - jugador 1*/
	mov r0,#2
	ldr r1,=decision_n
	str r0,[r1]
	b ejecutar2

ParaDerecha2:
	/* Almacenar decision de tirador naranja a la derecha - jugador 1*/
	mov r0,#3
	ldr r1,=decision_n
	str r0,[r1]
	b ejecutar2

ejecutar2:
	mov r0,#0x7800000
	bl delay
	ldr r0,=decision_v
	ldr r0,[r0]

	ldr r1,=decision_n
	ldr r1,[r1]

	ldr r3,=score2
	ldr r3,[r3]

	cmp r0,r1
	addne r3,r3,#1

	ldr r2,=score2
	str r3,[r2]

	push {r0-r3}
	ldr r0,=formato
	ldr r1,=decision_n
	ldr r1,[r1]
	bl printf
	pop {r0-r3}
	cmp r1,#1
	bleq NaranjaIzquierda

	cmp r1,#2
	bleq NaranjaMedio

	cmp r1,#3
	bleq NaranjaDerecha

	mov r0,#0x7800000
	bl delay

	ldr r0,=turnos
	ldr r0,[r0]
	add r0,r0,#1
	ldr r1,=turnos
	str r0,[r1]
	cmp r0,#5
	blt inicio

	/* Resultado final y determinacion del ganador */
	
	ldr r0,=score1
	ldr r0,[r0]
	ldr r1,=score2
	ldr r1,[r1]
	cmp r0,r1
	blgt GN
	bllt GV
	bleq TIE

	MOV R7,#0
	SWI 0

/* Area de datos */
.data
.balign 4
pixelAddr: .word 0
x:        .word 0
y:        .word 0
resx:	.word	640
resy:	.word 480
score1:	.word 0
score2:	.word 0
turnos: .word 0
.global x_0
x_0: .word 240
.global y_0
y_0: .word 400
.global x_C1
x_C1: .word 250
.global y_C1
y_C1: .word 340
.global x_I1
x_I1: .word 200
.global x_I2
x_I2: .word 160
.global x_I3
x_I3: .word 100
.global y_1
y_1: .word 320
.global y_2
y_2: .word 240
.global y_3
y_3: .word 200
.global x_D1
x_D1: .word 360
.global x_D2
x_D2: .word 410
.global x_D3
x_D3: .word 430
.global x_C2
x_C2: .word 260
.global x_C3
x_C3: .word 265
.global y_C2
y_C2: .word 300
.global y_C3
y_C3: .word 260
.global decision_n
decision_n: .word 0
.global decision_v
decision_v: .word 0
numerote_2: .word 2516582
formato: .asciz "%d"
.end
