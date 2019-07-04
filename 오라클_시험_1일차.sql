/*
    ����Ŭ �⺻ Exam
    �� ���� ����� ��µǵ��� QUERY�� �ۼ��Ͻÿ� (EMP���̺� ���)
*/
--SELECT * FROM EMP;


-- 1. ����� ��ȣ, �̸� �޿�, �μ���ȣ�� ����Ͽ���.
SELECT
        EMPNO,              -- �����ȣ
        ENAME,              -- �̸�
        SAL,                -- �޿�
        DEPTNO              -- �μ���ȣ
  FROM  EMP;
  

--2. �Ի����ڰ� 1980�� 12�� 17�� ���Ŀ� �Ի��� ����� ��� ������ ����϶�.
SELECT
        EMPNO,              -- �����ȣ
        ENAME,              -- �̸�
        JOB,                -- ����
        MGR,                -- ���
        HIREDATE,           -- �Ի���
        SAL,                -- �޿�
        COMM,               -- Ŀ�̼�
        DEPTNO              -- �μ���ȣ
  FROM  EMP
 WHERE  TO_DATE(HIREDATE, 'YY/MM/DD') >= TO_DATE('801217', 'YY/MM/DD');
 
 
-- 3. �޿��� 800�̸��� ����� �̸�,�޿�,�μ� ��ȣ�� ����϶�.
SELECT
        ENAME,              -- �̸�
        SAL,                -- �޿�
        DEPTNO              -- �μ���ȣ
  FROM  EMP
 WHERE  SAL < 800;

 
--4. �Ʒ��� ���� ����� �������� �������� ��� ����� ����϶�.
--  (�Ʒ��� ����� ��ü�Ǽ��� �Ϻ��̴�)
--  EMP_GB�� MGR�� NULL�� ��� ��ǥ�� ǥ���ϰ�, �� �ܿ��� �����̶� ǥ���Ͽ� ����(�����ȣ) �������� ���
--  BUSEO_GB�� 10�� �μ��� ��� ACCOUNTING, 20�� �μ��� ��� RESEARCH, �� �ܿ��� ��Ÿ�μ��� ǥ���Ͽ� �μ���ȣ(�μ�����) �������� ���
--  ���������� DEPTNO.EMP_GB�� �Ѵ�.
SELECT
        NVL2(MGR, '����(' || EMPNO || ')', '��ǥ') AS EMP_GB,            -- ��������
        DEPTNO,                                                         -- �μ���ȣ                
        CASE DEPTNO WHEN 10 THEN 'ACCOUNTING'
                    WHEN 20 THEN 'RESEARCH'
                    ELSE '��Ÿ�μ�' 
        END AS BUSEO_GB                                                 -- �μ����� 
  FROM  EMP
 ORDER  BY  DEPTNO, EMP_GB;


--5. ���� ������� �����̸鼭 BUSEO_GB�� ��Ÿ�μ��� �Ҽӵ� ����� ��� �����ȣ, �μ���ȣ, BUSEO_GB�� ����϶�.
SELECT
        NVL2(MGR, '����(' || EMPNO || ')', '��ǥ') AS EMP_GB,            -- ��������
        DEPTNO,                                                         -- �μ���ȣ
        CASE DEPTNO 
            WHEN 10 THEN 'ACCOUNTING'
            WHEN 20 THEN 'RESEARCH'
            ELSE '��Ÿ�μ�' 
        END AS BUSEO_GB                                                 -- �μ�����
  FROM  EMP
 WHERE  DEPTNO  NOT IN (10, 20)
 ORDER  BY  DEPTNO, EMP_GB;
 
 
--6. �Ի����ڰ� 1981�� 12�� 09�� ���� ���� �Ի��� ������� ��� ������ ����϶�.
SELECT
        EMPNO,          -- �����ȣ
        ENAME,          -- �̸�
        JOB,            -- ����
        MGR,            -- ���
        HIREDATE,       -- �Ի���
        SAL,            -- �޿�
        COMM,           -- Ŀ�̼�
        DEPTNO          -- �μ���ȣ
  FROM  EMP
 WHERE  TO_DATE(HIREDATE, 'YY/MM/DD') < TO_DATE('811209', 'YY/MM/DD');
 

--7. �Ի��ȣ�� 7521���� �۰ų� ���� ������� �Ի��ȣ�� �̸��� ����϶�.
SELECT
        EMPNO,          -- �����ȣ
        ENAME           -- �̸�
  FROM  EMP
 WHERE  EMPNO <= 7521;
 
 
