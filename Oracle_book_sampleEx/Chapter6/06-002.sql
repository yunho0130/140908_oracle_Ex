CREATE TABLE TEST11 (
    COLL   VARCHAR2(20),         
    DEPT   VARCHAR2(20),                  
    FRE    NUMBER,   
    SUP    NUMBER,   
    JUN    NUMBER,   
    SEN    NUMBER,
    CONSTRAINT TEST11_PK PRIMARY KEY (COLL,DEPT)
                    );  
INSERT INTO TEST11 VALUES('��������','�װ����ְ��а�',120, 140, 140, 120);
INSERT INTO TEST11 VALUES('��������','�����а�',    240, 260, 240, 240);
INSERT INTO TEST11 VALUES('��������','�������а�',    118, 138, 136, 126);
INSERT INTO TEST11 VALUES('��������','������а�',    123, 141, 140, 120);
INSERT INTO TEST11 VALUES('��������','���ڰ��а�',    126, 141, 140, 128);
INSERT INTO TEST11 VALUES('��������','�����а�',    128, 132, 142, 126);
INSERT INTO TEST11 VALUES('��������','ȭ�а��а�',    122, 141, 141, 122);
INSERT INTO TEST11 VALUES('��������','������а�',    120, 140, 140, 120);
INSERT INTO TEST11 VALUES('��������','��ǻ�Ͱ��а�',  124, 145, 142, 121);
INSERT INTO TEST11 VALUES('��������','�������а�',    126, 144, 140, 120);
INSERT INTO TEST11 VALUES('��������','�ڵ�ȭ���а�',  122, 142, 144, 125);
INSERT INTO TEST11 VALUES('��������','����ڰ��а�',  121, 142, 143, 124);
COMMIT;
                
