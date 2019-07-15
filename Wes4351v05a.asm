
    #include p16f883.inc
    __config H'2007', 0x23F4
    __config H'2008', 0X3EFF

	ERRORLEVEL -302

; CONFIG1

; 15 0 not used
; 14 0 not used
; 13 1 Debug not  implemented
; 12 0 LVP not implemented            2

; 11 0 Fail safe monitor disabled
; 10 0 IESO Disabled
;  9 1 Brown-out reset enabled
;  8 1 Brown-out reset enabled        3

; 7 1 Data code protection disabled 
; 6 1 Program code protection disabled 
; 5 1 MCLR enabled
; 4 1 Power-up timer disabled         F

; 3 0 Watchdog timer disabled
; 210 100 INTOSCIO Oscillator         4

; CONFIG2

; 15-12 not used                      3

; 11 not used
; 10 1 Flash write protection off
; 9  1 Flash write protection off
; 8  0 Brown-out Reset set to 2.1V    E

; 7 - 4 not used                      F

; 3 - 0 not used                      F


; Use 16F883 without a crystal
;
; Channel Switch connected to RC4 - RC7 and RB0 - RB5
; Channels 1 - 10 active high.
; 
; RC3 TX L, RX Hi No!
; Now RC3 TX Hi, RX Lo
;
; RA0 pin 2 Clock
; RA1 pin 3 Data
; RA2 pin 4 LE
;
; RC0 - RC2 not used
; RA3 - RA7 not used

; Source data for ADF4351:

; RX      Synth (= RX freq - 10.7)
;
; 70.260  59.560  R0 004C0768, R1 08008FA1, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.275  59.575  R0 004C0200, R1 080083E9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.300  59.600  R0 004C0240, R1 080083E9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.325  59.625  R0 004C0080, R1 080080C9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.350  59.650  R0 004C02C0, R1 080083E9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.375  59.675  R0 004C0300, R1 080083E9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.400  59.700  R0 004C0340, R1 080083E9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.425  59.725  R0 004C0380, R1 080083E9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.450  59.750  R0 004C00C0, R1 080080C9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
; 70.475  59.775  R0 004C8018, R1 080083E9, R2 00004E42 R3 000004B3, R4 00EC803C, R5 00580005
;                        xxxx          xxx
;                     ttttttt          ttt     tttt                       tt
;
; For MC12080 divide by 80 TX      Synth (= TX Freq/24 * 80) So step is 83.33 kHz
;
; 70.260  234.200 R0 01768058, R1 080080C9, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.275  234.250 R0 01768018, R1 08008029, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.300  234.333 R0 01768068, R1 08008079, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.325  234.416 R0 01770010, R1 08008079, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.350  234.500 R0 01770010, R1 08008029, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.375  234.583 R0 01770010, R1 08008019, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.400  234.666 R0 01770070, R1 08008079, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.425  234.750 R0 01778008, R1 08008029, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.450  234.833 R0 01778038, R1 08008079, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
; 70.475  234.916 R0 01778058, R1 08008079, R2 18014E42 R3 000004B3, R4 00C2803C, R5 00580005
;                       xxxxx          xxx
;
; For U266 divide by 256 TX      Synth (= TX Freq/24 * 256) So step is 266.666 kHz
;
; 70.260  749.440 R0 012B8298, R1 080084B1, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.275  749.600 R0 012B8088, R1 080080C9, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.300  749.866 R0 012B8218, R1 08008259, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.325  750.133 R0 012C0040, R1 08008259, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.350  750.400 R0 012C0040, R1 080080C9, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.375  750.666 R0 012C0040, R1 08008079, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.400  750.933 R0 012C01C0, R1 08008259, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.425  751.200 R0 012C00C0, R1 080080C9, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.450  751.466 R0 012C8068, R1 08008259, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
; 70.475  751.733 R0 012C80E8, R1 08008259, R2 18014E42 R3 000004B3, R4 00A2803C, R5 00580005
;                       xxxxx          xxx


; Definitions

;-------PIC Registers-------------------------

