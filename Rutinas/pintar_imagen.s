/* Universidad del Valle de Guatemala 
* Taller de Assembler - Seccion 31
* Rodrigo Barrios - 15009
* Juan Andres - 15046
* Guatemala, octubre 14 de 2016
*/
/* Subrutinas para pintar imagenes */
/********************* RESOLUCION: 640x480 (QEMU) *******************/
.global pintar_imagen 

@ Pintar imagen 8-bit
@ Parametros:
@ R0: Ancho 'x'
@ R1: Alto 'y'
@ R2: Direccion de la matriz de la imagen
@ Devuelve en pantalla la imagen segun los parametros indicados

pintar_imagen:
	push {lr}
	push {r4-r9}

	mov r4,r0 /* r4 tiene el ancho */
	mov r5,r1 /* r5 tiene el alto */
	mov r6,r2 /* r6 tiene la direccion */

	/* Reseteo coordenadas 'y' */
	ldr r2,=coord_y
	mov r7,#0
	str r7,[r2]

	/* Obtener direccion de pantalla */
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	@ Definir contador en r9=0
	mov r9,#0

pintarY:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	ldr r7,=cota_x
	ldr r7,[r7]
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX:
		ldr r0,=pixelAddr
		ldr r0,[r0]

		ldr r1,=coord_x
		ldr r1,[r1]

		ldr r2,=coord_y
		ldr r2,[r2]
		ldr r3,[r6],#4
		bl pixel 

		/* Recorrido en 'x' */
		ldr r1,=coord_x
		ldr r7,[r1]
		add r7,#1
		str r7,[r1]

		add r8,#1
		cmp r8,r4
		blt pintarX
	/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY
end:
	pop {r4-r9}
	pop {pc}

.global delay
delay:
	
    mov r7,#0

    b compare
loop:
    add r7,#1     //r7++
compare:
    cmp r7,r0     //test r7 == r0
    bne loop
    mov pc,lr


/* Area de datos */
.data
.balign 4
pixelAddr: .word 0
coord_x: .word 0
coord_y: .word 0
numerote_2: .word 2516582
.global cota_x
cota_x: .word 0
