-- GROUP BY ����--

-- ���� 1 : ��� ���̺��� �μ� ��ȣ�� �׷����� ����Ͻÿ�.
SELECT
        A.DEPTNO
  FROM  EMP A
 GROUP  BY  A.DEPTNO;
 
 

-- ���� 2 : �μ���ȣ �� �޿� ����� ���Ͻÿ�.
SELECT
        A.DEPTNO,
        TRUNC(AVG(A.SAL)) AS AVG_SAL
  FROM  EMP A
 GROUP  BY  A.DEPTNO
 ORDER  BY  A.DEPTNO    ASC;
 

--���� 3 : �μ� �� �޿� �Ѿװ� �޿� ��վ��� ���Ͻÿ�.
SELECT
        DEPTNO,
        SUM(SAL) AS SUM_SAL,
        TRUNC(AVG(SAL)) AS AVG_SAL
  FROM  EMP
 GROUP  BY  DEPTNO;
 
 
--���� 4 : �ҼӺμ� �� �ִ�޿��� �ּұ޿��� ����Ͻÿ�.
SELECT
        DEPTNO,
        MAX(SAL) AS MAX,
        MIN(SAL) AS MIN
  FROM  EMP
 GROUP  BY  DEPTNO;
 

-- ���� 5 : �μ��� ����� ���� Ŀ�̼��� �޴� ����� ���� ����Ͽ� ����Ͻÿ�.
SELECT
        DEPTNO,
        COUNT(EMPNO)    AS CNT_EMP,
        COUNT(COMM)     AS CNT_COMM
  FROM  EMP
 GROUP  BY  DEPTNO;
 
 