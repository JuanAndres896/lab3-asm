/* Universidad del Valle de Guatemala */
/* Taller de Assembler - Seccion 31 */
/* Juan Andres Garcia - 15046 */
/* Rodrigo Barrios - 15009 */
/* Guatemala, septiembre 2 de 2016 */

.text
.balign 4
.global main

main:

	#obtenemos primero la direccion de la pantalla
	bl getScreenAddr
    ldr r1,=pixelAddr
	str r0,[r1]
	
	ldr r0,=instruccionesHeight
	ldr r0,[r0]
	ldr r1,=instruccionesWidth
	ldr r1,[r1]
	ldr r2,=instrucciones

	bl pintar_imagen
	
	mov r7,#0
	SWI 0
	
.data
.balign 4
pixelAddr: .word 0
x:        .word 0
y:        .word 0
resx:	.word	640
resy:	.word 480
score1:	.word 0
score2:	.word 0
.end
