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


	
pelotaD1:
	push {lr}
	push {r4-r9}

	mov r4,r0 /* r4 tiene el ancho */
	mov r5,r1 /* r5 tiene el alto */
	mov r6,r2 /* r6 tiene la direccion */

	/* Reseteo coordenadas 'y' */
	ldr r2,=coord_y
	mov r7,#320
	str r7,[r2]

	/* Obtener direccion de pantalla */
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	@ Definir contador en r9=0
	mov r9,#0

pintarY_D1:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	mov r7,#360
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_D1:
		ldr r0,=pixelAddr
		ldr r0,[r0]

		ldr r1,=coord_x
		ldr r1,[r1]

		ldr r2,=coord_y
		ldr r2,[r2]
		ldr r3,[r6],#4
		cmp r3,#255
		blne pixel 

		/* Recorrido en 'x' */
		ldr r1,=coord_x
		ldr r7,[r1]
		add r7,#1
		str r7,[r1]

		add r8,#1
		cmp r8,r4
		blt pintarX_D1
	/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_D1

pelotaD2:
	push {lr}
	push {r4-r9}

	mov r4,r0 /* r4 tiene el ancho */
	mov r5,r1 /* r5 tiene el alto */
	mov r6,r2 /* r6 tiene la direccion */

	/* Reseteo coordenadas 'y' */
	ldr r2,=coord_y
	mov r7,#240
	str r7,[r2]

	/* Obtener direccion de pantalla */
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	@ Definir contador en r9=0
	mov r9,#0

pintarY_D2:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	mov r7,#410
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_D2:
		ldr r0,=pixelAddr
		ldr r0,[r0]

		ldr r1,=coord_x
		ldr r1,[r1]

		ldr r2,=coord_y
		ldr r2,[r2]
		ldr r3,[r6],#4
		cmp r3,#255
		blne pixel 

		/* Recorrido en 'x' */
		ldr r1,=coord_x
		ldr r7,[r1]
		add r7,#1
		str r7,[r1]

		add r8,#1
		cmp r8,r4
		blt pintarX_D2
	/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_D2

pelotaD3:
	push {lr}
	push {r4-r9}

	mov r4,r0 /* r4 tiene el ancho */
	mov r5,r1 /* r5 tiene el alto */
	mov r6,r2 /* r6 tiene la direccion */

	/* Reseteo coordenadas 'y' */
	ldr r2,=coord_y
	mov r7,#200
	str r7,[r2]

	/* Obtener direccion de pantalla */
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	@ Definir contador en r9=0
	mov r9,#0

pintarY_D3:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	mov r7,#430
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_D3:
		ldr r0,=pixelAddr
		ldr r0,[r0]

		ldr r1,=coord_x
		ldr r1,[r1]

		ldr r2,=coord_y
		ldr r2,[r2]
		ldr r3,[r6],#4
		cmp r3,#255
		blne pixel 

		/* Recorrido en 'x' */
		ldr r1,=coord_x
		ldr r7,[r1]
		add r7,#1
		str r7,[r1]

		add r8,#1
		cmp r8,r4
		blt pintarX_D3
	/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_D3

pelotaC0:
	push {lr}
	push {r4-r9}

	mov r4,r0 /* r4 tiene el ancho */
	mov r5,r1 /* r5 tiene el alto */
	mov r6,r2 /* r6 tiene la direccion */

	/* Reseteo coordenadas 'y' */
	ldr r2,=coord_y
	mov r7,#400
	str r7,[r2]

	/* Obtener direccion de pantalla */
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	@ Definir contador en r9=0
	mov r9,#0

pintarY_C0:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	mov r7,#280
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_C0:
		ldr r0,=pixelAddr
		ldr r0,[r0]

		ldr r1,=coord_x
		ldr r1,[r1]

		ldr r2,=coord_y
		ldr r2,[r2]
		ldr r3,[r6],#4
		cmp r3,#255
		blne pixel 

		/* Recorrido en 'x' */
		ldr r1,=coord_x
		ldr r7,[r1]
		add r7,#1
		str r7,[r1]

		add r8,#1
		cmp r8,r4
		blt pintarX_C0
	/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_C0

pelotaC1:
	push {lr}
	push {r4-r9}

	mov r4,r0 /* r4 tiene el ancho */
	mov r5,r1 /* r5 tiene el alto */
	mov r6,r2 /* r6 tiene la direccion */

	/* Reseteo coordenadas 'y' */
	ldr r2,=coord_y
	mov r7,#320
	str r7,[r2]

	/* Obtener direccion de pantalla */
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	@ Definir contador en r9=0
	mov r9,#0

pintarY_C1:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	mov r7,#295
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_C1:
		ldr r0,=pixelAddr
		ldr r0,[r0]

		ldr r1,=coord_x
		ldr r1,[r1]

		ldr r2,=coord_y
		ldr r2,[r2]
		ldr r3,[r6],#4
		cmp r3,#255
		blne pixel 

		/* Recorrido en 'x' */
		ldr r1,=coord_x
		ldr r7,[r1]
		add r7,#1
		str r7,[r1]

		add r8,#1
		cmp r8,r4
		blt pintarX_C1
	/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_C1

pelotaC2:
	push {lr}
	push {r4-r9}

	mov r4,r0 /* r4 tiene el ancho */
	mov r5,r1 /* r5 tiene el alto */
	mov r6,r2 /* r6 tiene la direccion */

	/* Reseteo coordenadas 'y' */
	ldr r2,=coord_y
	mov r7,#260
	str r7,[r2]

	/* Obtener direccion de pantalla */
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	@ Definir contador en r9=0
	mov r9,#0

pintarY_C2:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	mov r7,#310
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_C2:
		ldr r0,=pixelAddr
		ldr r0,[r0]

		ldr r1,=coord_x
		ldr r1,[r1]

		ldr r2,=coord_y
		ldr r2,[r2]
		ldr r3,[r6],#4
		cmp r3,#255
		blne pixel 

		/* Recorrido en 'x' */
		ldr r1,=coord_x
		ldr r7,[r1]
		add r7,#1
		str r7,[r1]

		add r8,#1
		cmp r8,r4
		blt pintarX_C2
	/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_C2

pelotaC2:
	push {lr}
	push {r4-r9}

	mov r4,r0 /* r4 tiene el ancho */
	mov r5,r1 /* r5 tiene el alto */
	mov r6,r2 /* r6 tiene la direccion */

	/* Reseteo coordenadas 'y' */
	ldr r2,=coord_y
	mov r7,#240
	str r7,[r2]

	/* Obtener direccion de pantalla */
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	@ Definir contador en r9=0
	mov r9,#0

pintarY_C2:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	mov r7,#310
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_C2:
		ldr r0,=pixelAddr
		ldr r0,[r0]

		ldr r1,=coord_x
		ldr r1,[r1]

		ldr r2,=coord_y
		ldr r2,[r2]
		ldr r3,[r6],#4
		cmp r3,#255
		blne pixel 

		/* Recorrido en 'x' */
		ldr r1,=coord_x
		ldr r7,[r1]
		add r7,#1
		str r7,[r1]

		add r8,#1
		cmp r8,r4
		blt pintarX_C2
	/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_C2


/* Area de datos */
.data
.balign 4
pixelAddr: .word 0
coord_x: .word 0
coord_y: .word 0
numerote_2: .word 2516582
.global cota_x
cota_x: .word 0
