-- NVL ����--

-- ���� 1 : ��� ����� ������ ���Ͻÿ�.
--      ������ Ŀ�̼�(COMM�� �����Ͽ� ����Ͻÿ�)
--      Į���� ENAME, JOB, DEPTNO, SAL, COMM, A_SAL �Դϴ�.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        SAL,
        NVL(COMM, 0),
        TO_CHAR(SAL * 12 + NVL(COMM, 0), '999,999,999') AS A_SAL
  FROM  EMP;
  
  
