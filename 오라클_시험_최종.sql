--1. �Ʒ��� ����(-23-) ����� �������� EMPFAMILY ���̺��� NICKNAME�÷��� �̿��Ͽ� ù���ڸ� �ҹ��ڰ� �ǵ��� ǥ���Ͻÿ�.
SELECT
        NAME    AS NICKNAME,
        LOWER(SUBSTR(NAME, 1, 1)) || SUBSTR(NAME, 2, INSTR(NAME, ' ')-1) || LOWER(SUBSTR(NAME, INSTR(NAME, ' '), 2)) || SUBSTR(NAME,  INSTR(NAME, ' ')+2) AS NEW_NIMNAME
  FROM  EMPFAMILY;
  




--2. �μ��� �հ�ݾ��� ���Ϸ��� �Ѵ�. �Ʒ��� ����(-23-) ����� �������� �ۼ��Ͻÿ�. (���ļ����� �μ���ȣ��)






--3. EMPFAMILY ���̺��� TEL�÷��� ���ڷθ� ���� �Ǿ�� �ϳ� ����(�ѱ�, ����,Ư����������)�� ���Ե� ������ �����͸� �����Ϸ��� �Ѵ�.
--      �Ʒ��� ���� ����� �������� ����Ͻÿ�.
--      (��Ī TONUMBER �÷��� ��Ư�����ڿ��� ������ ���ڸ� ���� // ��Ī TOCHAR �÷��� ���ڸ� ������ ���ڿ��� ����)
--SELECT * FROM EMPFAMILY;


SELECT
        PHONE,
        REGEXP_REPLACE(PHONE, '[^0-9]') AS TONUMBER,
        REGEXP_REPLACE(PHONE, '[0-9]')  AS TOCHAR
  FROM  EMPFAMILY
 WHERE  PHONE IS NOT NULL;
 
  
  



--4. ȸ�翡�� �������ø� �����Ͽ� �޿��� ���� ���Թ޴� ��� 4���� �ξ簡���� 1000���� ���� �޿��� �����Ϸ��� �Ѵ�.
--      �Ʒ� �������� �޿��� ���������� ����Ͻÿ�.
--      (��, ������ SAL�� �޴� ����� ������ ��� �Ի����ڰ� ���� ���� ������Ը� �����ϰ� �������� �����Ѵ�.)
--SELECT * FROM EMPFAMILY;
SELECT
        A.EMPNO           AS EMPNO,
        A.SAL             AS SAL,
        A.SAL + B.PLUS    AS TOTAL_SAL
  FROM  EMP     A
 INNER
  JOIN  (
            SELECT
                    EMPNO               AS EMPNO,
                    COUNT(EMPNO)        AS CNT,
                    COUNT(EMPNO) * 1000 AS PLUS
              FROM  EMPFAMILY
             WHERE  EMPNO   IN  (
                                    SELECT
                                            Z.EMPNO
                                      FROM  (
                                                SELECT
                                                        ROW_NUMBER()    OVER( ORDER BY SAL )    AS RN,
                                                        EMPNO                                   AS EMPNO
                                                  FROM  EMP
                                                 ORDER  BY SAL, HIREDATE
                                            )   Z
                                     WHERE  Z.RN <= 4
                                 ) 
             GROUP  BY EMPNO
        )       B
    ON  A.EMPNO = B.EMPNO
 ORDER  BY  A.SAL;
  
 
 
 
 
--5. EMPFAMILY���� ���ɴ뺰 ���� ���� ������ ���� ���� ������ ���ϰ� ���� ���� ���������� ���� 10,000���� ����,
--      ���� ���� ���������� ���� 6,000�� �� �ݾ��� �Ʒ��� ���� �������� ���.
--      (��, 50�� �̻��� AGE50�뿡 �����ϸ�, �� �ִ�/�ּҿ������� ������ ������ �ݾ��� ���̳ʽ��� ����-, �׷��� ���� ���� +�� ǥ���� ��)



SELECT 
        TO_CHAR(MAX(CASE WHEN AGE LIKE '2%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '2%' THEN SAL ELSE NULL END),'999,999')  AS AGE20,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '3%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '3%' THEN SAL ELSE NULL END),'999,999')  AS AGE30,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '4%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '4%' THEN SAL ELSE NULL END),'999,999')  AS AGE40,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '5%' OR AGE LIKE '6%' OR AGE LIKE '7%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '5%' THEN SAL ELSE NULL END),'999,999')  AS AGE50OVER
  FROM  EMPFAMILY;
  
  
  
  

