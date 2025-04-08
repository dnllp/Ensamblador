__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
				;Por el puerto B se obtienen los datos del puerto A, 
				;desplazando a la izquierda, por la derecha entra un 1
INCLUDE <P16F84A.INC>
				;Por el puerto B se obtiene el dato del puerto A con las instrucción rlf
				;se debe colocar un 1 en el carry (C) del registro STATUS ya que este entra
				;por la derecha
ORG 0 			;Con esta instruccion decimos que va a grabar el programa a partir de la direcci?n 0

				;****Entramos en modo configuraci?n de Entradas y Salidas

	bsf STATUS,RP0 	;Con esta instrucci?n nos cambiamos del banco 0 ( de trabajo) al banco 1 (de configuracion)
	movlw 0x1f		;Le pasamos el numero 00011111 al registro W, corresponden a los 5 pines del puerto A como entradas
	movwf TRISA		;configuramos el PUERTO A como entrada
	clrf TRISB		;Configuramos el PUERTO B como salida, clrf llena de CEROS el registro
	bcf STATUS,RP0	;Salimos de configuración, pasamos del banco 1 al banco 0

Inicio				;Etiqueta que marca el inicio del programa
	bsf STATUS,C	;Colocamos un 1 en el Carry (C) del registro
	rlf PORTA,W 	;se recorren los bits a la izquierda del puerto A, el resultado queda en W
	movwf PORTB		;Movemos el resultado al PUERTO B
	goto Inicio		;Regresamos a la etiqueta "inicio"
END