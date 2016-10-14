/* Universidad del Valle de Guatemala 
* Taller de Assembler - Seccion 31
* Rodrigo Barrios - 15009
* Juan Andres - 15046
* Guatemala, octubre 14 de 2016
*/
/* Subrutinas para pintar imagenes */
/********************* RESOLUCION: 640x480 (QEMU) *******************/
.global pintar_imagen, VerdeIzquierda, VerdeDerecha, NaranjaIzquierda, NaranjaDerecha, VerdeMedio, NaranjaMedio
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
	
	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI1 
	cmp r3,#2
	bleq pelotaC1
	cmp r3,#3
	bleq pelotaD1

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

	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI2 
	cmp r3,#2
	bleq pelotaC2
	cmp r3,#3
	bleq pelotaD2

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

	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI3 
	cmp r3,#2
	bleq pelotaC3
	cmp r3,#3
	bleq pelotaD3

	pop {pc}

VerdeMedio:

	push {lr}
	mov r0,#0x7800000
	bl delay
	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI1 
	cmp r3,#2
	bleq pelotaC1
	cmp r3,#3
	bleq pelotaD1

	mov r0,#0x7800000
	bl delay
	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI2 
	cmp r3,#2
	bleq pelotaC2
	cmp r3,#3
	bleq pelotaD2

	mov r0,#0x7800000
	bl delay
	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI3 
	cmp r3,#2
	bleq pelotaC3
	cmp r3,#3
	bleq pelotaD3
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

	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI1 
	cmp r3,#2
	bleq pelotaC1
	cmp r3,#3
	bleq pelotaD1

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

	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI2 
	cmp r3,#2
	bleq pelotaC2
	cmp r3,#3
	bleq pelotaD2

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

	ldr r3,=decision_n
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI3 
	cmp r3,#2
	bleq pelotaC3
	cmp r3,#3
	bleq pelotaD3

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

	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI1 
	cmp r3,#2
	bleq pelotaC1
	cmp r3,#3
	bleq pelotaD1

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

	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI2 
	cmp r3,#2
	bleq pelotaC2
	cmp r3,#3
	bleq pelotaD2

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

	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI3 
	cmp r3,#2
	bleq pelotaC3
	cmp r3,#3
	bleq pelotaD3

	pop {pc}
NaranjaMedio:

	push {lr}
	mov r0,#0x7800000
	bl delay
	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI1 
	cmp r3,#2
	bleq pelotaC1
	cmp r3,#3
	bleq pelotaD1

	mov r0,#0x7800000
	bl delay
	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI2 
	cmp r3,#2
	bleq pelotaC2
	cmp r3,#3
	bleq pelotaD2

	mov r0,#0x7800000
	bl delay
	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI3 
	cmp r3,#2
	bleq pelotaC3
	cmp r3,#3
	bleq pelotaD3
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

	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI1 
	cmp r3,#2
	bleq pelotaC1
	cmp r3,#3
	bleq pelotaD1

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

	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI2 
	cmp r3,#2
	bleq pelotaC2
	cmp r3,#3
	bleq pelotaD2

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

	ldr r3,=decision_v
	ldr r3,[r3]
	cmp r3,#1
	bleq pelotaI3 
	cmp r3,#2
	bleq pelotaC3
	cmp r3,#3
	bleq pelotaD3

	pop {pc}
.global GV
GV:
	
	push {lr}
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=GanaVerdeWidth
	ldr r0,[r0]
	ldr r1,=GanaVerdeHeight
	ldr r1,[r1]
	ldr r2,=GanaVerde
	bl pintar_imagen
	pop {pc}

.global GN
GN:
	push {lr}
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=GanaNaranjaWidth
	ldr r0,[r0]
	ldr r1,=GanaNaranjaHeight
	ldr r1,[r1]
	ldr r2,=GanaNaranja
	bl pintar_imagen
	pop {pc}

.global TIE
TIE:
	push {lr}
	mov r0,#0
	mov r1,#0
	mov r2,#0
	ldr r0,=empateWidth
	ldr r0,[r0]
	ldr r1,=empateHeight
	ldr r1,[r1]
	ldr r2,=empate
	bl pintar_imagen
	pop {pc}

/* IMPRIMIR PELOTA EN EL CENTRO */
.global pelotaC0
pelotaC0: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_0
	ldr r9, [r9]										
	ldr r7,=pelotaWidth 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_0
	ldr r10, [r10]
	ldr r8,=pelotaHeight
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_0
	ldr r2, [r2]
	filasC0:
		
		ldr r1, =x_0
		ldr r1, [r1]

		dibujaC0:
			
			ldr r5,=pelota
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaC0		
		

	finImC0:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasC0

	pop {pc}
/* IMPRIMIR PELOTA IZQUIERDA 1*/
.global pelotaI1
pelotaI1: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_I1
	ldr r9, [r9]										
	ldr r7,=pelota2Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_1
	ldr r10, [r10]
	ldr r8,=pelota2Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_1
	ldr r2, [r2]
	filasI1:
		
		ldr r1, =x_I1
		ldr r1, [r1]

		dibujaI1:
			
			ldr r5,=pelota2
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaI1				
		

	finImI1:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasI1

	pop {pc}
