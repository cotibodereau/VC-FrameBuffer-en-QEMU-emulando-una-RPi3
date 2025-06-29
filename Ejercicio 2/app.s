	.equ SCREEN_WIDTH,   640
	.equ SCREEN_HEIGH,   480
	.equ BITS_PER_PIXEL, 32

	.equ GPIO_BASE,    0x3f200000
	.equ GPIO_GPFSEL0, 0x00
	.equ GPIO_GPLEV0,  0x34

	.globl main
        .global colorear_puerta
        .global colorear_ventana

main:
	// x0 contiene la direccion base del framebuffer
	mov x20, x0 // Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ----------------------------------

// COLOREAR CIELO
	movz x10, 0x00, lsl 16
	movk x10, 0x0080, lsl 00
	mov x2, 320       // Y Size
        bl colorear_pantalla

//COLOREAR PASTO
	movz x10, 0x0E, lsl 16
	movk x10, 0x5724, lsl 00    
	mov x2, 160        // Y Size
        bl colorear_pantalla 

//COLOREAR ESTRELLAS 
    //color blanco
    movz x12, 0xFF, lsl 16   
    movk x12, 0XFFFF, lsl 00
        
    //parametros
    mov x0, x20 //restaura la direccion base del framebuffer
    mov x1, SCREEN_WIDTH         // X Size
    bl pixelAleatorios

//COLOREAR CASTILLO

//COLOREAR RECTANGULO PRINCIPAL

//Colorear bordes ------------------------------------------------------------------------------------------------------------------------
    mov x1, SCREEN_WIDTH
	mov x5, 137 // eje 1x
	mov x6, 503 // eje 2x
	mov x4, 247 // eje 1y
	mov x3, 423 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo


// Colorear muralla ----------------------------------------------------------------------------------------------------------------------
	mov x1, SCREEN_WIDTH
	mov x5, 140 // eje 1x
	mov x6, 500 // eje 2x
	mov x4, 250 // eje 1y
	mov x3, 420 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x5F, lsl 16
	movk x12, 0x685B, lsl 00
	bl rectangulo

//COLOREAR TORRE IZQUIERDA 

//colorear borde ------------------------------------------------------------------------------------------------------------------------
    mov x1, SCREEN_WIDTH
    mov x5, 137 // eje 1x
	mov x6, 203// eje 2x
	mov x4, 182 // eje 1y
	mov x3, 423 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo


//Colorear muralla --------------------------------------------------------------------------------------------------------------------- 
	mov x5, 140 // eje 1x
	mov x6, 200 // eje 2x
	mov x4, 182 // eje 1y
	mov x3, 420 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x4B, lsl 16
	movk x12, 0x4F49, lsl 00
	bl rectangulo

//Colorear ventanas -----------------------------------------------------------------------------------------------------------------------

//ventana superior 
//colorear borde negro mayor 
	mov x5, 155 // eje 1x
	mov x6, 185 // eje 2x
	mov x4, 240 // eje 1y
	mov x3, 290 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo

//colorear borde negro menor 
	mov x5, 160 // eje 1x
	mov x6, 181 // eje 2x
	mov x4, 235 // eje 1y
	mov x3, 290 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo

//colorear interior 
	mov x5, 160 // eje 1x
	mov x6, 181 // eje 2x
	mov x4, 240 // eje 1y
	mov x3, 285 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0xFF, lsl 16
	movk x12, 0xFF65, lsl 00
	bl rectangulo

//ventana inferior  

//colorear borde negro mayor 
	mov x5, 155 // eje 1x
	mov x6, 185 // eje 2x
	mov x4, 330 // eje 1y
	mov x3, 380 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo

//colorear borde negro menor 
	mov x5, 160 // eje 1x
	mov x6, 181 // eje 2x
	mov x4, 325// eje 1y
	mov x3, 335 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo

//colorear interior 
	mov x5, 160 // eje 1x
	mov x6, 181 // eje 2x
	mov x4, 330// eje 1y
	mov x3, 375 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0xFF, lsl 16
	movk x12, 0xFF65, lsl 00
	bl rectangulo

//colorear balcon ----------------------------------------------------------------------------------------------------------------------------------------

//rectangulo negro mas alto 
	mov x5, 133 // eje 1x
	mov x6, 207 // eje 2x
	mov x4, 188 // eje 1y
	mov x3, 198 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo

//rectangulo negro mas bajo
	mov x5, 130 // eje 1x
	mov x6, 210 // eje 2x
	mov x4, 190 // eje 1y
	mov x3, 196 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo

//rectangulo gris 
	mov x5, 133 // eje 1x
	mov x6, 207 // eje 2x
	mov x4, 190 // eje 1y
	mov x3, 196 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x4B, lsl 16
	movk x12, 0x4F49, lsl 00
	bl rectangulo

//techo -------------------------------------------------------------------------------------------------------------------------------------------------------------

    // borde 
    mov x5, 170       // eje 1x (posicion X inicial)
    mov x6, 170       // eje 2x (limite X inicial)
    mov x4, 135       // eje 1y (posicion Y inicial)
    mov x3, 182     // eje 2y (posicion Y final)
    mov X12, 0
    bl triangulo