--6. TMPTBL ���̺��� �̿��Ͽ� �Ʒ��� ���� ����� �������� �ۼ��Ͻÿ�.
/*
    ����) F1, C1 �÷� �׷캰�� VAL ���� ���Ͽ� ���� �ٸ� ������ ���� ������ ��� BOTH��, �� ������ ���� ������ ��� �ش� ���� ǥ���Ѵ�.
*/


SELECT * FROM TMPTBL;
-- �ߺ����� ������ BOTH






--7. EMPFAMILY ���̺��� �̿��Ͽ� �Ʒ��� ���� ����� �������� ������ �ۼ��Ͻÿ�.
--      ���� �������� COL3 ���� YEAR_SAL�� �����Ǿ� ��µǵ��� �ۼ��Ͻÿ�.
--      WINDOW�Լ��� �̿��ϴ� �����, WINDOW�Լ��� �̿������ʴ� ��� �ΰ��� ������� �ۼ��� ��
--SELECT * FROM EMPFAMILY;

-- WINDOW�Լ� ���
SELECT
        EMPNO,
        SAL     AS  YEAR_SAL,
        SUM(SAL)   OVER( PARTITION BY EMPNO  ORDER BY SAL)  AS COL3
  FROM  EMPFAMILY
 ORDER  BY  EMPNO;
 
 
 
 -- WINDOW�Լ� �̻��










--8. �Ʒ��� ���� ������ �� IP������ȣ ������ ���ĵǵ��� IP����Ʈ�� �����Ͻÿ� (IP_TABLE ���)
    /*
        WINDOW�Լ��� �̿��ϴ� �����, WINDOW�Լ��� �̿������ʴ� ��� �ΰ��� ������� �ۼ��� ��
    */
 
SELECT * FROM IP_TABLE;


-- WINDOW�Լ� ���
SELECT
        Z.IP,
        Z.IP01,
        Z.IP02,
        Z.IP03,
        Z.IP04,
        ROW_NUMBER()    OVER( ORDER BY IP )                                     AS TPT_NUM,
        DENSE_RANK()    OVER( PARTITION BY IP01||IP02||IP03 ORDER BY IP )       AS GRP_NUM,
        (
            SELECT
                    COUNT(*)
              FROM  IP_TABLE
             WHERE  IP LIKE Z.IP01||'.'||Z.IP02||'.'||Z.IP03 || '%'
        )   AS IP_CNT,
        (
            SELECT
                    COUNT(*)
              FROM  IP_TABLE
        )   AS IP_TOPCNT
  FROM  (
            SELECT
                    IP,
                    SUBSTR(IP, 1, POINT1_S -1)                          AS IP01,
                    SUBSTR(IP, POINT1_S +1 , POINT2_S-POINT1_S-1)       AS IP02,
                    SUBSTR(IP, POINT2_S +1, POINT3_S-POINT2_S-1)        AS IP03,
                    SUBSTR(IP, POINT3_S +1)                             AS IP04
              FROM  (
                        SELECT
                                IP,
                                INSTR(IP, '.', 1)       AS POINT1_S,
                                INSTR(IP, '.', 1, 2)    AS POINT2_S,
                                INSTR(IP, '.', 1, 3)    AS POINT3_S
                          FROM  IP_TABLE
                    )
        )   Z;
        
        


 -- WINDOW�Լ� �̻��
        
 
 
 
 
 
 
 
--9. ��Į�� ���� ������ �̿��ؼ� ��������(GUBUN_NM)���� ǥ���ϰ�, ��� ����� ������ �Ʒ��� ���� ���·� EMPNO, ENAMEó�� �ݺ��Ǵ� ���� ù��° ���� �ѹ��� �������� ����Ͻÿ�.

SELECT * FROM CODE;

SELECT * FROM EMPFAMILY;


