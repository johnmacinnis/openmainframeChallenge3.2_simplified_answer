      *-----------------------
       IDENTIFICATION DIVISION.
      *------------------------
      * My 'simple answer to Openmainframe challenge 3.2
      * Using data set utility first create  a PDS with 'V'ariable
      * record length. Then transfer the cvs file to the VB data set.
      * It does not work if for a FB data set. (because of uneven record length)
      *-----------------------
       PROGRAM-ID.    CBLCOVID
       AUTHOR.        J_MAC.
      *--------------------
       ENVIRONMENT DIVISION.
      *--------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

             SELECT IN001 ASSIGN TO COVIDIN
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE IS SEQUENTIAL.

      *-------------
       DATA DIVISION.
      *-------------
       FILE SECTION.

       FD  IN001 RECORDING MODE V.
       01  COVID-REC-FIELDS   PIC X(104).

      *
       WORKING-STORAGE SECTION.

       01  UNSTRING-COVID-RECORDS.
           05  UCR-COUNTRY         PIC X(50).
           05  UCR-COUNTRY-CODE    PIC X(4).
           05  UCR-SLUG            PIC X(50).
           05  UCR-NEW-CNFRM       PIC 9(5).
           05  UCR-TOT-CNFRM       PIC 9(8).
           05  UCR-NEW-DEATH       PIC 9(5).
           05  UCR-TOT-DEATH       PIC 9(5).
           05  UCR-NEW-RECVR       PIC 9(5).
           05  UCR-TOT-RECVR       PIC 9(8).
           05  UCR-TIMESTAMP       PIC X(25).

       01  WS-ASTER            PIC X(80) VALUE ALL '*'.

       01 NUMBER-DISPLAY-FORMAT.
           05 NEW-CNFRM            PIC ZZZ,999.
           05 TOT-CNFRM            PIC ZZ,ZZZ,999.
           05 NEW-DEATH            PIC ZZZ,999.
           05 TOT-DEATH            PIC ZZZ,999.
           05 NEW-RECVR            PIC ZZZ,999.
           05 TOT-RECVR            PIC ZZ,ZZZ,999.

       01 FLAGS.
         05 LASTREC           PIC X VALUE SPACE.
      *------------------
       PROCEDURE DIVISION.
      *------------------
       MAIN.
            OPEN INPUT IN001.

            PERFORM UNTIL LASTREC = 'Y'
              PERFORM READ-RECORD
              PERFORM DISPLAY-RECORD
            END-PERFORM.

            CLOSE IN001
            STOP RUN.


       READ-RECORD.
           READ IN001
           AT END MOVE 'Y' TO LASTREC
           END-READ.

       DISPLAY-RECORD.
           UNSTRING COVID-REC-FIELDS DELIMITED BY ','
              INTO UCR-COUNTRY
                   UCR-COUNTRY-CODE
                   UCR-SLUG
                   UCR-NEW-CNFRM
                   UCR-TOT-CNFRM
                   UCR-NEW-DEATH
                   UCR-TOT-DEATH
                   UCR-NEW-RECVR
                   UCR-TOT-RECVR
                   UCR-TIMESTAMP.

      ****  // DISPLAY FRIENDLY NUMBER FORMAT
            MOVE UCR-NEW-CNFRM TO NEW-CNFRM
            MOVE UCR-TOT-CNFRM TO TOT-CNFRM
            MOVE UCR-NEW-DEATH TO NEW-DEATH
            MOVE UCR-TOT-DEATH TO TOT-DEATH
            MOVE UCR-NEW-RECVR TO NEW-RECVR
            MOVE UCR-TOT-RECVR TO TOT-RECVR

            DISPLAY 'DATE: ' UCR-TIMESTAMP(1:10)
            DISPLAY 'TIME: ' UCR-TIMESTAMP(12:8)
            DISPLAY 'COUNTRY: ' UCR-COUNTRY
            DISPLAY 'COUNTRY CODE: ' UCR-COUNTRY-CODE
            DISPLAY 'SLUG: ' UCR-SLUG
            DISPLAY 'NEW CONFIRMED CASES: ' NEW-CNFRM
            DISPLAY 'TOTAL CONFIRMED CASES: ' TOT-CNFRM
            DISPLAY 'NEW DEATHS: ' NEW-DEATH
            DISPLAY 'TOTAL DEATHS: ' TOT-DEATH
            DISPLAY 'NEW RECOVERIES: ' NEW-RECVR
            DISPLAY 'TOTAL RECOVERIES: ' TOT-RECVR
            DISPLAY WS-ASTER.

