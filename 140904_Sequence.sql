-- ������ ���� Syntax
CREATE SEQUENCE test_sequence
    [START WITH 1]
    [INCREMENT BY 1]
    [MAXVALUE 300 | NOMAXVALUE]
    [MINVALUE 10 | NOMINVALUE]
    [CYCLE | NOCYCLE]
    [CACHE | NOCACHE]
    
    -- 8000���� �����ϴ� �������� ��������
CREATE SEQUENCE  test_seq
 START WITH  8000
INCREMENT BY 1
 CACHE 20;
 
 -- �������� ���������� �����Ǿ����� ��ȸ�� ����
SELECT test_seq.NEXTVAL FROM DUAL;
SELECT test_seq.NEXTVAL FROM DUAL; --- ������ 
SELECT test_seq.CURRVAL FROM DUAL; --- ���簪