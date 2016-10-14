/* Universidad del Valle de Guatemala 
* Taller de Assembler - Seccion 31
* Rodrigo Barrios - 15009
* Juan Andres - 15046
* Guatemala, octubre 14 de 2016
*/
/* Subrutinas para pintar imagenes */
/********************* RESOLUCION: 640x480 (QEMU) *******************/
.global pintar_imagen, VerdeIzquierda, VerdeDerecha, NaranjaIzquierda, NaranjaDerecha, pelotaI1, pelotaI2, pelotaI3, pelotaD1, pelotaD2, pelotaD3, pelotaC0, pelotaC1, pelotaC2, pelotaC3

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

VerdeIzquierda:
	push {lr}
	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=VerdeI1Width
	ldr r0,[r0]
	ldr r1,=VerdeI1Height
	ldr r1,[r1]
	ldr r2,=VerdeI1 
	bl pintar_imagen

	@ Jalar decision del usuario
	@ Si es 1: imprimir pelota yendo a la izquierda 
	@ Si es 2: imprimir pelota yendo al centro
	@ Si es 3: imprimir pelota yendo a la derecha 
	/*ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pintar_I1*/

	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=VerdeI2Width
	ldr r0,[r0]
	ldr r1,=VerdeI2Height
	ldr r1,[r1]
	ldr r2,=VerdeI2 
	bl pintar_imagen

	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=VerdeI3Width
	ldr r0,[r0]
	ldr r1,=VerdeI3Height
	ldr r1,[r1]
	ldr r2,=VerdeI3 
	bl pintar_imagen
	pop {pc}

VerdeDerecha:
	
	push {lr}
	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0	
	ldr r0,=VerdeD1Width
	ldr r0,[r0]
	ldr r1,=VerdeD1Height
	ldr r1,[r1]
	ldr r2,=VerdeD1 
	bl pintar_imagen

	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=VerdeD2Width
	ldr r0,[r0]
	ldr r1,=VerdeD2Height
	ldr r1,[r1]
	ldr r2,=VerdeD2 
	bl pintar_imagen

	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=VerdeD3Width
	ldr r0,[r0]
	ldr r1,=VerdeD3Height
	ldr r1,[r1]
	ldr r2,=VerdeD3 
	bl pintar_imagen
	pop {pc}

NaranjaDerecha:

	push {lr}
	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=NaranjaD1Width
	ldr r0,[r0]
	ldr r1,=NaranjaD1Height
	ldr r1,[r1]
	ldr r2,=NaranjaD1 
	bl pintar_imagen

	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=NaranjaD2Width
	ldr r0,[r0]
	ldr r1,=NaranjaD2Height
	ldr r1,[r1]
	ldr r2,=NaranjaD2 
	bl pintar_imagen

	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=NaranjaD3Width
	ldr r0,[r0]
	ldr r1,=NaranjaD3Height
	ldr r1,[r1]
	ldr r2,=NaranjaD3 
	bl pintar_imagen
	pop {pc}

NaranjaIzquierda:
	push {lr}
	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=NaranjaI1Width
	ldr r0,[r0]
	ldr r1,=NaranjaI1Height
	ldr r1,[r1]
	ldr r2,=NaranjaI1 
	bl pintar_imagen

	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=NaranjaI2Width
	ldr r0,[r0]
	ldr r1,=NaranjaI2Height
	ldr r1,[r1]
	ldr r2,=NaranjaI2 
	bl pintar_imagen

	mov r0,#0x7800000
	bl delay
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=NaranjaI3Width
	ldr r0,[r0]
	ldr r1,=NaranjaI3Height
	ldr r1,[r1]
	ldr r2,=NaranjaI3 
	bl pintar_imagen
	pop {pc}

/* Pelota I1 */
pelotaI1:
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

pintarY_I1:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	ldr r7,=x_I1
	ldr r7,[r7]
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_I1:
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
		blt pintarX_I1
		/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_I1
/* Pelota I2 */
pelotaI2:
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

pintarY_I2:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	ldr r7,=x_I2
	ldr r7,[r7]
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_I2:
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
		blt pintarX_I2
		/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_I2

/* Pelota I3 */
pelotaI3:
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

pintarY_I3:
	/* Reseteo coordenadas 'x' */
	mov r8,#0
	ldr r7,=x_I3
	ldr r7,[r7]
	ldr r1,=coord_x
	str r7,[r1]

	/* Comparar si se llego al maximo en 'y' */
	cmp r9,r5
	bgt end
	pintarX_I3:
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
		blt pintarX_I3
		/* Recorrido en 'y'*/
		ldr r2,=coord_y
		ldr r7,[r2]
		add r7,#1
		str r7,[r2]
		add r9,#1
		b pintarY_I3
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
x_0: .word 280
y_0: .word 400
x_D1: .word 360
x_I1: .word 200
x_I2: .word 150
x_I3: .word 130
y_1: .word 320
y_2: .word 240
x_D2: .word 410
x_D3: .word 430
y_3: .word 200
numerote_2: .word 2516582
.global cota_x
cota_x: .word 0