//tejas 
    mov x5, 170       // eje 1x (posicion X inicial)
    mov x6, 170       // eje 2x (limite X inicial)
    mov x4, 139      // eje 1y (posicion Y inicial)
    mov x3, 180    // eje 2y (posicion Y final)
    movz x12, 0xCA, lsl 16
    movk x12, 0x2626, lsl 0
    bl triangulo


//colorear puerta------------------------------------------------------------------------------------------------------------------------------------------ 

//colorear borde negro exterior 
    mov x1, SCREEN_WIDTH
	mov x5, 280// eje 1x
	mov x6, 360 // eje 2x
	mov x4, 340 // eje 1y
	mov x3, 420// eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo

//colorear borde gris interior 
    mov x1, SCREEN_WIDTH
	mov x5, 290// eje 1x
	mov x6, 350 // eje 2x
	mov x4, 350 // eje 1y
	mov x3, 420// eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x4B, lsl 16
	movk x12, 0x4F49, lsl 00
	bl rectangulo

//colorear ranuras exteriores   

//dos rectangulos  grises de la izquierda 
    mov x1, SCREEN_WIDTH
	mov x5, 280// eje 1x
	mov x6, 295 // eje 2x
	mov x4, 340 // eje 1y
	mov x3, 344// eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x5F, lsl 16
	movk x12, 0x685B, lsl 00
	bl rectangulo

    mov x1, SCREEN_WIDTH
	mov x5, 280// eje 1x
	mov x6, 285 // eje 2x
	mov x4, 340 // eje 1y
	mov x3, 350// eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x5F, lsl 16
	movk x12, 0x685B, lsl 00
	bl rectangulo

//dos rectangulos grises de la derecha 
    mov x1, SCREEN_WIDTH
	mov x5, 345// eje 1x
	mov x6, 360 // eje 2x
	mov x4, 340 // eje 1y
	mov x3, 344// eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x5F, lsl 16
	movk x12, 0x685B, lsl 00
	bl rectangulo

    mov x1, SCREEN_WIDTH
	mov x5, 355// eje 1x
	mov x6, 360 // eje 2x
	mov x4, 340 // eje 1y
	mov x3, 350// eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x5F, lsl 16
	movk x12, 0x685B, lsl 00
	bl rectangulo

//colorear borde negro exterior 
    mov x1, SCREEN_WIDTH
	mov x5, 300 // eje 1x
	mov x6, 340 // eje 2x
	mov x4, 365 // eje 1y
	mov x3, 421 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo

//colorear borde negro interior  
    mov x1, SCREEN_WIDTH
	mov x5, 310 // eje 1x
	mov x6, 330 // eje 2x
	mov x4, 360 // eje 1y
	mov x3, 365 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo

//colorear madera 

    mov x1, SCREEN_WIDTH
	mov x5, 310 // eje 1x
	mov x6, 330 // eje 2x
	mov x4, 365 // eje 1y
	mov x3, 421 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x7A, lsl 16
	movk x12, 0x4D12, lsl 00
	bl rectangulo



//COLOREAR TORRE DEL MEDIO 

	//colorear borde ----------------------------------------------------------------------------------------------------------------------------------- 
	mov x5, 272 // eje 1x
	mov x6, 368 // eje 2x
	mov x4, 167 // eje 1y
	mov x3, 247 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo
	
	//colorear muralla ------------------------------------------------------------------------------------------------------------------------------------
	mov x5, 275 // eje 1x
	mov x6, 365 // eje 2x
	mov x4, 170 // eje 1y
	mov x3, 247 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x4B, lsl 16
	movk x12, 0x4F49, lsl 00
	bl rectangulo
	
       
        //colorear ventanas --------------------------------------------------------------------------------------------------------------------------------
	//colorear borde negro mayor 
    mov x5, 290 // eje 1x
	mov x6, 350 // eje 2x
	mov x4, 215 // eje 1y
	mov x3, 233 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo


	//colorear interior 
	mov x5, 295 // eje 1x
	mov x6, 345 // eje 2x
	mov x4, 215 // eje 1y
	mov x3, 228 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0xFF, lsl 16
	movk x12, 0xFF65, lsl 00
	bl rectangulo

      //colorear borde negro menor
	mov x5, 295 // eje 1x
	mov x6, 345 // eje 2x
	mov x4, 210 // eje 1y
	mov x3, 215 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo

      //techo----------------------------------------------------------------------------------------------------------------------------------------

    // borde 
    mov x5, 320       // eje 1x (posicion X inicial)
    mov x6, 320       // eje 2x (limite X inicial)
    mov x4, 100       // eje 1y (posicion Y inicial)
    mov x3, 170       // eje 2y (posicion Y final)
    mov x12, 0
    bl triangulo

