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
	
	ldr r0,=instruccionesWidth
	ldr r0,[r0]
	ldr r1,=instruccionesHeight
	ldr r1,[r1]
	ldr r2,=instrucciones

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
	/* Pintar fondo del juego cuando se encuentre presionado el boton */
	mov r0,#0
	ldr r0,=VerdeQuietoWidth
	ldr r0,[r0]
	mov r1,#0
	ldr r1,=VerdeQuietoHeight
	ldr r1,[r1]
	mov r2,#0
	ldr r2,=VerdeQuieto
	bl pintar_imagen
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
decision_j1: .word 0
decision_j2: .word 0
numerote_2: .word 2516582
.end
