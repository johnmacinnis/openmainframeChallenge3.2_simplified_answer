//MATEDKW JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID                             00010007
//*                                                                     00020000
//*  RUN A COBOL PROGRAM                                                00030000
//*                                                                     00040000
//STEP01  EXEC PGM=CBLCOVID                                             00050012
//STEPLIB  DD  DSN=MATEDK.LOADLIB,DISP=SHR                              00060000
//COVIDIN  DD DSN=MATEDK.TEST.COVID,DISP=SHR                            00061014
//PRTLINE   DD SYSOUT=*                                                 00062006
//SYSOUT   DD  SYSOUT=*                                                 00070000
