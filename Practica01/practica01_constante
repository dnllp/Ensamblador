__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

LIST P=16F84A
INCLUDE <P16F84A.INC>

Constante EQU b'10101010'

ORG 0

Inicio
	bsf 	STATUS,RP0	;entramos en modo config
	clrf 	TRISB		;Config el puerto B como salida
	bcf		STATUS,RP0	;sale del modo configuracion
	movlw   Constante
Principal
	movwf	PORTB
	goto Principal
END	