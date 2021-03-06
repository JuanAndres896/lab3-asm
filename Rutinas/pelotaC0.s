/******************************************************************************
*	mainMatriz.s
*	Dibuja una matriz en la esquina superior izquierda
*	Por: Martha Ligia Naranjo
*   Creado: 20/09/2016
*******************************************************************************/
 .text
 .align 2
 .global pelotaC0
pelotaC0:
	#-------------------------
	#get screen address
	#-------------------------
	push {lr}
	bl getScreenAddr
	ldr r1,=pixelAddr
	str r0,[r1]

	render$:
		
		x	  .req r1
		y         .req r2
		colour 	  .req r3
		addrPixel .req r5
		countByte .req r6
		ancho	  .req r7
		alto	  .req r8

		mov countByte,#0 				//Contador que cuenta la cantidad de bytes dibujados
		ldr ancho,=pelotaWidth
		ldr ancho,[ancho]
		ldr alto,=pelotaHeight
		ldr alto,[alto]
		mov y,#0
		//Ciclo que dibuja filas
		drawRow$:
			mov x,#0
			drawPixel$:
				cmp x,ancho				//comparar x con el ancho de la imagen
				bge end
				ldr addrPixel,=pelota	//Obtenemos la direccion de la matriz con los colores
				ldrb colour,[addrPixel,countByte]	//Leer el dato de la matriz.
				
				ldr r0,=pixelAddr
				ldr r0,[r0] 
				push {r0-r12}
				bl pixel				//Dibujamos el pixel. r1=x,r2=y,r3=colour
				pop {r0-r12}
				add countByte,#1 		//Incrementamos los bytes dibujados
				add x,#1 				//Aumenta el contador del ancho de la imagen
			
				b drawPixel$
		end:	
			// aumentamos y
			add y,#1
						
			//Revisamos si ya dibujamos toda la imagen.
			teq y,alto
			bne drawRow$

	b render$

	.unreq x		  
	.unreq	y         
	.unreq	colour 	  
	.unreq	addrPixel 
	.unreq	countByte 
	.unreq	ancho	  
	.unreq	alto	  
	
	pop {pc}
	
.data
.global pixelAddr
pixelAddr: .word 0