/* IMPRIMIR PELOTA IZQUIERDA 2*/
.global pelotaI2
pelotaI2: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_I2
	ldr r9, [r9]										
	ldr r7,=pelota3Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_2
	ldr r10, [r10]
	ldr r8,=pelota3Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_2
	ldr r2, [r2]
	filasI2:
		
		ldr r1, =x_I2
		ldr r1, [r1]

		dibujaI2:
			
			ldr r5,=pelota3
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaI2		
		

	finImI2:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasI2

	pop {pc}
/* IMPRIMIR PELOTA IZQUIERDA 3 */
.global pelotaI3
pelotaI3: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_I3
	ldr r9, [r9]										
	ldr r7,=pelota3Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_3
	ldr r10, [r10]
	ldr r8,=pelota3Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_3
	ldr r2, [r2]
	filasI3:
		
		ldr r1, =x_I3
		ldr r1, [r1]

		dibujaI3:
			
			ldr r5,=pelota3
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaI3			
		

	finImI3:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasI3

	pop {pc}
/* IMPRIMIR PELOTA DERECHA 1 */
.global pelotaD1
pelotaD1: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_D1
	ldr r9, [r9]										
	ldr r7,=pelota2Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_1
	ldr r10, [r10]
	ldr r8,=pelota2Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_1
	ldr r2, [r2]
	filasD1:
		
		ldr r1, =x_D1
		ldr r1, [r1]

		dibujaD1:
			
			ldr r5,=pelota2
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaD1			
		

	finImD1:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasD1

	pop {pc}
/* IMPRIMIR PELOTA DERECHA 2 */
.global pelotaD2
pelotaD2: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_D2
	ldr r9, [r9]										
	ldr r7,=pelota3Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_2
	ldr r10, [r10]
	ldr r8,=pelota3Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_2
	ldr r2, [r2]
	filasD2:
		
		ldr r1, =x_D2
		ldr r1, [r1]

		dibujaD2:
			
			ldr r5,=pelota3
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaD2			
		

	finImD2:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasD2

	pop {pc}
/* IMPRIMIR PELOTA DERECHA 3 */
.global pelotaD3
pelotaD3: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_D3
	ldr r9, [r9]										
	ldr r7,=pelota3Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_3
	ldr r10, [r10]
	ldr r8,=pelota3Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_3
	ldr r2, [r2]
	filasD3:
		
		ldr r1, =x_D3
		ldr r1, [r1]

		dibujaD3:
			
			ldr r5,=pelota3
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaD3			
		

	finImD3:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasD3

	pop {pc}
/* IMPRIMIR PELOTA CENTRO 1 */
.global pelotaC1
pelotaC1: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_C1
	ldr r9, [r9]										
	ldr r7,=pelota2Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_C1
	ldr r10, [r10]
	ldr r8,=pelota2Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_C1
	ldr r2, [r2]
	filasC1:
		
		ldr r1, =x_C1
		ldr r1, [r1]

		dibujaC1:
			
			ldr r5,=pelota2
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaC1				
		

	finImC1:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasC1

	pop {pc}
/* IMPRIMIR PELOTA CENTRO 2 */
.global pelotaC2
pelotaC2: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_C2
	ldr r9, [r9]										
	ldr r7,=pelota3Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_C2
	ldr r10, [r10]
	ldr r8,=pelota3Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_C2
	ldr r2, [r2]
	filasC2:
		
		ldr r1, =x_C2
		ldr r1, [r1]

		dibujaC2:
			
			ldr r5,=pelota3
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaC2			
		

	finImC2:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasC2

	pop {pc}
/* IMPRIMIR PELOTA CENTRO 3 */
.global pelotaC3
pelotaC3: 
	push {lr} 
	
	mov r6,#0 	

	ldr r9, =x_C3
	ldr r9, [r9]										
	ldr r7,=pelota3Width 			            
	ldr r7,[r7]
	add r7, r9

	ldr r10, =y_C3
	ldr r10, [r10]
	ldr r8,=pelota3Height
	ldr r8,[r8]
	add r8, r10

	ldr r2, =y_C3
	ldr r2, [r2]
	filasC3:
		
		ldr r1, =x_C3
		ldr r1, [r1]

		dibujaC3:
			
			ldr r5,=pelota3
			ldrb r3,[r5,r6]			
			
			ldr r0,=pixelAddr
			ldr r0,[r0] 
			push {r0-r12}
			cmp r3,#255
			blne pixel				
			pop {r0-r12}
			add r6,#1 		
			add r1,#1 

			cmp r1, r7
			blt dibujaC3			
		

	finImC3:	
		
		add r2,#1
					
		
		teq r2,r8
		bne filasC3

	pop {pc}

/* Area de datos */
.data
.balign 4
pixelAddr: .word 0
coord_x: .word 0
coord_y: .word 0
numerote_2: .word 2516582
.global cota_x
cota_x: .word 0
/*Posibles coordenadas
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
x_C1: .word 295
*/