INDR	EQU	0       ; the indirect data register
PCL	EQU	2       ; program counter low bits
STATUS	EQU	3	; Used for Zero bit
FSR	EQU	4       ; the indirect address register
PORTA	EQU	5       ; Switch inouts
PORTB	EQU	6       ; 8 Bit code to TX
PORTC	EQU	7       ; Low 3 bits select digit, High 4 bits are BCD
PCLATH	EQU	0x0A	; Program Counter High Bits
INTCON	EQU	0x0B	; Interrupt Control
T1CON	EQU	0x10	; Counter Control
TRISA   EQU     0x85
ADCON1  EQU     0x9F
EEDAT   EQU     0x010C
EEADR   EQU     0x010D
EEDATH  EQU     0x010E
EEADRH  EQU     0x010F
EECON1  EQU     0x018C
EECON2  EQU     0x018D

;-------PIC Bits--------------------------------

W	EQU	0	; indicates result goes to working register
F	EQU	1	; indicates result goes to file (named register)
CARRY   EQU	0
ZERO	EQU	2

RP1     EQU     0x06
RP0     EQU     0x05
EEPGD   EQU     0x07
WREN    EQU     0x02
WR      EQU     0x01
RD      EQU     0x00

;-------Project Registers------------------

PTCSW	EQU	0x20   	; Port C switch state as read
PTBSW	EQU	0x21	; Port B switch state as read 
RETCH	EQU	0x22	; Channel and TX state read from switches
PREVCH	EQU	0x23	; Last set channel - disposable
PREVCH2	EQU	0x24	; Last set channel - non-disposable
CURRCH	EQU	0x25	; The current switch state before debounce
NEWCH	EQU	0x26	; The current switch state after debounce delay
T1	EQU	0x27	; Counter in DEL1M
T2	EQU	0x28	; Counter in DELPT1
CNT8S	EQU	0x29	; Counter for bytes in 32-bit word
BITCNT	EQU	0x2A	; Counter of bits in each byte
SHIFTR	EQU	0x2B	; Shift register used for data bits in each word
BYTE1	EQU	0x2C	; Most significant 8 bits of 32-bit word
BYTE2	EQU	0x2D	; Next significant 8 bits of 32-bit word
BYTE3	EQU	0x2E	; Next significant 8 bits of 32-bit word
BYTE4	EQU	0x2F	; Least significant 8 bits of 32-bit word
LUPAGE	EQU	0x30	; Page for Lookups
TXSET	EQU	0x31	; SET if TX currently, Clear if RX
;	EQU	0x32	; 
;	EQU	0x33	; 
;	EQU	0x34	; 
;	EQU	0x35	; 
;	EQU	0x36	; 
;	EQU	0x37	; 
;	EQU	0x38	; 
;	EQU	0x39	; 
;	EQU	0x3A	; 
;	EQU	0x3B	; 
;	EQU	0x3C	; 
;	EQU	0x3D	; 
;	EQU	0x3E	; 
;	EQU	0x3F	; 
;	EQU	0x40	; 
;	EQU	0x41	; 
;	EQU	0x42	; 
;	EQU	0x43	; 
;	EQU	0x44	; 
;	EQU	0x45	;
;	EQU	0x46	;
;	EQU	0x47	;
;	EQU	0x48	; 
;	EQU	0x4A	; 
;	EQU	0x4B	; 
;	EQU	0x4C	; 
;	EQU	0x4D	; 
;	EQU	0x4E	; 
;	EQU	0x4F	; 
;	EQU	0x52	; 
;	EQU	0x53	; 
;	EQU	0x54	;  
;	EQU	0x55	;  
;	EQU	0x70	; 
;	EQU	0x0170	; 
;	EQU	0x71	; 
;	EQU	0x0171	; 

;-------Project Bits-------------------------

;	None

;-------START of Program--------------------

        ORG	0x00		; Load from Program Memory 00 onwards
	GOTO	INIT

;-------Interrupt Vector--------------------
; Not used
	
;------ Set up Internal Oscillator -----------------

        ORG	0x10		; Load from Program Memory 10 onwards
INIT	BSF 	3, 5		; Bank x1
	BCF	3, 6		; Bank 01 (1)

	MOVLW	0x61		; 4 MHz, 
	MOVWF	OSCCON		; and set it

	BCF	3, 5		; Go back to Register Bank x0

