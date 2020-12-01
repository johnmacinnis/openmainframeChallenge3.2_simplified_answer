//MATEDKD JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID                             00010000
//PLIB    JCLLIB ORDER=(MATE1.PROCLIB)                                  00011000
//*                                                                     00012000
//*  COMPILE A COBOL PROGRAM                                            00013000
//*                                                                     00014000
//CL      EXEC COBOLCL,                                                 00015000
//             COPYLIB=MATEDK.COPYLIB,         <= COPYBOOK LIBRARY      00016000
//             LOADLIB=MATEDK.LOADLIB,         <= LOAD LIBRARY          00017000
//             SRCLIB=MATEDK.COBOL.SRCLIB,     <= SOURCE LIBRARY        00018000
//             MEMBER=CBLCOVID                 <= SOURCE MEMBER         00019006
