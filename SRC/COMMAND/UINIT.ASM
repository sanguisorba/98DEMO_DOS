TITLE   COMMAND Initialization messages

        INCLUDE COMSW.ASM

        INCLUDE IFEQU.ASM

INIT    SEGMENT PUBLIC BYTE

        PUBLIC  BADCOMLKMES

        PUBLIC  HEADER
        IF      NOT IBM
HEADER  DB      13,10,"Command ﾊﾞｰｼﾞｮﾝ 2.11 (for 3.1)"
        IF      HIGHMEM
        DB      "H"
        ENDIF
        DB      13,10,"$"
        ENDIF
        IF IBM
HEADER  DB      13,10,13,10,"TeleVideo Personal Computer DOS Vers. 2.11",13,10
        DB      "(C) Copyright TeleVideo Systems, Inc. 1983",13,10
	DB	"(C) Copyright Microsoft Corp. 1981, 1982, 1983",13,10,"$"
        ENDIF

BADCOMLKMES DB  "COMMAND.COM が見つかりません",13,10,"$"

INIT    ENDS

        END