;------ Set up IO Ports -----------------

	CLRF	PORTA		; Clear output latches
	CLRF	PORTB   	; 
	CLRF	PORTC   	; 

	BSF 	3, 5		; Bank x1
	BCF	3, 6		; Bank 01 (1).  Now set Port directions

	MOVLW 	0x00 		; Initialize data direction
	MOVWF 	TRISA     	; Set RA0-7 as outputs

	MOVLW 	0x3F 		; Initialize data direction
	MOVWF 	TRISB     	; Set RB0-5 as inputs, RB6 and 7 as outputs (not used)

	MOVLW 	0xF8 		; Initialize data direction
	MOVWF 	TRISC     	; Set RC0-2 as outputs (not used), RC3-7 as inputs

	BSF	3, 6		; Bank 11 (3)

	MOVLW	0x00
	MOVWF	ANSEL		; Disable analog inputs on PORT A
	
	MOVLW	0x00
	MOVWF	ANSELH		; Disable analog inputs on PORT B
	
	BCF	3, 5		; Go back to Register Bank x0
	BCF	3, 6		; Bank 00 (0).

LUUP	BSF	PORTA, 2	; Set ADF4351 LE High (static condition)

;------ Set Look-up Page -----------------------------------------

	MOVLW	0x02		; Look-ups are in page 2.  All other code in pages 0 and 1
	MOVWF	LUPAGE
	
;------ Wait for lines to settle ---------------------------------

	CALL	DELPT1		; Wait 0.1 seconds
	CALL	DELPT1		; Wait 0.1 seconds
	CALL	DELPT1		; Wait 0.1 seconds

;------ Read Current channel selection for startup ----------------------------

	CALL	RDCHAN		; returns channel selection and TX state in W

	
	MOVWF	PREVCH		; Record the previous channel state
	MOVWF	PREVCH2		; Record the previous channel state again
	MOVWF	CURRCH		; Record the current channel state
	
	BTFSC	CURRCH, 7	; Skip next if receive selected

	GOTO	BOOTT		; Transmit selected so boot to transmit

	CALL	BOOTRX		; Start up receiver
	CLRF	TXSET		; Set state to receive
	GOTO	MONSW		; Go and monitor switches

BOOTT	CALL	BOOTTX		; Start up transmitter
	MOVLW	0x01		; 
	MOVWF	TXSET		; Set State to transmit
	
;------ Return to here after checking switches or changing anything -----

MONSW	NOP

	CALL	RDCHAN		; Read current switch state
	MOVWF	CURRCH		; Record the current channel state

	SUBWF	PREVCH, F	; Returns 0 if no change
	BTFSS	STATUS, ZERO	; Skip next if no change
	GOTO	DEBOUN		; It's changed, so go and debounce it

	MOVF	PREVCH2, W	; Copy the previous channel state
	MOVWF	PREVCH		; back into PREVCH

	GOTO	MONSW		; Go and check if it's changed again

;------ Switches had changed, so debounce ---------------------------------

DEBOUN	CALL DELPT1		; Wait 100ms

	CALL	RDCHAN		; Read current switch state
	MOVWF	NEWCH		; Store new state
	SUBWF	CURRCH, F	; Returns 0 if state stable
	BTFSS	STATUS, ZERO	; skip next if state stable
	GOTO	MONSW		; unstable, so try again

	MOVF	NEWCH, W	; Copy new state
	MOVWF	PREVCH		; into PREVCH
	MOVWF	PREVCH2		; and into PREVCH2

;------ Decode change of switches --------------------------------------------

	BTFSC	TXSET, 0	; Skip next if currently on receive
	GOTO 	PREVTX		; Was on TX
				
				; So was on RX
	BTFSC	NEWCH, 7	; Skip next if staying on RX
	GOTO	RXTX		; No, switching to TX

	CALL	SWRXCH		; was RX, now RX, so must be RX channel change
	MOVF	NEWCH, W	; Copy new state
	MOVWF	PREVCH		; into PREVCH
	MOVWF	PREVCH2		; and into PREVCH2
	GOTO	MONSW		; RX Channel change complete, so wait for next change

RXTX	CALL	SWTOTX		; Was on RX, now TX, so switch to TX
	MOVLW	0x01		; 
	MOVWF	TXSET		; Set State to transmit
	MOVF	NEWCH, W	; Copy new state
	MOVWF	PREVCH		; into PREVCH
	MOVWF	PREVCH2		; and into PREVCH2
	GOTO	MONSW		; Change to TX complete, so wait for next change