--8. �Ի����ڰ� 1981�� 04�� 02�� ���� �ʰ�, 1982�� 12�� 09�� ���� ���� ����� �̸�, ����, �μ� ��ȣ�� ����϶�.
SELECT
        ENAME,          -- �̸�
        SAL,            -- ����
        DEPTNO          -- �μ���ȣ
  FROM  EMP
 WHERE  TO_DATE(HIREDATE, 'YY/MM/DD') > TO_DATE('810402', 'YY/MM/DD')
   AND  TO_DATE('821209', 'YY/MM/DD') > TO_DATE(HIREDATE, 'YY/MM/DD');
   
   
--9. �޿��� 1,600���� ũ�� 3,000���� ���� ����� �̸�, ����, �޿��� ����϶�.
SELECT
        ENAME,          -- �̸�
        JOB,            -- ����
        SAL             -- �޿�
  FROM  EMP
 WHERE  SAL > 1600
   AND  SAL < 3000;
   
   
--10. �Ի�⵵ 1981�� �̿ܿ� �Ի��� ����� ��� ������ ����϶�.
SELECT
        EMPNO,          -- �����ȣ
        ENAME,          -- �̸�
        JOB,            -- ����
        MGR,            -- ���
        HIREDATE,       -- �Ի���
        SAL,            -- �޿�
        COMM,           -- Ŀ�̼�
        DEPTNO          -- �μ���ȣ
  FROM  EMP
 WHERE  SUBSTR(HIREDATE, 1, 2) <> 81;
        

--11.�Ի����� 1981�� 2���� �Ի��� ����� ��� ������ ����϶�.
SELECT
        EMPNO,          -- �����ȣ
        ENAME,          -- �̸�
        JOB,            -- ����
        MGR,            -- ���
        HIREDATE,       -- �Ի���
        SAL,            -- �޿�
        COMM,           -- Ŀ�̼�
        DEPTNO          -- �μ���ȣ
  FROM  EMP
 WHERE  SUBSTR(HIREDATE, 1, 2) = 81
   AND  SUBSTR(HIREDATE, 4, 2) = 02;
   
   
--12. �μ���ȣ�� 20, 30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ����϶�.
SELECT
        ENAME,          -- �̸�
        EMPNO,          -- �����ȣ
        DEPTNO          -- �μ���ȣ
  FROM  EMP
 WHERE  DEPTNO <> 20
   AND  DEPTNO <> 30;
   
   
--13. �Ʒ��� ���� ����� �������� ��޼�, �޿��� ���� ������ ����Ͻÿ�.
--  SAL�� 2000�̸��̸� 3���, 2001~3000�̸� 2���, �� �ܿ��� 1������� ǥ��
SELECT
        EMPNO,                       -- �����ȣ
        SAL,                         -- �޿�
        DEGREE                       -- ��� 
  FROM  (
        SELECT
                EMPNO,                                              
                SAL,                                                  
                CASE 
                    WHEN    SAL < 2000 THEN '3���'
                    WHEN    SAL BETWEEN 2001 AND 3000 THEN '2���'
                    ELSE    '1���'                                    
                END AS DEGREE
          FROM  EMP
        )
 ORDER  BY  SAL DESC;
 /**********************************************************************
 �� ���� !
  > 2000�̸� �̶�� 3���, 2001~3000�̸� 2��� �� ������ �����ϰ� �Ǹ�
  �޿��� 2000�� ����� ������ �����ϴ�.
  RESULT :: �޿��� 2000�� ����� �ִٸ� DEGREE�� 1������� ��µ˴ϴ�.
 ***********************************************************************/
 
 
--14. ���� ������� 1��޸� ����϶�.
SELECT
        EMPNO,                       -- �����ȣ
        SAL,                         -- �޿�
        DEGREE                       -- ��� 
  FROM  (
        SELECT
            EMPNO,                                              
            SAL,                                                  
            CASE 
                WHEN    SAL < 2000 THEN '3���'
                WHEN    SAL BETWEEN 2001 AND 3000 THEN '2���'
                ELSE    '1���'                                    
            END AS DEGREE
          FROM EMP
        )
 WHERE  DEGREE = '1���';


--15. �̸��� S�ڷ� �����ϴ� ����� �����ȣ, �̸�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT
        EMPNO,              -- �����ȣ
        ENAME,              -- �̸�
        HIREDATE,           -- �Ի�����
        DEPTNO              -- �μ���ȣ
  FROM  EMP
 WHERE  ENAME   LIKE 'S%';
 
 
--16. �̸��� ����° ���ڰ� 'A'�̰ų� ���ڸ��� 'S'�� ������ ����� �̸�, �����ȣ�� ����϶�.
SELECT
        ENAME,              -- �̸�
        EMPNO               -- �����ȣ
  FROM  EMP
 WHERE  ENAME   LIKE '__A%'
    OR  ENAME   LIKE '%S';
    