//tejas 
    mov x5, 320       // eje 1x (posicion X inicial)
    mov x6, 320       // eje 2x (limite X inicial)
    mov x4, 105      // eje 1y (posicion Y inicial)
    mov x3, 167       // eje 2y (posicion Y final)
    movz x12, 0xCA, lsl 16
    movk x12, 0x2626, lsl 0
    bl triangulo

    
//colorear detalles ---------------------------------------------------------------------------------------------------------------------------------------------

	// borde negro mayor
	mov x5, 265 // eje 1x
	mov x6, 375 // eje 2x
	mov x4, 190 // eje 1y
	mov x3, 200 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0
	bl rectangulo

    //borde gris mayor 
	mov x5, 269 // eje 1x
	mov x6, 371 // eje 2x
	mov x4, 190 // eje 1y
	mov x3, 200 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x4B, lsl 16
	movk x12, 0x4F49, lsl 00
	bl rectangulo

    //borde negro menor inferior 
	mov x5, 269 // eje 1x
	mov x6, 371 // eje 2x
	mov x4, 200 // eje 1y
	mov x3, 203 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0
	bl rectangulo 

    //borde negro menor inferior 
	mov x5, 269 // eje 1x
	mov x6, 371 // eje 2x
	mov x4, 187 // eje 1y
	mov x3, 190 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0
	bl rectangulo 



//colorear detalles calados ----------------------------------------------------------------------------------------------------------------------------------

//colorear rectangulo negro 
	mov x5, 203 // eje 1x
	mov x6, 427 // eje 2x 
	mov x4, 247 // eje 1y    
	mov x3, 280 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0
	bl rectangulo

//colorear rectangulo gris  
	mov x5, 204 // eje 1x
	mov x6, 426 // eje 2x
	mov x4, 247 // eje 1y
	mov x3, 270 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x5F, lsl 16
	movk x12, 0x685B, lsl 00
	bl rectangulo


    
//colorear ranuras negras de abajo 
    mov x1, SCREEN_WIDTH
	mov x5, 204 // eje 1x
	mov x6, 220 // eje 2x //+16
	mov x4, 247 // eje 1y
	mov x3, 255// eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
    mov x29, x4 
    bl rectangulo
 

    for:cmp x9, 6
        b.eq colorear_ranuras_arriba
        add X5, X6, 20
        add X6, X5, 16
        mov X4, X29
        mov X19, X5
        bl rectangulo
        add X9, X9, 1
        b for 

//colorear ranuras negras de arriba 
colorear_ranuras_arriba:
    mov x1, SCREEN_WIDTH
	mov x5, 220 // eje 1x
	mov x6, 240 // eje 2x //+16
	mov x4, 241 // eje 1y
	mov x3, 248// eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
    mov x29, x4 
    bl rectangulo

    for1:cmp x11, 6
        b.eq colorear_torre_derecha
        add X5, X6, 16
        add X6, X5, 20
        mov X4, X29
        mov X19, X5
        bl rectangulo
        add X11, X11, 1
        b for1 

//COLOREAR TORRE DERECHA 

colorear_torre_derecha:

//colorear borde -------------------------------------------------------------------------------------------------------------------------------------------------
	mov x5, 427 // eje 1x
	mov x6, 503 // eje 2x
	mov x4, 182 // eje 1y
	mov x3, 423 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo

//colorear muralla ---------------------------------------------------------------------------------------------------------------------------------------------
	mov x5, 430 // eje 1x
	mov x6, 500 // eje 2x
	mov x4, 182 // eje 1y
	mov x3, 420 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x4B, lsl 16
	movk x12, 0x4F49, lsl 00
	bl rectangulo

//colorear ventanas -------------------------------------------------------------------------------------------------------------------------------------------- 

//ventana superior 

//colorear borde negro mayor  
	mov x5, 455 // eje 1x
	mov x6, 485 // eje 2x
	mov x4, 240 // eje 1y
	mov x3, 290 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo

//colorear borde negro menor                                          
	mov x5, 460 // eje 1x
	mov x6, 481 // eje 2x
	mov x4, 235 // eje 1y
	mov x3, 245 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo

//colorear interior 
	mov x5, 460 // eje 1x
	mov x6, 481 // eje 2x
	mov x4, 240// eje 1y
	mov x3, 285 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0xFF, lsl 16
	movk x12, 0xFF65, lsl 00
	bl rectangulo

//inferior 

//colorear borde negro mayor 
	mov x5, 455 // eje 1x
	mov x6, 485 // eje 2x
	mov x4, 330 // eje 1y
	mov x3, 380 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo

//colorear borde negro menor 
	mov x5, 460 // eje 1x
	mov x6, 481 // eje 2x
	mov x4, 325 // eje 1y
	mov x3, 335 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov x12, 0
	bl rectangulo

//colorear interior 
	mov x5, 460 // eje 1xB 
	mov x6, 481 // eje 2x
	mov x4, 330 // eje 1y
	mov x3, 375 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0xFF, lsl 16
	movk x12, 0xFF65, lsl 00
	bl rectangulo

//balcon --------------------------------------------------------------------------------------------------------------------------------------------------------- 