PREVTX	BTFSS	NEWCH, 7	; Was on TX, test if now TX
	GOTO	TXRX		; No, so switch to RX

	CALL	SWTXCH		; was TX, now TX, so must be TX channel change
	MOVF	NEWCH, W	; Copy new state
	MOVWF	PREVCH		; into PREVCH
	MOVWF	PREVCH2		; and into PREVCH2
	GOTO	MONSW		; TX Channel change complete, so wait for next change

TXRX	CALL	SWTORX		; Was on TX, now RX, so switch to RX
	CLRF	TXSET		; Set state to receive
	MOVF	NEWCH, W	; Copy new state
	MOVWF	PREVCH		; into PREVCH
	MOVWF	PREVCH2		; and into PREVCH2
	GOTO	MONSW		; Change to RX complete, so wait for next change

;------ Main loop never gets beyond here ------------------------------------------
;----------------------------------------------------------------------------------

; ----- DEL1M - DELAY 1 MILLISECOND -------------------------------------

;	Each instruction is 1 microsecond (4 MHz/4)
;	So delay 1000 instruction steps including call and return

DEL1M	MOVLW	0xF8	; 3 LOAD 248 (times 4 = 992 cycles)
	MOVWF	T1	; 4 INTO W and then T1
DEL1ML	NOP		; 5     9         993 NOP for extra cycle (4)
	DECFSZ	T1, F	; 6     10        994 Decrement T1, is it zero?
	GOTO	DEL1ML	; 7, 8  11, 12        No, so do it again
	NOP		; Yes so return   996
	NOP		;                 997
	NOP		;                 998
	RETURN		;                 999, 1000

; ----- End of DEL1M ----------------------------------------------------


; ----- DELPT1 - DELAY 100 MILLISECOND -------------------------------------

DELPT1	MOVLW	0x64	; LOAD 100 to wait 100 ms
	MOVWF	T2	; INTO W and then T2
DELPT1L	CALL	DEL1M	; Delay 1 millisecond
	DECFSZ	T2, F	; Decrement T2, is it zero?
	GOTO	DELPT1L	; No, so do it again
	RETURN		; Yes so return

; ----- End of DEL1M ----------------------------------------------------



;------ RDCHAN ----------------- Called to read the channel

; Returns channel number (0 - 9) in W and adds 128 (sets bit 7) if TX active

RDCHAN	NOP			; Checks and acts on switches and buttons

	MOVF	PORTC, W	; Read switches
        MOVWF	PTCSW		; Move into Port C Switch variable

	MOVF	PORTB, W	; Read switches
        MOVWF	PTBSW		; Move into Port B Switch variable

TCH1	MOVF	PTCSW, W	; Move Port C Switches into W
	ANDLW	0x10		; Mask in RC4 = Chan 1 return 0
	BTFSC	STATUS, ZERO	; skip next if Chan 1 selected
	GOTO	TCH2		; go and test for channel 2

	MOVLW	0x00		; Move 0 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH2	MOVF	PTCSW, W	; Move Port C Switches into W
	ANDLW	0x20		; Mask in RC5 = Chan 2 return 1
	BTFSC	STATUS, ZERO	; skip next if Chan 2 selected
	GOTO	TCH3		; go and test for channel 3

	MOVLW	0x01		; Move 1 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH3	MOVF	PTCSW, W	; Move Port C Switches into W
	ANDLW	0x40		; Mask in RC6 = Chan 3 return 2
	BTFSC	STATUS, ZERO	; skip next if Chan 3 selected
	GOTO	TCH4		; go and test for channel 4

	MOVLW	0x02		; Move 2 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH4	MOVF	PTCSW, W	; Move Port C Switches into W
	ANDLW	0x80		; Mask in RC7 = Chan 4 return 3
	BTFSC	STATUS, ZERO	; skip next if Chan 4 selected
	GOTO	TCH5		; go and test for channel 5

	MOVLW	0x03		; Move 3 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH5	MOVF	PTBSW, W	; Move Port B Switches into W
	ANDLW	0x01		; Mask in RB0 = Chan 5 return 4
	BTFSC	STATUS, ZERO	; skip next if Chan 5 selected
	GOTO	TCH6		; go and test for channel 6

	MOVLW	0x04		; Move 4 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH6	MOVF	PTBSW, W	; Move Port B Switches into W
	ANDLW	0x02		; Mask in RB1 = Chan 6 return 5
	BTFSC	STATUS, ZERO	; skip next if Chan 6 selected
	GOTO	TCH7		; go and test for channel 7

	MOVLW	0x05		; Move 5 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH7	MOVF	PTBSW, W	; Move Port B Switches into W
	ANDLW	0x04		; Mask in RB2 = Chan 7 return 6
	BTFSC	STATUS, ZERO	; skip next if Chan 7 selected
	GOTO	TCH8		; go and test for channel 8

	MOVLW	0x06		; Move 6 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH8	MOVF	PTBSW, W	; Move Port B Switches into W
	ANDLW	0x08		; Mask in RB3 = Chan 8 return 7
	BTFSC	STATUS, ZERO	; skip next if Chan 8 selected
	GOTO	TCH9		; go and test for channel 9

	MOVLW	0x07		; Move 7 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH9	MOVF	PTBSW, W	; Move Port B Switches into W
	ANDLW	0x10		; Mask in RB4 = Chan 9 return 8
	BTFSC	STATUS, ZERO	; skip next if Chan 9 selected
	GOTO	TCH10		; go and test for channel 10

	MOVLW	0x08		; Move 8 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX

TCH10	MOVF	PTBSW, W	; Move Port B Switches into W
	ANDLW	0x20		; Mask in RB5 = Chan 10 return 9
	BTFSC	STATUS, ZERO	; skip next if Chan 10 selected
	GOTO	SET0		; No channel selected, so select 0

	MOVLW	0x09		; Move 9 into W
	MOVWF	RETCH		; and move into return channel value
	GOTO	TTX		; now go and test for TX
	
SET0	CLRF	RETCH		; Set Channel to zero for non-selected case
	GOTO	TTX		; now go and test for TX
	
TTX	NOP			; Tests for TX

	MOVF	PTCSW, W	; Move Port C Switches into W
	ANDLW	0x08		; Mask in RC3 = TX if Hi
	BTFSS	STATUS, ZERO	; skip next if TX selected
	GOTO	PREPRTN		; On receive, so just return

	BSF	RETCH, 7	; On TX, so set the TX bit

PREPRTN	MOVF	RETCH, W	; Move the channel and TX flag into W

	RETURN			; with channel number and TX bit in W

;-----------------------------------------------------------------------------

BOOTRX	NOP

	CALL	SENDXR5		; Send Register 5
	CALL	SENDRR4		; Send RX Register 4
	CALL	SENDXR3		; Send Register 3
	CALL	SENDRR2		; Send RX Register 2
	CALL	SENDRR1		; Send RX Register 1
	CALL	SENDRR0		; Send RX Register 0

	RETURN

BOOTTX	NOP
	BCF	RETCH, 7	; On TX, so clear the TX bit

	CALL	SENDXR5		; Send Register 5
	CALL	SENDTR4		; Send TX Register 4
	CALL	SENDXR3		; Send Register 3
	CALL	SENDTR2		; Send TX Register 2
	CALL	SENDTR1		; Send TX Register 1
	CALL	SENDTR0		; Send TX Register 0

	RETURN

SWRXCH	NOP

	CALL	SENDRR1		; Send RX Register 1
	CALL	SENDRR0		; Send RX Register 0

	RETURN

SWTXCH	NOP
	BCF	RETCH, 7	; On TX, so clear the TX bit

	CALL	SENDTR1		; Send TX Register 1
	CALL	SENDTR0		; Send TX Register 0

	RETURN

SWTOTX	NOP
	BCF	RETCH, 7	; On TX, so clear the TX bit

	CALL	SENDTR4		; Send TX Register 4
	CALL	SENDTR2		; Send TX Register 2
	CALL	SENDTR1		; Send TX Register 1
	CALL	SENDTR0		; Send TX Register 0

	RETURN

SWTORX	NOP

	CALL	SENDRR4		; Send RX Register 4
	CALL	SENDRR2		; Send RX Register 2
	CALL	SENDRR1		; Send RX Register 1
	CALL	SENDRR0		; Send RX Register 0

	RETURN

SENDXR5	NOP			; Send Register 5
				; Always 0x00580005
	MOVLW	0x00		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0x58
	MOVWF	BYTE2
	MOVLW	0x00
	MOVWF	BYTE3
	MOVLW	0x05
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