SELECT
        CASE TRIM((ROW_NUMBER()  OVER( PARTITION BY A.EMPNO ORDER BY A.EMPNO ))) WHEN '1' THEN TO_CHAR(A.EMPNO) 
                                                                                 WHEN '2' THEN ' '
                                                                                 WHEN '3' THEN ' '
                                                                                 WHEN '4' THEN ' '
        END AS EMPNO,
        CASE TRIM((ROW_NUMBER()  OVER( PARTITION BY A.EMPNO ORDER BY A.EMPNO ))) WHEN '1' THEN A.ENAME          
                                                                                 WHEN '2' THEN ' '
                                                                                 WHEN '3' THEN ' '
                                                                                 WHEN '4' THEN ' '
        END AS ENAME,
        CASE TRIM(B.FM_CD)
                    WHEN '1' THEN '����'
                    WHEN '2' THEN '����'
                    WHEN '3' THEN '��'
                    WHEN '4' THEN '��'
                    WHEN '5' THEN '��'
        END AS RELATION,
        B.NAME
  FROM  EMP         A
 INNER
  JOIN  EMPFAMILY   B
    ON  A.EMPNO = B.EMPNO
 INNER  
  JOIN  CODE   C
    ON  B.FM_CD = C.CODE;









--10. 2016�� ��ݱ� �������� ������ڸ� �����Ϸ��� �Ѵ�.
--      �Ʒ��� ���� ���� ������ ��ݱ� ����ϼ��� ǥ�õǵ��� �ۼ��Ͻÿ�.
/*
    1. EMP_CHULGYEOL ���̺��� ���, ����, ����� ��ϵ�.
    2. ���� 3ȸ�� ��� 1ȸ
    3. ���� 3ȸ�� ��� 1ȸ
    
    STATE   : 1 - ���
            : 2 - ����
            : 3 - ����
*/

SELECT * FROM EMP_CHULGYEOL;


SELECT
        A.EMPNO,
        C.DNAME,
        SUBSTR(LAST_DAY(TO_DATE('20160101', 'YYYYMMDD')), -2, 2) AS JAU,        -- ���̳ʽ� ���
        SUBSTR(LAST_DAY(TO_DATE('20160201', 'YYYYMMDD')), -2, 2) AS FEB,
        SUBSTR(LAST_DAY(TO_DATE('20160301', 'YYYYMMDD')), -2, 2) AS MAR,
        SUBSTR(LAST_DAY(TO_DATE('20160401', 'YYYYMMDD')), -2, 2) AS APR,
        SUBSTR(LAST_DAY(TO_DATE('20160501', 'YYYYMMDD')), -2, 2) AS MAY,
        SUBSTR(LAST_DAY(TO_DATE('20160601', 'YYYYMMDD')), -2, 2) AS JUN
  FROM  EMP_CHULGYEOL   A
 INNER
  JOIN  EMP             B
    ON  A.EMPNO     = B.EMPNO
 INNER
  JOIN  DEPT            C
    ON  B.DEPTNO    = C.DEPTNO
 GROUP  BY  A.EMPNO, C.DNAME;
    
/*��� ���ϱ�************************************************************/

--SELECT
--        EMPNO,
--        CHULGEUN_DT,
--        CASE STATE 
--                    WHEN '1' THEN '���'
--                    WHEN '2' THEN '����'
--                    WHEN '3' THEN '����'
--        END AS STATE,
--        COUNT(*)    OVER( PARTITION BY STATE ORDER BY EMPNO )   AS CNT
--  FROM  EMP_CHULGYEOL
-- ORDER  BY EMPNO;
--        
-- 
 
 
 
 
 
 
--11. ���������񺰷� �Ʒ��� ���� ���°� �������� ������ �ۼ��Ͻÿ�.
/*
    ����) SQL_GB (4:����������, 1:������������)
    ������̺� : SEOLMUM_M
*/














--12. �μ��� �׷쿡 ���� ��ȣ�� �Ʒ��� ���� �������� ������ �ۼ��Ͻÿ�.
--      �� window�Լ��� �̿����� �ʰ�, �μ���ȣ, ename�� ������������ �����Ͽ� ��ȣ �ο�














--13. �λ����̺�, �������̺��� �̿��� �Ի�����Ϸκ��� 2�� ������ ������� ������ ���ϼ���.
--  INSA table / YEONGA table
--SELECT * FROM INSA;
--SELECT * FROM YEONGA;