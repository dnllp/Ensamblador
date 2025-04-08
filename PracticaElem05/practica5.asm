__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
				;Por el puerto B se obtienen los datos del puerto A, pero invertidos los 0 en 1 y los 1 en 0
LIST P=16F84A
INCLUDE <P16F84A.INC>
				;Por el puerto B se obtiene el dato del puerto A invirtiendo los valores
				;con la instruccion comf nos aseguramos que invierten los valores
				
ORG 0 			;Con esta instruccion decimos que va a grabar el programa a partir de la dirección 0

				;****Entramos en modo configuración de Entradas y Salidas
	bsf STATUS,RP0 	;Con esta instrucción nos cambiamos del banco 0 ( de trabajo) al banco 1 (de configuracion)
	movlw 0x1f		;Le pasamos el numero 00011111 al registro W, corresponden a los 5 pines del puerto A como entradas
	movwf TRISA		;configuramos el PUERTO A como entrada
	clrf TRISB		;Configuramos el PUERTO B como salida, clrf llena de CEROS el registro
	bcf STATUS,RP0	;Salimos de configuración, pasamos del banco 1 al banco 0

Inicio				;Etiqueta que marca el inicio del programa
	comf PORTA,w	;Invierte el contenido del PUERTO A y el resultado se carga en el registro W
	movwf PORTB		;Movemos el resultado que esta en W al PUERTO B
	goto Inicio		;Regresamos a la etiqueta "inicio"
END