SENDRR4	NOP			; Send RX Register 4
				; Always 0x00EC803C
	MOVLW	0x00		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0xEC
	MOVWF	BYTE2
	MOVLW	0x80
	MOVWF	BYTE3
	MOVLW	0x3C
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

;SENDTR4	NOP			; Send TX Register 4 /256
;				; Always 0x00A2803C
;	MOVLW	0x00		; so populate BYTE1 - BYTE4
;	MOVWF	BYTE1
;	MOVLW	0xA2
;	MOVWF	BYTE2
;	MOVLW	0x80
;	MOVWF	BYTE3
;	MOVLW	0x3C
;	MOVWF	BYTE4
;
;	CALL	SENDWD		; and send them
;
;	RETURN

SENDTR4	NOP			; Send TX Register 4 /80
				; Always 0x00C2803C
	MOVLW	0x00		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0xC2
	MOVWF	BYTE2
	MOVLW	0x80
	MOVWF	BYTE3
	MOVLW	0x3C
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

SENDXR3	NOP			; Send Register 3
				; Always 0x000004B3
	MOVLW	0x00		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0x00
	MOVWF	BYTE2
	MOVLW	0x04
	MOVWF	BYTE3
	MOVLW	0xB3
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

SENDRR2	NOP			; Send RX Register 2
				; Always 0x00004E42
	MOVLW	0x00		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0x00
	MOVWF	BYTE2
	MOVLW	0x4E
	MOVWF	BYTE3
	MOVLW	0x42
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

SENDTR2	NOP			; Send TX Register 2
				; Always 0x18014E42
	MOVLW	0x18		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0x01
	MOVWF	BYTE2
	MOVLW	0x4E
	MOVWF	BYTE3
	MOVLW	0x42
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

SENDRR1	NOP			; Send RX Register 1
				; 0x0800xxxx
	MOVLW	0x08		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0x00
	MOVWF	BYTE2

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LURR1B3		; Look up Byte3
	MOVWF	BYTE3

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LURR1B4		; Look up Byte4
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

SENDTR1	NOP			; Send TX Register 1
				; 0x0800xxxx
	MOVLW	0x08		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0x00
	MOVWF	BYTE2

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LUTR1B3		; Look up Byte3
	MOVWF	BYTE3

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LUTR1B4		; Look up Byte4
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

SENDRR0	NOP			; Send RX Register 0
				; 0x004Cxxxx
	MOVLW	0x00		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1
	MOVLW	0x4C
	MOVWF	BYTE2

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LURR0B3		; Look up Byte3
	MOVWF	BYTE3

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LURR0B4		; Look up Byte4
	MOVWF	BYTE4

	CALL	SENDWD		; and send them

	RETURN

SENDTR0	NOP			; Send TX Register 0
				; 0x01xxxxxx
	MOVLW	0x01		; so populate BYTE1 - BYTE4
	MOVWF	BYTE1

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LUTR0B2		; Look up Byte2
	MOVWF	BYTE2

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LUTR0B3		; Look up Byte3
	MOVWF	BYTE3

	MOVF	LUPAGE, W	; Set page
	MOVWF	PCLATH		; for lookup
	MOVF	RETCH, W	; Fetch the channel
	CALL	LUTR0B4		; Look up Byte4
	MOVWF	BYTE4

	CALL	SENDWD		; and send them


	RETURN


;------ SENDWD --------------------------------------------------------------
;       Sends BYTE1, BYT2, BYTE3 and BYTE4 as a single word to the ADF4351

SENDWD	NOP

	BCF	PORTA, 2	; Set LE low
	MOVLW	0x04		; Move 4 (for 32-bit words)
	MOVWF	CNT8S		; Into the 8s counter

	MOVF	BYTE1, W	; Move the first byte
	MOVWF	SHIFTR		; into the shift register

BYTELUP	NOP
	MOVLW	0x08		; Move 8
	MOVWF	BITCNT		; Into the bit counter

