__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
						;Lo que esta en el puerto A sale por el puerto B
LIST P=16F84A
INCLUDE <P16F84A.INC>

ORG 0

Inicio 					;Configurar los pines de entrada y salida
	
	bsf 	STATUS,RP0	;entramos en modo config
	clrf 	TRISB		;Config el puerto B como salida
	movlw	b'00011111'
	movwf	TRISA
	bcf		STATUS,RP0	;sale del modo configuracion
	
Principal
	movf 	PORTA,w
	movwf	PORTB
	goto Principal
END	