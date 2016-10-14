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

pelotaC0:
        push {lr}
        push {r4-r9}    /* Standrad ABI */  

        /* Se asignan los inputs */
        mov r4, r0  /* Se mueve width a r4 */
        mov r5, r1  /* Se mueve height a r5 */
        mov r6, r2  /* Se mueve la direccion de la matriz a r6 */       
        
        /********* Reset Y **********/
        ldr r2,=coord_y
        ldr r7,=y_0
        ldr r7,[r7]
        str r7, [r2]
        /****************************/

        /* Se obtiene la direccion de pantalla */
        bl getScreenAddr
        ldr r1, =pixelAddr
        str r0, [r1]
                   
        mov r9, #0      /* Contador */

loopy:
        /******** Reset X ********/
        mov r8, #0
        ldr r7, =x_0    
        ldr r7, [r7]
        ldr r1, =coord_x
        str r7, [r1]
        /**************************/
        cmp r9, r5
        bgt end
        loopx:  
                ldr r0, =pixelAddr
                ldr r0, [r0]

                ldr r1, =coord_x
                ldr r1, [r1]
                
                ldr r2, =coord_y
                ldr r2, [r2]

                
                ldr r3, [r6], #4

                cmp r3, #255    /* Se dibuja solo si el pixel no es blanco */
                blne pixel

                /* Barrido en X */
                ldr r1, =coord_x
                ldr r7, [r1]
                add r7, #1
                str r7, [r1]

                add r8, #1
                cmp r8, r4
                blt loopx

        /* Barrido en Y */
        ldr r2, =coord_y
        ldr r7, [r2]
        add r7, #1
        str r7, [r2]
        add r9, #1
        b loopy
#aquí termina
	

/* Area de datos */
.data
.balign 4
pixelAddr: .word 0
coord_x: .word 0
coord_y: .word 0
y_0:	.word 400
x_0:	.word 280
