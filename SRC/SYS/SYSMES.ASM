   TITLE Message file for MS-DOS SYS Program

FALSE   EQU     0
TRUE    EQU     NOT FALSE

        INCLUDE DOSSYM.ASM

Message MACRO   label,text
        PUBLIC  label,label&Len
label       DB  text
label&Len   DW  $-label
ENDM


IBMJAPVER EQU   FALSE

CONST   SEGMENT PUBLIC BYTE

; only this message must be terminated with a $
        PUBLIC  BadVer
BADVER  DB      "����DOS�̃o�[�W�����ł͎��s�ł��܂���",13,10,"$"

        IF      IBMJAPVER
        Message BadDisk,<"���̃f�B�X�N�͋N���ł��܂���">
        ENDIF

        Message BadDrv,<"�����ȃh���C�u�w��ł�">
        Message BadParm,<"�����ȃp�����[�^�ł�">
        Message NoDest,<"�V�X�e���̈�̂��߂̋󂫂�����܂���">
        Message BadSiz,<"�V�X�e���̃T�C�Y�������܂���">
        Message Done,<"�V�X�e�����]������܂���">

        PUBLIC  GetSys,SysDrv,GetSysLen
GETSYS      DB      "�V�X�e���f�B�X�N���h���C�u "
SYSDRV      DB      "A �ɍ�������",13,10
            DB      "�ǂꂩ�L�[�������Ă�������",13,10
GetSysLen   DW  GetSysLen-GetSys

CONST   ENDS

DATA    SEGMENT BYTE PUBLIC
DATA    ENDS

CODE    SEGMENT
DG      GROUP   CODE,CONST,DATA
        ASSUME  CS:DG,DS:DG,ES:DG,SS:DG

CODE    ENDS
        END
