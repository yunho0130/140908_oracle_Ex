-- 시퀀스 생성 Syntax
CREATE SEQUENCE test_sequence
    [START WITH 1]
    [INCREMENT BY 1]
    [MAXVALUE 300 | NOMAXVALUE]
    [MINVALUE 10 | NOMINVALUE]
    [CYCLE | NOCYCLE]
    [CACHE | NOCACHE]
    
    -- 8000부터 시작하는 시퀀스를 생성하자
CREATE SEQUENCE  test_seq
 START WITH  8000
INCREMENT BY 1
 CACHE 20;
 
 -- 시퀀스가 정상적으로 생성되었는지 조회해 보자
SELECT test_seq.NEXTVAL FROM DUAL;
SELECT test_seq.NEXTVAL FROM DUAL; --- 다음값 
SELECT test_seq.CURRVAL FROM DUAL; --- 현재값