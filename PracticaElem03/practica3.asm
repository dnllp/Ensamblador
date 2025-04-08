__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
				;Por el puerto B se obtienen los datos del puerto A, pero los bits pares del 
				;PUERTO B se mantienen en 1 (RB6, RB4, RB2 y RB0)
LIST P=16F84A
INCLUDE <P16F84A.INC>
				;Por el puerto B se obtiene el dato del puerto A aplicando una mascara
				;con una de tipo OR nos aseguramos que siempre queden en 1 los bits que nos interesan
				;la mascara sería: 0b01010101 la cual la aplicaremos a W antes de pasarlo al PUERTOB
ORG 0 			;Con esta instruccion decimos que va a grabar el programa a partir de la dirección 0

				;****Entramos en modo configuración de Entradas y Salidas

	bsf STATUS,RP0 	;Con esta instrucción nos cambiamos del banco 0 ( de trabajo) al banco 1 (de configuracion)
	movlw 0x1f		;Le pasamos el numero 00011111 al registro W, corresponden a los 5 pines del puerto A como entradas
	movwf TRISA		;configuramos el PUERTO A como entrada
	clrf TRISB		;Configuramos el PUERTO B como salida, clrf llena de CEROS el registro
	bcf STATUS,RP0	;Salimos de configuración, pasamos del banco 1 al banco 0

Inicio				;Etiqueta que marca el inicio del programa
	movf PORTA,w	;Movemos el contenido del PUERTO A al registro W
	iorlw b'01010101';Le aplicamos la mascara al registro W, el resultado queda en W
	movwf PORTB		;Movemos el resultado al PUERTO B
	goto Inicio		;Regresamos a la etiqueta "inicio"
END