--17. �̸� �� S�� ���Ե� ����� ��� ������ ����϶�.
SELECT
        EMPNO,          -- �����ȣ
        ENAME,          -- �̸�
        JOB,            -- ����
        MGR,            -- ���
        HIREDATE,       -- �Ի���
        SAL,            -- �޿�
        COMM,           -- Ŀ�̼�
        DEPTNO          -- �μ���ȣ
  FROM  EMP
 WHERE  ENAME   LIKE '%S%';
 
 
--18. �����(MGR)�� MGR,SAL������ �����Ͽ� �Ʒ� ���� �������� ����Ͻÿ�.
--  (��, MGR�� NULL ����� ���� ������������ ����)
SELECT
        EMPNO,                      -- �����ȣ
        ENAME,                      -- �̸�
        JOB,                        -- ����
        MGRR,                       -- ���
        HIREDATE,                   -- �Ի���
        SAL,                        -- �޿�
        COMMM,                       -- Ŀ�̼�
        DEPTNO                      -- �μ���ȣ
  FROM  (
        SELECT
                EMPNO,                      
                ENAME,                      
                JOB,                        
                NVL2(MGR, TO_CHAR(MGR), ' ') AS MGRR,                 
                HIREDATE,                   
                SAL,                        
                NVL2(COMM, TO_CHAR(COMM), ' ') AS COMMM,                   
                DEPTNO                     
          FROM  EMP
        )
 ORDER  BY  MGRR;


--19. Ŀ�̼�(COMM)�� �޴� ����� ��� ������ Ŀ�̼��� ���� ������ ����϶�.
SELECT
        EMPNO,          -- �����ȣ
        ENAME,          -- �̸�
        JOB,            -- ����
        MGR,            -- ���
        HIREDATE,       -- �Ի���
        SAL,            -- �޿�
        COMM,           -- Ŀ�̼�
        DEPTNO          -- �μ���ȣ
  FROM  EMP
 WHERE  COMM    IS NOT NULL
   AND  COMM    <> 0
 ORDER  BY  COMM;
 
 
--20. ù ��° ���ڿ� ������� �� ��° ���ڰ� A�� ����� �����ȣ, �̸��� ����϶�.
SELECT
        EMPNO,           -- �����ȣ
        ENAME            -- �̸�
  FROM  EMP
 WHERE  ENAME   LIKE '_A%';
        
 
--21. 20, 30�� �μ��߿� ������ MANAGER �� ����� ������ ����϶�
SELECT
        EMPNO,          -- �����ȣ
        ENAME,          -- �̸�
        JOB,            -- ����
        MGR,            -- ���
        HIREDATE,       -- �Ի���
        SAL,            -- �޿�
        COMM,           -- Ŀ�̼�
        DEPTNO          -- �μ���ȣ
  FROM  EMP
 WHERE  DEPTNO  IN (20, 30)
   AND  JOB = 'MANAGER';
   
   
--22. �޿��� Ŀ�̼��� �հ�ݾ��� 3000�̻��� ����鿡�� �ǰ�����Ḧ ���޿��� 10% �����Ϸ��� �Ѵ�.
--  �Ʒ��� ���� �������� �μ��� ��� ������ �������� ����϶�.
--  ������ �μ���ȣ, ������󿩺�
SELECT
        EMPNO,
        ENAME,
        DEPTNO,
        NOW_AMT,
        CASE 
                WHEN NOW_AMT >= 3000 THEN NOW_AMT * 0.1
                ELSE 0
        END AS JIGEUP_AMT,
        KONGJAE_YN
  FROM  (
        SELECT
                EMPNO,
                ENAME,
                DEPTNO,
                SAL + NVL(COMM, 0) AS NOW_AMT,
                CASE 
                        WHEN SAL + NVL(COMM, 0) >= 3000 THEN '�������'
                        ELSE '�̴��'
                END AS KONGJAE_YN
          FROM  EMP
        )
 ORDER  BY  DEPTNO, KONGJAE_YN;



/*
    �� ������ ���� �� �÷� ������ ���� �Ķ���� ������ �켱 �� �Ѵ�.
        -> �Ķ���� ������ �÷��� �������� �ӵ��� ������.
        -> Ư���� ��� �ܿ��� �Ķ���͸� �����Ѵ�.

    �� DATE Ÿ���� ������ ����.
        -> ���ÿ� �ð��� �ӵ��� ���� YYYYMMDDHH2$MISS  ������ ���� ���
        -> DATEŸ���� ��������� ������ �ּ������� ���

    �� ����! NUMBER ������ Ÿ���� ��� �Ҽ����ڸ��� ����!
        -> ���� �Ǵ� ����ڿ� ȸ��
        
    �� DISTINCT ��� ���� (�ӵ��� ��������, �����Ͱ� ��Ȯ�� �߻����� ����)
        
        
*/