//rectangulo negro mas alto 
	mov x5, 423 // eje 1x
	mov x6, 506 // eje 2x
	mov x4, 189 // eje 1y
	mov x3, 199 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo

//rectangulo negro mas bajo 
	mov x5, 420 // eje 1x
	mov x6, 509 // eje 2x
	mov x4, 191 // eje 1y
	mov x3, 197 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	mov X12, 0
	bl rectangulo


//rectangulo gris 
	mov x5, 423 // eje 1x
	mov x6, 506 // eje 2x
	mov x4, 191 // eje 1y
	mov x3, 197 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x4B, lsl 16
	movk x12, 0x4F49, lsl 00
	bl rectangulo 

//techo --------------------------------------------------------------------------------------------------------------------------------------------------------------

  //borde
    mov x5, 465       // eje 1x (posicion X inicial)
    mov x6, 465       // eje 2x (limite X inicial)
    mov x4, 132       // eje 1y (posicion Y inicial)
    mov x3, 182       // eje 2y (posicion Y final)
    mov x12, 0
    bl triangulo

//tejas 
    mov x5, 465       // eje 1x (posicion X inicial)
    mov x6, 465       // eje 2x (limite X inicial)
    mov x4, 136      // eje 1y (posicion Y inicial)
    mov x3, 180       // eje 2y (posicion Y final)
    movz x12, 0xCA, lsl 16
    movk x12, 0x2626, lsl 0
    bl triangulo
    
//COLOREAR ARBOL 

//Arbol frutal 
    // Tronco arbol derecha
	mov x5, 560 // eje 1x
	mov x6, 582 // eje 2x
	mov x4, 330 // eje 1y
	mov x3, 415 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x7D, lsl 16
	movk x12, 0x4D0D, lsl 00
	bl rectangulo
	
	// Hojas
    mov x5, 570      // eje 1x (posicion X inicial)
    mov x4, 345       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    movz x10, 0x0B, lsl 16
    movk x10, 0x7310, lsl 0
    bl circulo
	
	mov x5, 555      // eje 1x (posicion X inicial)
    mov x4, 335       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
	
	mov x5, 585      // eje 1x (posicion X inicial)
    mov x4, 335       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
    
    mov x5, 545      // eje 1x (posicion X inicial)
    mov x4, 318       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
	
	mov x5, 595      // eje 1x (posicion X inicial)
    mov x4, 318       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
    
    mov x5, 555      // eje 1x (posicion X inicial)
    mov x4, 305       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
	
	mov x5, 585      // eje 1x (posicion X inicial)
    mov x4, 305       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
	
	mov x5, 570      // eje 1x (posicion X inicial)
    mov x4, 295       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
    
    mov x5, 570      // eje 1x (posicion X inicial)
    mov x4, 325       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
        
    mov x5, 550      // eje 1x (posicion X inicial)
    mov x4, 336       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
	
	mov x5, 590      // eje 1x (posicion X inicial)
    mov x4, 336       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
    
    mov x5, 552      // eje 1x (posicion X inicial)
    mov x4, 300       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
	
	mov x5, 587      // eje 1x (posicion X inicial)
    mov x4, 300       // eje 1y (posicion Y inicial)
    mov x2, 15       // radio
    bl circulo
    
    // Frutos

    mov x5, 570      // eje 1x (posicion X inicial)
    mov x4, 300       // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    movz x10, 0x08, lsl 16
    movk x10, 0x4F0B, lsl 0
    bl circulo	
	
	mov x5, 585      // eje 1x (posicion X inicial)
    mov x4, 300      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 555      // eje 1x (posicion X inicial)
    mov x4, 300      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 545      // eje 1x (posicion X inicial)
    mov x4, 317      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 563      // eje 1x (posicion X inicial)
    mov x4, 312      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 578      // eje 1x (posicion X inicial)
    mov x4, 312      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 570      // eje 1x (posicion X inicial)
    mov x4, 324      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 555      // eje 1x (posicion X inicial)
    mov x4, 323      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 585      // eje 1x (posicion X inicial)
    mov x4, 323      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 595      // eje 1x (posicion X inicial)
    mov x4, 317      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 548      // eje 1x (posicion X inicial)
    mov x4, 334      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 563      // eje 1x (posicion X inicial)
    mov x4, 337      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 578      // eje 1x (posicion X inicial)
    mov x4, 337      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 593      // eje 1x (posicion X inicial)
    mov x4, 334      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    mov x5, 570      // eje 1x (posicion X inicial)
    mov x4, 347      // eje 1y (posicion Y inicial)
    mov x2, 4       // radio
    bl circulo
    
    // PINO 
    //Tronco 
	mov x5, 60 // eje 1x
	mov x6, 82 // eje 2x
	mov x4, 330 // eje 1y
	mov x3, 415 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x58, lsl 16
	movk x12, 0x4407, lsl 00
	bl rectangulo
	
	// Hojas
	mov x5, 71       // eje 1x (posicion X inicial)
    mov x6, 71       // eje 2x (limite X inicial)
    mov x4, 310       // eje 1y (posicion Y inicial)
    mov x3, 365       // eje 2y (posicion Y final)
    movz x12, 0x08, lsl 16
    movk x12, 0x4F0B, lsl 0
    bl triangulo
    
    mov x5, 71       // eje 1x (posicion X inicial)
    mov x6, 71       // eje 2x (limite X inicial)
    mov x4, 300       // eje 1y (posicion Y inicial)
    mov x3, 350       // eje 2y (posicion Y final)
    bl triangulo
    
    mov x5, 71       // eje 1x (posicion X inicial)
    mov x6, 71       // eje 2x (limite X inicial)
    mov x4, 292       // eje 1y (posicion Y inicial)
    mov x3, 335       // eje 2y (posicion Y final)
    bl triangulo
    
    mov x5, 71       // eje 1x (posicion X inicial)
    mov x6, 71       // eje 2x (limite X inicial)
    mov x4, 285       // eje 1y (posicion Y inicial)
    mov x3, 322       // eje 2y (posicion Y final)
    bl triangulo
    
    mov x5, 71       // eje 1x (posicion X inicial)
    mov x6, 71       // eje 2x (limite X inicial)
    mov x4, 280       // eje 1y (posicion Y inicial)
    mov x3, 309       // eje 2y (posicion Y final)
    bl triangulo

