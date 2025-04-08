__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
				;Por el puerto B se obtienen los datos del puerto A, 
				;invirtiendo los nibles (4 bits), ej., RB7,RB6,RB5,RB4,RB3,RB2,RB1,RB0
LIST P=16F84A	; quedando: RB3,RB2,RB1,RB0,RB7,RB6,RB5,RB4
INCLUDE <P16F84A.INC>
				;Por el puerto B se obtiene el dato del puerto A invirtiendo los nibbles
ORG 0 			;Con esta instruccion decimos que va a grabar el programa a partir de la dirección 0

				;****Entramos en modo configuración de Entradas y Salidas

	bsf STATUS,RP0 	;Con esta instrucción nos cambiamos del banco 0 ( de trabajo) al banco 1 (de configuracion)
	movlw 0x1f		;Le pasamos el numero 00011111 al registro W, corresponden a los 5 pines del puerto A como entradas
	movwf TRISA		;configuramos el PUERTO A como entrada
	clrf TRISB		;Configuramos el PUERTO B como salida, clrf llena de CEROS el registro
	bcf STATUS,RP0	;Salimos de configuración, pasamos del banco 1 al banco 0

Inicio				;Etiqueta que marca el inicio del programa
	swapf PORTA,W 	;se intercambian los nibles del puerto A, el resultado queda en W
	movwf PORTB		;Movemos el resultado al PUERTO B
	goto Inicio		;Regresamos a la etiqueta "inicio"
END