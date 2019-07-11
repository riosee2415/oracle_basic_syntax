--����1) �μ����� ��� �޿����� ���� �޿��� �޴� ����� �����ȣ, �����, ����, �޿�, �μ���, �ٹ����� ����Ͻÿ�.

-- 1-1) ���� ������ Ǯ��
SELECT
        A.EMPNO,
        A.ENAME,
        A.JOB,
        A.SAL,
        B.DNAME,
        B.LOC
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.SAL       >   (
                            SELECT  
                                    TRUNC(AVG(SAL))
                              FROM  EMP     Z
                             WHERE  A.DEPTNO   = Z.DEPTNO
                             GROUP  BY  DEPTNO
                        );
                        
                        
                        
--����1-2) �ζ��� ��� Ǯ��
SELECT  
        ROWNUM AS RANK,
        Z.*
  FROM  (
            SELECT
                    A.EMPNO,
                    A.ENAME,
                    A.JOB,
                    A.SAL,
                    B.DNAME,
                    B.LOC
              FROM  EMP     A
             INNER
              JOIN  DEPT    B
                ON  A.DEPTNO = B.DEPTNO
               AND  SAL >   (
                                SELECT
                                        AVG(SAL)
                                  FROM  EMP A2
                                 WHERE  A2.DEPTNO = A.DEPTNO
                                 GROUP  BY DEPTNO
                            )
             ORDER  BY  SAL DESC
        ) Z;
       
            
 /*
    �������� ���ǿ�����
    - ANY    : ���������� ���� ���ϵǴ� ������ ���� ������ ���Ͽ� �ϳ� �̻��� �����ϸ� �� �̴�.
    - SOME   : ���������� ���� ���ϵǴ� ������ ���� ������ ���Ͽ� �ϳ� �̻��� �����ϸ� �� �̴�.  
    - ALL    : ���� ���������� ���� ���ϵǴ� ��� ���� ���ǰ��� ���Ͽ� ��� ���� �����ؾ߸� ���̴�.
    - EXISTS : ���� ������ �� ������ ���������� ��� �߿��� �����ϴ� ���� �ϳ��� �����ϸ� ���̴�.
    
    
 */
    
 
 
--����2) ������ MANAGER�� � ������� �޿��� ���� �޴� ����� �����ȣ, �����, ����, �޿�, �μ���ȣ�� ����ϼ���.
--      ���� ���� ���
SELECT  
        EMPNO,
        ENAME,
        JOB,
        SAL,
        DEPTNO
  FROM  EMP
 WHERE  SAL   > ANY (
                        SELECT
                                SAL
                          FROM  EMP
                         WHERE  JOB     = 'MANAGER'
                    )
   AND  JOB <> 'MANAGER';
                    
                    
   
   
--����3) �μ���ȣ�� 30�� � ������ٵ� ���� �Ի��� ����� �����ȣ, �����, �Ի����� ����ϼ���.
SELECT
        EMPNO,
        ENAME,
        HIREDATE
  FROM  EMP
 WHERE  HIREDATE    < SOME  (
                                SELECT
                                        HIREDATE
                                  FROM  EMP
                                 WHERE  DEPTNO = 30
                            )
   AND  DEPTNO <> 30;




--����4) JOB�� 'ANALYST'�� ��� ������� �޿��� ���� �޴� Ÿ ������ ����� �����ȣ, �����, ����, �޿��� ����϶�.
SELECT  
        EMPNO,
        ENAME,
        JOB,
        SAL
  FROM  EMP
 WHERE  SAL     > ALL   (
                            SELECT
                                    SAL
                              FROM  EMP
                             WHERE  UPPER(JOB) = 'ANALYST'
                        );





--����5) EMP ���̺��� ENAME, ROWNUM�� ����ϼ���. SAL �������� �������� ������ �ϰ�, 1�� ���� 5�� ���� ��ȸ�ϼ���.
SELECT
        ROWNUM RN,
        Z.*
  FROM  (
            SELECT
                    ENAME
              FROM  EMP
             ORDER  BY SAL DESC
        ) Z
 WHERE  ROWNUM <= 5;
        
 
 
SELECT
        EMPNO,
        ENAME,
        JOB,
        SAL,
        COMM
  FROM  EMP;
   
   

SELECT
        DEPTNO,
        LISTAGG(JOB, ', ') WITHIN GROUP ( ORDER BY DEPTNO ) AS JOB
  FROM  EMP
 GROUP  BY  DEPTNO;
  
 
 
/*
    LISTAGG(������ Į��, ������) WITHIN GROUP ( ORDER BY �����÷� )

*/

SELECT
        DEPTNO,
        LISTAGG(ENAME, ',  ') WITHIN GROUP (ORDER BY DEPTNO) AS NAME
  FROM  EMP
 GROUP  BY DEPTNO;



SELECT
        DEPTNO,
        LISTAGG(JOB, ',  ') WITHIN GROUP( ORDER BY DEPTNO ) AS JOB
  FROM  EMP
 GROUP  BY DEPTNO;
  