//----------------------------------------------------------------------------------------------------

//COLOREAR LUNA

    // Luna borde  
    mov x5, 630      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 58       // radio
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 0
    bl circulo
    
    // Luna 
    mov x5, 630      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 55       // radio
    movz x10, 0xD2, lsl 16
    movk x10, 0xCA16, lsl 0
    bl circulo
    
    mov x5, 646      // eje 1x (posicion X inicial)
    mov x4, 72       // eje 1y (posicion Y inicial)
    mov x2, 44       // radio
	movz x10, 0x00, lsl 16
	movk x10, 0x0080, lsl 00
    bl circulo
    
    movz x27, 0x777, lsl 16 //delay
    bl recluna1
    bl DelayLuna
    bl recluna2
    
    // Luna borde  
    mov x5, 610      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 58       // radio
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 0
    bl circulo
    
    // Luna 
    mov x5, 610      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 55       // radio
    movz x10, 0xD2, lsl 16
    movk x10, 0xCA16, lsl 0
    bl circulo
    
    mov x5, 626      // eje 1x (posicion X inicial)
    mov x4, 72       // eje 1y (posicion Y inicial)
    mov x2, 44       // radio
	movz x10, 0x00, lsl 16
	movk x10, 0x0080, lsl 00
    bl circulo
    
    movz x27, 0x777, lsl 16 //delay
    bl recluna1
    bl DelayLuna
    bl recluna2
    
    // Luna borde  
    mov x5, 590      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 58       // radio
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 0
    bl circulo
    
    // Luna 
    mov x5, 590      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 55       // radio
    movz x10, 0xD2, lsl 16
    movk x10, 0xCA16, lsl 0
    bl circulo
    
    mov x5, 606      // eje 1x (posicion X inicial)
    mov x4, 72       // eje 1y (posicion Y inicial)
    mov x2, 44       // radio
	movz x10, 0x00, lsl 16
	movk x10, 0x0080, lsl 00
    bl circulo

    movz x27, 0x777, lsl 16 //delay
    bl recluna1
    bl DelayLuna    
    bl recluna2
    
    // Luna borde  
    mov x5, 570      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 58       // radio
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 0
    bl circulo
    
    // Luna 
    mov x5, 570      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 55       // radio
    movz x10, 0xD2, lsl 16
    movk x10, 0xCA16, lsl 0
    bl circulo
    
    mov x5, 586      // eje 1x (posicion X inicial)
    mov x4, 72       // eje 1y (posicion Y inicial)
    mov x2, 44       // radio
	movz x10, 0x00, lsl 16
	movk x10, 0x0080, lsl 00
    bl circulo
    
    movz x27, 0x777, lsl 16 //delay
    bl recluna1
    bl DelayLuna    
    bl recluna2
    
    // Luna borde  
    mov x5, 560      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 58       // radio
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 0
    bl circulo
    
    // Luna 
    mov x5, 560      // eje 1x (posicion X inicial)
    mov x4, 70       // eje 1y (posicion Y inicial)
    mov x2, 55       // radio
    movz x10, 0xD2, lsl 16
    movk x10, 0xCA16, lsl 0
    bl circulo
    
    mov x5, 576      // eje 1x (posicion X inicial)
    mov x4, 72       // eje 1y (posicion Y inicial)
    mov x2, 44       // radio
	movz x10, 0x00, lsl 16
	movk x10, 0x0080, lsl 00
    bl circulo


