__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
				;Lo que esta en el puerto A sale por el puerto B
LIST P=16F84A
INCLUDE <P16F84A.INC>
				;Por el puerto B se obtiene el dato del puerto A multiplicado por 2
				;PORTB = PORTA + PORTA
				;Se debe recordar que no se pueden hacer operaciones entre dos registros, 
				;uno de los operandos debe estar en el registro W
ORG 0 			;Con esta instruccion decimos que va a grabar el programa a partir de la dirección 0

				;****Entramos en modo configuración de Entradas y Salidas

	bsf STATUS,RP0 	;Con esta instrucción nos cambiamos del banco 0 ( de trabajo) al banco 1 (de configuracion)
	movlw 0x1f		;Le pasamos el numero 00011111 al registro W, corresponden a los 5 pines del puerto A como entradas
	movwf TRISA		;configuramos el PUERTO A como entrada
	clrf TRISB		;Configuramos el PUERTO B como salida, clrf llena de CEROS el registro
	bcf STATUS,RP0	;Salimos de configuración, pasamos del banco 1 al banco 0

Inicio 				;****Etique que indica que comienza el programa	
	movf PORTA,0	;mueve el contenido del puerto A al registro W
	addwf PORTA,w	;al contenido del puerto W (PORTA) le suma PORTA
	movwf PORTB		;Mueve el resultado de la suma (PORTA+PORTA) que esta en W al registro PORTB
	goto Inicio		;Crea un ciclo regresando a la posición de la etiqueta "Inicio"
END





