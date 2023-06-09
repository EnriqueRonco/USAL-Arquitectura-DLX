		.data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VARIABLES DE ENTRADA: NO MODIFICAR
; valor inicial para la secuencia (de 1.0 a 5.0)
valor_inicial:	.float	5
; Tamanho de la secuencia (multiplo de 5 minimo 10 maximo 30)
tamanho:	.word	10

;;;;; VARIABLES DE SALIDA: NO MODIFICAR ORDEN (TODAS FORMATO FLOAT)
vector:		.space	120
suma: 		.float 	0
; m11=vector[6], m12=vector[7]
; m21=vector[8], m22=vector[9]
M:		.float 0.0, 0.0
		.float 0.0, 0.0
detM: 		.float 0.0
mediaM: 	.float 0.0
; v11=m11/mediaM, v12=m12/mediaM
; v21=m21/mediaM, v22=m22/mediaM
V: 		.float 0.0, 0.0
		.float 0.0, 0.0
detV: 		.float 0.0
mediaV: 	.float 0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; FORMATO DE IMPRESION
PrintFormat:	.asciiz	"%d\n"
		.align	2
PrintPar:	.word	PrintFormat
PrintValue:	.space	4

;VALORES INICIALES
	f_0:		.float 	0
	f_1:		.float	1
	f_10:		.float	10
	f_4:		.float	0.25
	f_i:		.float	0
	f_ia:		.float	0
		.text
		.global main


main:
	lw	r10,tamanho	;Establece el fin de la serie
	addi	r2,r0,0		;Contador a 0
	addi	r3,r0,4		;Contador de vector a 0

	;Valores float utiles para operaciones
	lf	f0,f_0		;Float 0
	lf	f1,f_1		;Float 1
	lf	f2,f_10		;Float 10
	lf	f3,f_4		;Float 0.25

	;Carga de los registros iniciales
	lf	f4,f_0
	lf	f5,valor_inicial
	lf	f6,valor_inicial
	lf	f7,suma

	sw	vector(r2),#0
loop:	
	

	addi	r2,r2,#1	;r2++
	addf	f6,f4,f5	;vector[n] = vector[n-2] + vector[n-1]
	sub	r7,r10,r2	;r7=tamanho-r2
	sf	f_i,f4
	lf	f5,f_i
	;addf	f5,f0,f4	;vector[n-2] = vector[n-1]
	;addf	f4,f0,f6	;vector[n-1] = vector[n]
	beqz	r7,matrixM	;si r7=0 salto a matriz
	sf	vector(r3),f6
	lf	f4,vector(r3)
	addf	f7,f7,f6	;realizar suma de todos los elementos
	addi	r3,r3,#4	;r3++

	
	addi	r2,r2,#1	;r2++
	addf	f6,f4,f5	;vector[n] = vector[n-2] + vector[n-1]
	sub	r7,r10,r2	;r7=tamanho-r2
	sf	f_i,f4
	lf	f5,f_i
	;addf	f5,f0,f4	;vector[n-2] = vector[n-1]
	;addf	f4,f0,f6	;vector[n-1] = vector[n]
	beqz	r7,matrixM	;si r7=0 salto a matriz
	sf	vector(r3),f6
	lf	f4,vector(r3)
	addf	f7,f7,f6	;realizar suma de todos los elementos
	addi	r3,r3,#4	;r3++

	
	addi	r2,r2,#1	;r2++
	addf	f6,f4,f5	;vector[n] = vector[n-2] + vector[n-1]
	sub	r7,r10,r2	;r7=tamanho-r2
	sf	f_i,f4
	lf	f5,f_i
	;addf	f5,f0,f4	;vector[n-2] = vector[n-1]
	;addf	f4,f0,f6	;vector[n-1] = vector[n]
	beqz	r7,matrixM	;si r7=0 salto a matriz
	sf	vector(r3),f6
	lf	f4,vector(r3)
	addf	f7,f7,f6	;realizar suma de todos los elementos
	addi	r3,r3,#4	;r3++

	
	addi	r2,r2,#1	;r2++
	addf	f6,f4,f5	;vector[n] = vector[n-2] + vector[n-1]
	sub	r7,r10,r2	;r7=tamanho-r2
	sf	f_i,f4
	lf	f5,f_i
	;addf	f5,f0,f4	;vector[n-2] = vector[n-1]
	;addf	f4,f0,f6	;vector[n-1] = vector[n]
	beqz	r7,matrixM	;si r7=0 salto a matriz
	sf	vector(r3),f6
	lf	f4,vector(r3)
	addf	f7,f7,f6	;realizar suma de todos los elementos
	addi	r3,r3,#4	;r3++

	
	addi	r2,r2,#1	;r2++
	addf	f6,f4,f5	;vector[n] = vector[n-2] + vector[n-1]
	sub	r7,r10,r2	;r7=tamanho-r2
	sf	f_i,f4
	lf	f5,f_i
	;addf	f5,f0,f4	;vector[n-2] = vector[n-1]
	;addf	f4,f0,f6	;vector[n-1] = vector[n]
	beqz	r7,matrixM	;si r7=0 salto a matriz
	sf	vector(r3),f6
	lf	f4,vector(r3)
	addf	f7,f7,f6	;realizar suma de todos los elementos
	addi	r3,r3,#4	;r3++
	
	j 	loop		;vuelve al principio

matrixM:
	


	lf	f11,vector+28
	lf	f10,vector+24
	lf	f8,vector+16
	addf	f16,f10,f11
	lf	f9,vector+20
	multf	f12,f8,f11
	
	
	

;determinanteM
	
	addf	f15,f8,f9
	sf	suma,f7
	multf	f13,f9,f10
	sf	M,f8
	sf	M+8,f10
	subf	f14,f12,f13
	divf	f30,f1,f14	;Valor para matriz V
	sf	M+4,f9
	sf	M+12,f11
	sf	detM,f14

	
	
	;Comprobacion division entre 0 (Si el determinante es 0, salirse, de lo contrario, se realizarian divisiones entre 0, las otras 2 divisiones del programa (las medias), DEBEN dividirse entre 4)
	;addi	r20,r0,#0
	addf	f17,f15,f16	
	movfp2i	r20,f14
	multf	f18,f17,f3
	beqz	r20,finish

;mediaM
	
	
	
	

;matrizV
	sf	mediaM,f18
	multf	f19,f8,f30
	
	
	
	
	
	sf	V+4,f20
	sf	V+8,f21
	multf	f20,f9,f30

	
	sf	V,f19
	sf	V+12,f22
	multf	f21,f10,f30

	multf	f22,f11,f30
	

	
	
	
;determinanteV
	
	addf	f26,f19,f20
	multf	f23,f19,f22

	
	addf	f27,f21,f22
	multf	f24,f20,f21
	
	subf	f25,f23,f24
	sf	detV,f25

;mediaV
	
	
	addf	f28,f26,f27
	multf	f29,f28,f3
	sf	mediaV,f29
	
finish:
	trap 0	