//----------------------------------------------------------------------------------------------------    
    //Fantasma-Castillo
	
	mov x5, 400 // eje 1x
	mov x6, 422 // eje 2x
	mov x4, 300 // eje 1y
	mov x3, 325 // eje 2y
	movz x27, 0x0555, lsl 16 //delay
    mov x24, x4
	mov x25, x3
	bl fantasma
	
    bl reccastillo
	
	mov x5, 380 // eje 1x
	mov x6, 402 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
    sub x24, x24, 5
	sub x25, x25, 5
	bl fantasma
	
    bl reccastillo
	
	mov x5, 360 // eje 1x
	mov x6, 382 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
    add x24, x24, 5
	add x25, x25, 5
	bl fantasma
	
    bl reccastillo
	
	mov x5, 340 // eje 1x
	mov x6, 362 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
    add x24, x24, 5
	add x25, x25, 5
	bl fantasma
	
    bl reccastillo

	mov x5, 320 // eje 1x
	mov x6, 342 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
    sub x24, x24, 5
	sub x25, x25, 5
	bl fantasma
	
    bl reccastillo
	
	mov x5, 300 // eje 1x
	mov x6, 322 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
    sub x24, x24, 5
	sub x25, x25, 5
	bl fantasma
	
    bl reccastillo
	
	mov x5, 280 // eje 1x
	mov x6, 302 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
    add x24, x24, 5
	add x25, x25, 5
	bl fantasma
	
    bl reccastillo
	
	mov x5, 260 // eje 1x
	mov x6, 282 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
    add x24, x24, 5
	add x25, x25, 5
	bl fantasma
	
	bl reccastillo
	
	mov x5, 240 // eje 1x
	mov x6, 262 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
    sub x24, x24, 5
	sub x25, x25, 5
	bl fantasma
	
	bl reccastillo
	
	mov x5, 220 // eje 1x
	mov x6, 242 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
	sub x24, x24, 5
	sub x25, x25, 5
	bl fantasma

//-----------------------------------------------------------------------------------------------------
    //Fantasma-Abajo
    
   	mov x5, 170 // eje 1x
	mov x6, 192 // eje 2x
	mov x4, 440 // eje 1y
	mov x3, 465 // eje 2y
	mov x24, x4
	mov x25, x3
	movz x27, 0x0555, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 190 // eje 1x
	mov x6, 212 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 210 // eje 1x
	mov x6, 232 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 230 // eje 1x
	mov x6, 252 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 250 // eje 1x
	mov x6, 272 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 270 // eje 1x
	mov x6, 292 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 290 // eje 1x
	mov x6, 312 // eje 2x
	movz x27, 0x0555, lsl 16 //delay
	bl fantasma

    bl recpasto
    
    mov x5, 310 // eje 1x
	mov x6, 332 // eje 2x
	movz x27, 0x0333, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 330 // eje 1x
	mov x6, 352 // eje 2x
	movz x27, 0x0333, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 350 // eje 1x
	mov x6, 372 // eje 2x
	movz x27, 0x0333, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 370 // eje 1x
	mov x6, 392 // eje 2x
	movz x27, 0x0333, lsl 16 //delay
	bl fantasma
	
    bl recpasto
        
    mov x5, 390 // eje 1x
	mov x6, 412 // eje 2x
	movz x27, 0x0333, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 410 // eje 1x
	mov x6, 432 // eje 2x
	movz x27, 0x0333, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 430 // eje 1x
	mov x6, 452 // eje 2x
	movz x27, 0x0333, lsl 16 //delay
	bl fantasma
	
    bl recpasto
    
    mov x5, 450 // eje 1x
	mov x6, 472 // eje 2x
	movz x27, 0x0333, lsl 16 //delay
	bl fantasma

//-----------------------------------------------------------------------------------------------------    
    //Fantasma-Izquieda //revisar esto ver si se puede hacer una sola funcion fantasma2 que sirva para todas las llamadas
    
    mov x5, 90 // eje 1x
	mov x6, 112 // eje 2x
	mov x4, 250 // eje 1y
	mov x3, 275 // eje 2y
	movz x27, 0x0888, lsl 16 //delay
	mov x24, x4
	mov x25, x3
	bl fantasma
	
	bl reccielo

    mov x5, 70 // eje 1x
	mov x6, 92 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma
	
	bl reccielo

    mov x5, 90 // eje 1x
	mov x6, 112 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo

    mov x5, 99 // eje 1x
	mov x6, 121 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma
	
	bl reccielo
    
    mov x5, 90 // eje 1x
	mov x6, 112 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo
	
	mov x5, 70 // eje 1x
	mov x6, 92 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma
	
	bl reccielo

    mov x5, 90 // eje 1x
	mov x6, 112 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo

    mov x5, 99 // eje 1x
	mov x6, 121 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo
    
    mov x5, 90 // eje 1x
	mov x6, 112 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo
	
	mov x5, 70 // eje 1x
	mov x6, 92 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo
		
	mov x5, 90 // eje 1x
	mov x6, 112 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo

    mov x5, 99 // eje 1x
	mov x6, 121 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo
    
    mov x5, 90 // eje 1x
	mov x6, 112 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma

	bl reccielo
	
	mov x5, 70 // eje 1x
	mov x6, 92 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma	
	bl reccielo
    
    mov x5, 90 // eje 1x
	mov x6, 112 // eje 2x
	movz x27, 0x0888, lsl 16 //delay
	sub x24, x24, 20
	sub x25, x25, 20
	bl fantasma	
	
