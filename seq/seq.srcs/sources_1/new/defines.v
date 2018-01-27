`define	INSTBUS	79:0  //地址总线，也是指令长度
`define	ICODE	79:76
`define	IFUN	75:72
`define	RA	71:68
`define	RB	67:64
`define	V	63:0
`define	D	63:0
`define	Dest	75:8

`define	WORD	63:0

// Instruction Codes 
`define     IHALT           4'H0    //halt???????ú??,?????à??
`define     INOP            4'H1   
`define     IRRMOVQ         4'H2  
`define     IIRMOVQ         4'H3
`define     IRMMOVQ         4'H4
`define     IMRMOVQ         4'H5
`define     IOPQ            4'H6
`define     IJXX            4'H7
`define     ICALL           4'H8
`define     IRET            4'H9
`define     IPUSHQ          4'HA
`define     IPOPQ          4'HB
`define	 	IIADDQ			4'HC

/* Function codes */
`define     FNONE           4'H0  //??????????
// INOP
`define     FADDQ           4'H0  
`define     FSUBQ          4'H1
`define     FANDQ           4'H2
`define     FXORQ           4'H3
// IJXX
`define     FJMP            4'H0
`define     FJLE            4'H1
`define     FJL             4'H2
`define     FJE             4'H3
`define     FJNE            4'H4
`define     FJGE            4'H5
`define     FJG             4'H6
// FRRMOVL
`define     FRRMOVQ         4'H0
// ICMOVXX (FRRMOVL)
`define     FCMOVLE         4'H1
`define     FCMOVL          4'H2
`define     FCMOVE          4'H3
`define     FCMOVNE         4'H4
`define     FCMOVGE         4'H5
`define     FCMOVG          4'H6

/* Register Codes */
`define     RRSP            4'H4
`define     RNONE           4'HF

/* Status Codes */
`define     SAOK            4'H1
`define     SADR            4'H2
`define     SINS            4'H3
`define     SHLT            4'H4

/* Size Codes */

/*`define     NIBBLE          3:0
`define     ZERONIBBLE      4'h0
`define     BYTE            7:0
`define     BYTE0           47:40
`define     BYTE1           39:32
`define     BYTE2           31:24
`define     BYTE3           23:16
`define     BYTE4           15:8
`define     BYTE5           7:0
`define     WORD            31:0
`define     ZEROWORD        4'h0
`define     INSTBUS         47:0
`define     ICODE           47:44
`define     IFUN            43:40
`define     RA              39:36
`define     RB              35:32
`define     DEST            39:8
`define     INSTMEMNUM      131071
`define     WORDNUM         32
`define     REGNUM          8*/

/* Other Codes */
`define     ENABLE          1'b1
`define     DISABLE         1'b0
`define     ALUADD          4'H0

`define	INSTBUS	79:0  //???·×??????????????¤??
`define	ICODE	79:76
`define	IFUN	75:72
`define	RA	71:68
`define	RB	67:64
`define	V	63:0
`define D	63:0
`define	Dest	75:8

`define WORD 63:0

`define RNONE 4'HF