BITLOOP	NOP
	BTFSC	SHIFTR, 7	; test the MSB
	BSF	PORTA, 1	; default data is low, so if bit not clear, set high
	NOP
	NOP
	NOP
	BSF	PORTA, 0	; Set clock high
	NOP
	NOP
	NOP
	BCF	PORTA, 0	; Set clock low
	NOP
	NOP
	NOP
	BCF	PORTA, 1	; Set data low

	BCF	STATUS, CARRY	; Clear the carry bit
	RLF	SHIFTR, F	; Shift the next bit in
	
	DECFSZ	BITCNT, F	; Decrement the bit counter
	GOTO	BITLOOP		; Do another bit if non-zero, else look for the next byte

	MOVF	BYTE2, W	; Move the next byte
	MOVWF	SHIFTR		; into the shift register

	MOVF	BYTE3, W	; Move the next byte
	MOVWF	BYTE2		; ready for next time

	MOVF	BYTE4, W	; Move the next byte
	MOVWF	BYTE3		; ready for the time after

	DECFSZ	CNT8S, F	; Decrement the byte counter
	GOTO	BYTELUP		; Do another if non-zero
	
	BSF	PORTA, 2	; End of 32 bits, so Set LE high
	
	RETURN
	
;------	End of SENDWD ---------------------------------------------------

	ORG	0x0200		; Put lookups in page 2

;------ LOOKUPS --------------------------------------------------

LURR1B3	ADDWF	PCL, F		; Receive R1 Byte 3
	RETLW	0x8F		; Chan 1
	RETLW	0x83		; Chan 2
	RETLW	0x83		; Chan 3
	RETLW	0x80		; Chan 4
	RETLW	0x83		; Chan 5
	RETLW	0x83		; Chan 6
	RETLW	0x83		; Chan 7
	RETLW	0x83		; Chan 8
	RETLW	0x80		; Chan 9
	RETLW	0x83		; Chan 10

LURR1B4	ADDWF	PCL, F		; Receive R1 Byte 4
	RETLW	0xA1		; Chan 1
	RETLW	0xE9		; Chan 2
	RETLW	0xE9		; Chan 3
	RETLW	0xC9		; Chan 4
	RETLW	0xE9		; Chan 5
	RETLW	0xE9		; Chan 6
	RETLW	0xE9		; Chan 7
	RETLW	0xE9		; Chan 8
	RETLW	0xC9		; Chan 9
	RETLW	0xE9		; Chan 10

;LUTR1B3	ADDWF	PCL, F		; Transmit R1 Byte 3 /256;
;	RETLW	0x84		; Chan 1
;	RETLW	0x80		; Chan 2
;	RETLW	0x82		; Chan 3
;	RETLW	0x82		; Chan 4
;	RETLW	0x80		; Chan 5
;	RETLW	0x80		; Chan 6
;	RETLW	0x82		; Chan 7
;	RETLW	0x80		; Chan 8
;	RETLW	0x82		; Chan 9
;	RETLW	0x82		; Chan 10

LUTR1B3	ADDWF	PCL, F		; Transmit R1 Byte 3 /80
	RETLW	0x80		; Chan 1
	RETLW	0x80		; Chan 2
	RETLW	0x80		; Chan 3
	RETLW	0x80		; Chan 4
	RETLW	0x80		; Chan 5
	RETLW	0x80		; Chan 6
	RETLW	0x80		; Chan 7
	RETLW	0x80		; Chan 8
	RETLW	0x80		; Chan 9
	RETLW	0x80		; Chan 10

;LUTR1B4	ADDWF	PCL, F		; Transmit R1 Byte 4 /256
;	RETLW	0xB1		; Chan 1
;	RETLW	0xC9		; Chan 2
;	RETLW	0x59		; Chan 3
;	RETLW	0x59		; Chan 4
;	RETLW	0xC9		; Chan 5
;	RETLW	0x79		; Chan 6
;	RETLW	0x59		; Chan 7
;	RETLW	0xC9		; Chan 8
;	RETLW	0x59		; Chan 9
;	RETLW	0x59		; Chan 10

LUTR1B4	ADDWF	PCL, F		; Transmit R1 Byte 4 /80
	RETLW	0xC9		; Chan 1
	RETLW	0x29		; Chan 2
	RETLW	0x79		; Chan 3
	RETLW	0x79		; Chan 4
	RETLW	0x29		; Chan 5
	RETLW	0x19		; Chan 6
	RETLW	0x79		; Chan 7
	RETLW	0x29		; Chan 8
	RETLW	0x79		; Chan 9
	RETLW	0x79		; Chan 10