inflo: b inflo

//-------------------------------------------------------------------------------------------------------------------------------------------//

//Funciones:

colorear_pantalla:
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	str w10, [x0], 4  // Colorear el pixel N y avanzar
	subs x1, x1, 1    // comparo X con 1 
	bne loop0         // si X es distinto de 1, salto a loop0
	subs x2, x2, 1    // comparo Y con 1
	bne loop1         // si Y es distinto de 1, salto a loop1
    ret

rectangulo:
loop4:
	mov x5, x19 // lo vuelve al primer pixel del eje x (vertical)
loop5:
        // Calculo de la direccion del pixel
	mul x7, x4, x1           // y * SCREEN_WIDTH
	add x7, x7, x5           // x + (y * SCREEN_WIDTH)
	lsl x7, x7, 2            // 4 * [x + (y * SCREEN_WIDTH)]
	add x8, x20, x7          // Dirección = Dirección de inicio + 4 * [x + (y * SCREEN_WIDTH)]

	str w12, [x8]            // Colorea el píxel N
	add x5, x5, 1            // Siguiente píxel en X
	cmp x5, x6               // Comparo 1erX con N-posicion X
	ble loop5                // (Mientras x5 sea menor o igual a x6) -> Salta al loop
	add x4, x4, 1            // Siguiente píxel en Y
	cmp x4, x3
	b.lt loop4
	ret

triangulo:
    mov x19, xzr          // x19 = 0, contador auxiliar para reiniciar x5
    mov x21, x5           // Guarda el valor inicial de x5 en x21
    mov x22, x6           // Guarda el valor inicial de x6 en x22

loop12:
    mov x5, x21           // Reinicia x5 a su valor inicial para cada fila
loop13:
    mul x7, x4, x1        // y * SCREEN_WIDTH
    add x7, x7, x5        // x + (y * SCREEN_WIDTH)
    lsl x7, x7, 2         // 4 * [x + (y * SCREEN_WIDTH)]
    add x8, x20, x7       // Dirección = Dirección de inicio + 4 * [x + (y * SCREEN_WIDTH)]
    str w12, [x8]         // Colorea el píxel N
    add x5, x5, 1         // Siguiente píxel en X
    cmp x5, x22           // Comparo 1erX con N-posicion X
    b.lt loop13           // Si x5 < x22, sigue dibujando la fila

    // Aquí termina una fila y se preparan los valores para la siguiente fila
    add x4, x4, 1         // Incrementa la posición Y
    sub x21, x21, 1       // Decrementa el valor inic de X para formar el lado izquierdo del triángulo
    add x22, x22, 1       // Incrementa el límite X para formar el lado derecho del triángulo
    cmp x4, x3            // Compara la posición Y actual con la altura del triángulo
    b.lt loop12           // Si x4 < x3, sigue con la siguiente fila
    ret

circulo:
    sub sp, sp, #8 
    stur lr, [sp]
    add x14, x4, x2       // x14 = y + radio
    add x17, x5, x2       // x17 = x + radio
    mov x15, x5
    mov x16, x4
    sub x5, x5, x2      // Inicio X

loop14: // Reset Y
    cmp x5, x17
    b.gt loop19
    sub x4, x16, x2      // Reinicia Y para la nueva fila
loop15:
    cmp x4, x14
    b.eq loop18

    sub x9, x5, x15
    mul x9, x9, x9               // x9 = (Xsize - Xcentro)**2 
    
    sub x11, x4, x16
    mul x11, x11, x11            // x11 = (Ysize - Ycentro)**2

    add x13, x9, x11             // x13 = (Xsize - Xcentro)*2  + (Ysize - Ycentro)*2

    mov x12, x2
    mul x12, x12, x12            // x12 = radio**2

    cmp x12, x13
    b.ge loop16                   // si x13 <= x12 
    b loop17
loop16:       
    sub sp, sp, #8 //reservamos espacio en el stack para guardar los valores
    stur lr, [sp]
    mul x7, x4, x1           // y * SCREEN_WIDTH
	add x7, x7, x5           // x + (y * SCREEN_WIDTH)
	lsl x7, x7, 2            // 4 * [x + (y * SCREEN_WIDTH)]
	add x8, x20, x7          // Dirección = Dirección de inicio + 4 * [x + (y * SCREEN_WIDTH)] 
    ldur lr, [sp] //reacomodamos el stackpointer
    add sp, sp, #8  
    stur w10, [x8]   
loop17:
    add x4, x4, #1               // avanza pixel
    b loop15
loop18: //skip
    add x5, x5, #1
    b loop14
loop19: //end
    ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
    br lr
//----------------------------------------------------------------------------------------------------

recluna1:
    sub sp, sp, #8 
    stur lr, [sp]
    
    mov x5, 0 // eje 1x
	mov x6, 120 // eje 2x
	mov x4, 0 // eje 1y
	mov x3, 140 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x00, lsl 16
	movk x12, 0x0080, lsl 00
	bl rectangulo
	
    ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
    br lr

