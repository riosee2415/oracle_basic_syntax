-- ����ȯ ���� --

-- ���� 1 : ���� ��¥�� ���������� ��ȯ�Ͽ� ����Ͻÿ�. 
--      ���������� ex) 2019-12-31 �̴�.
SELECT
        TO_CHAR(SYSDATE, 'YYYY-MM-DD')
  FROM  DUAL;
  
  
-- ���� 2 : ������� �Ի����� ����ϵ�, ���ϱ��� ����Ͻÿ�.
--      Į���� ENAME, JOB, DEPTNO, �Ի��� �Դϴ�. 
--      ��¥��������� ex) 2019.12.31.�Ͽ��� �Դϴ�.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        TO_CHAR(HIREDATE, 'YYYY.MM.DD.DAY')
  FROM  EMP;
  

-- ���� 3 : �� ������ ��ȭ�� ���̰� õ �������� �޸��� �ٿ��� ����Ͻÿ�.
--      Į���� ENAME, SAL, SAL2 �̴�.
SELECT
        ENAME,
        SAL,
        TO_CHAR(SAL, 'L999,999,999')
  FROM  EMP;