LURR0B3	ADDWF	PCL, F		; Receive R0 Byte 3
	RETLW	0x07		; Chan 1
	RETLW	0x02		; Chan 2
	RETLW	0x02		; Chan 3
	RETLW	0x00		; Chan 4
	RETLW	0x02		; Chan 5
	RETLW	0x03		; Chan 6
	RETLW	0x03		; Chan 7
	RETLW	0x03		; Chan 8
	RETLW	0x00		; Chan 9
	RETLW	0x80		; Chan 10

LURR0B4	ADDWF	PCL, F		; Receive R0 Byte 4
	RETLW	0x68		; Chan 1
	RETLW	0x00		; Chan 2
	RETLW	0x40		; Chan 3
	RETLW	0x80		; Chan 4
	RETLW	0xC0		; Chan 5
	RETLW	0x00		; Chan 6
	RETLW	0x40		; Chan 7
	RETLW	0x80		; Chan 8
	RETLW	0xC0		; Chan 9
	RETLW	0x18		; Chan 10

;LUTR0B2	ADDWF	PCL, F		; Transmit R0 Byte 2 /256
;	RETLW	0x2B		; Chan 1
;	RETLW	0x2B		; Chan 2
;	RETLW	0x2B		; Chan 3
;	RETLW	0x2C		; Chan 4
;	RETLW	0x2C		; Chan 5
;	RETLW	0x2C		; Chan 6
;	RETLW	0x2C		; Chan 7
;	RETLW	0x2C		; Chan 8
;	RETLW	0x2C		; Chan 9
;	RETLW	0x2C		; Chan 10

LUTR0B2	ADDWF	PCL, F		; Transmit R0 Byte 2 /80
	RETLW	0x76		; Chan 1
	RETLW	0x76		; Chan 2
	RETLW	0x76		; Chan 3
	RETLW	0x77		; Chan 4
	RETLW	0x77		; Chan 5
	RETLW	0x77		; Chan 6
	RETLW	0x77		; Chan 7
	RETLW	0x77		; Chan 8
	RETLW	0x77		; Chan 9
	RETLW	0x77		; Chan 10

;LUTR0B3	ADDWF	PCL, F		; Transmit R0 Byte 3 /256
;	RETLW	0x82		; Chan 1
;	RETLW	0x80		; Chan 2
;	RETLW	0x82		; Chan 3
;	RETLW	0x00		; Chan 4
;	RETLW	0x00		; Chan 5
;	RETLW	0x00		; Chan 6
;	RETLW	0x01		; Chan 7
;	RETLW	0x00		; Chan 8
;	RETLW	0x80		; Chan 9
;	RETLW	0x80		; Chan 10

LUTR0B3	ADDWF	PCL, F		; Transmit R0 Byte 3 /80
	RETLW	0x80		; Chan 1
	RETLW	0x80		; Chan 2
	RETLW	0x80		; Chan 3
	RETLW	0x00		; Chan 4
	RETLW	0x00		; Chan 5
	RETLW	0x00		; Chan 6
	RETLW	0x00		; Chan 7
	RETLW	0x80		; Chan 8
	RETLW	0x80		; Chan 9
	RETLW	0x80		; Chan 10

;LUTR0B4	ADDWF	PCL, F		; Transmit R0 Byte 4 /256
;	RETLW	0x98		; Chan 1
;	RETLW	0x88		; Chan 2
;	RETLW	0x18		; Chan 3
;	RETLW	0x40		; Chan 4
;	RETLW	0x40		; Chan 5
;	RETLW	0x40		; Chan 6
;	RETLW	0xC0		; Chan 7
;	RETLW	0xC0		; Chan 8
;	RETLW	0x68		; Chan 9
;	RETLW	0xE8		; Chan 10

LUTR0B4	ADDWF	PCL, F		; Transmit R0 Byte 4 /80
	RETLW	0x58		; Chan 1
	RETLW	0x18		; Chan 2
	RETLW	0x68		; Chan 3
	RETLW	0x10		; Chan 4
	RETLW	0x10		; Chan 5
	RETLW	0x10		; Chan 6
	RETLW	0x70		; Chan 7
	RETLW	0x08		; Chan 8
	RETLW	0x38		; Chan 9
	RETLW	0x58		; Chan 10

;------ End of LOOKUP TABLES -----------------------------------------
	
	END
 