recluna2:
    sub sp, sp, #8 
    stur lr, [sp]
    
    mov x5, 480 // eje 1x
	mov x6, 639 // eje 2x
	mov x4, 0 // eje 1y
	mov x3, 140 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x00, lsl 16
	movk x12, 0x0080, lsl 00
    bl rectangulo
	
    ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
    br lr    

DelayLuna:
    sub sp, sp, #8 
    stur lr, [sp]
    DelayL:    
    subs x27, x27, 1
    bne DelayL
    
    ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
    br lr

//----------------------------------------------------------------------------------------------------

reccastillo:
    sub sp, sp, #8 
    stur lr, [sp]
    
    mov x5, 204 // eje 1x
	mov x6, 425 // eje 2x
	mov x4, 280 // eje 1y
	mov x3, 330 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x5F, lsl 16
	movk x12, 0x685B, lsl 00
	bl rectangulo
	
	ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
    br lr  

//----------------------------------------------------------------------------------------------------
       
recpasto:
    sub sp, sp, #8 
    stur lr, [sp]
    
    mov x5, 160 // eje 1x
	mov x6, 475 // eje 2x
	mov x4, 423 // eje 1y
	mov x3, 479 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical) 
	movz x12, 0x0E, lsl 16
	movk x12, 0x5724, lsl 00  
	bl rectangulo
	
	ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
    br lr

//----------------------------------------------------------------------------------------------------

reccielo:
    sub sp, sp, #8 
    stur lr, [sp]
    
    mov x5, 40 // eje 1x
	mov x6, 120 // eje 2x
	mov x4, 0 // eje 1y
	mov x3, 275 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x00, lsl 16
	movk x12, 0x0080, lsl 00
	bl rectangulo
	
	ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
    br lr
    
//----------------------------------------------------------------------------------------------------	  

pixelAleatorios:

mov x15,200

loop2:  cbz x15, fin
	stur w12,[x0]  // Colorear el pixel N
	lsl x13, x1, 3 //distancia entre pixel y pixel
	add x0,x0,x13    // Siguiente pixel
	sub x1,x1,1    // Decrementar contador X
        sub x15, x15, 1
	cbnz x1, loop2 // Si no termino la fila, salto
     fin:ret x30




fantasma:
    sub sp, sp, #8 
    stur lr, [sp]
    
    //Borde negro cuerpo
	sub x5, x5, 4 // eje 1x 
	sub x6, x6, 2 // eje 2x 
	mov x4, x24 // eje 1y
	mov x3, x25 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0x00, lsl 16
	movk x12, 0x0000, lsl 00
	bl rectangulo
	
	//Borde negro cabeza
    sub x5, x5, 13      // eje 1x (posicion X inicial) // 405
    mov x4, x24       // eje 1y (posicion Y inicial)
    mov x2, 14       // radio
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 0
    bl circulo
	
	//Cuerpo
	sub x5, x5, 25// eje 1x //394
	sub x6, x6, 2 // eje 2x //416
	mov x4, x24 // eje 1y
	mov x3, x25 // eje 2y
	mov x19, x5 // guarda el primer pixel del eje x (vertical)
	movz x12, 0xFF, lsl 16
	movk x12, 0xFFFF, lsl 00
	bl rectangulo	
	
	//Cabeza
    sub x5, x5, 11      // eje 1x (posicion X inicial) //405
    mov x4, x24       // eje 1y (posicion Y inicial)
    mov x2, 12       // radio
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 0
    bl circulo
    
    //Ojos
    sub x5, x5, 17     // eje 1x (posicion X inicial) //401
    mov x4, x24       // eje 1y (posicion Y inicial)
    mov x2, 3       // radio
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 0
    bl circulo
    
    add x5, x5, 5      // eje 1x (posicion X inicial) //410
    mov x4, x24       // eje 1y (posicion Y inicial)
    mov x2, 3       // radio
    bl circulo
    
    //Parte de abajo
    mov x26, x25
    sub x26, x26, 5
    sub x5, x5, 16     // eje 1x (posicion X inicial) //397
    mov x6, x5       // eje 2x (limite X inicial)
    mov x4, x26       // eje 1y (posicion Y inicial)
    mov x3, x25       // eje 2y (posicion Y final)
	movz x12, 0x00, lsl 16
	movk x12, 0x0000, lsl 00
    bl triangulo
    
    add x5, x5, 3      // eje 1x (posicion X inicial) //405
    mov x6, x5       // eje 2x (limite X inicial)
    mov x4, x26       // eje 1y (posicion Y inicial)
    mov x3, x25       // eje 2y (posicion Y final)
    bl triangulo
    
    add x5, x5, 3    // eje 1x (posicion X inicial) //413
    mov x6, x5       // eje 2x (limite X inicial)
    mov x4, x26       // eje 1y (posicion Y inicial)
    mov x3, x25       // eje 2y (posicion Y final)
    bl triangulo
     
Delay:    
    subs x27, x27, 1
    bne Delay
    
    ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
    br lr
	  
InfLoop: b InfLoop
