     CREATE OR REPLACE PROCEDURE BUDGET_CALC AS
        V_AMT  NUMBER       := 0;
     BEGIN
        DELETE FROM  TEST24
        WHERE  BUDGET IN (SELECT DISTINCT BUDGET
                          FROM   TEST25 );
--            
        FOR I IN(SELECT SER,
                        BUDGET, 
                        SEQ,
                        SIGNAL,
                        FBUDGET,
                        TBUDGET
                 FROM   TEST25
                 ORDER BY 
                        SER,
                        BUDGET, 
                        SEQ     )
        LOOP
        /*DATA�� FROM�׸�� TO�׸� ������ ���� �ι�/��ǰ���� SUM�Ѵ�. */
        FOR J IN(SELECT ITEM,SUM(AMT_AM) AMT_AM
                 FROM   TEST24
                 WHERE  BUDGET BETWEEN I.FBUDGET AND I.TBUDGET
                 GROUP BY 
                        ITEM)
        LOOP
           /* ������ �����ϰ����ϴ� �׸���
              �о�� ��ǰ���� ���� ���� ������ ���´�*/
           DECLARE
           BEGIN
             SELECT  AMT_AM
             INTO    V_AMT
             FROM    TEST24
             WHERE   ITEM   = J.ITEM 
             AND     BUDGET = I.BUDGET;
           EXCEPTION
                WHEN NO_DATA_FOUND THEN
                /* �ش��׸��� ��ǰ�� ���� ������ ������ �����ڸ�  ��������
                   ������� �տ����� ����  ���̴� */
                V_AMT := 0;
           END;
           /* ������ ��ȣ�� ���� ������ �����Ѵ� */
           IF    I.SIGNAL = '+'  THEN
                 V_AMT := V_AMT+J.AMT_AM;
           ELSIF I.SIGNAL = '-'  THEN
                 V_AMT := V_AMT-J.AMT_AM;
           ELSIF I.SIGNAL = '*'  THEN
                 V_AMT := V_AMT*J.AMT_AM;
           ELSIF I.SIGNAL = '/'  THEN
                 V_AMT := V_AMT/J.AMT_AM;
           END IF;
           /* ������ ���갪�� �ش� KEY�� �������� UPDATE �ϰ� 
              �ش簪�� ������ INSERT �Ѵ� */
           UPDATE TEST24
           SET    AMT_AM  = V_AMT
           WHERE  ITEM    = J.ITEM
           AND    BUDGET  = I.BUDGET;
           IF SQL%NOTFOUND  THEN
              INSERT INTO TEST24(ITEM,BUDGET,AMT_AM)
              VALUES (J.ITEM,I.BUDGET,V_AMT);
           END IF; /*END IF SQL%NOTFOUND THEN */
        END LOOP;  /*END LOOP FOR J IN()*/
      END LOOP;        /*END LOOP FOR I IN()*/
    END;