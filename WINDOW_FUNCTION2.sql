/*
    <<WINDOW FUNCTION>>
    ��� �ణ�� ���踦 ���� �����ϱ� ���� ���� �Լ�
    �м��Լ�, �����Լ��� �Ҹ��⵵ ��
    
    �� ��ø�ؼ��� ����� �Ұ����ϳ�, ���� �������� ��� ����
    
        1. WINDOW �Լ��� ����
            1) ���� ���� �Լ�             : RANK, DENSE_RANK, ROW_NUMBER
            2) ���� ���� �Լ�             : SUM, MAX, MIN, AVG, COUNT
            3) �׷� �� �� ���� ���� �Լ�  : FIRST_VALUE, LAST_VALUE, LAG, LEAD
            4) �׷� �� ���� ���� �Լ�     : CUME_DIST, PERCENT_RANK, NTILE, TO_REPORT
            
            
        2. SYSNTAX
            ==========================================================================================
            SELECT
                    WINDOW_FUNCTION(ARGUMENTS) ORVER (PARTITION BY Į�� [ORDER BY ��] [WINDOWING ��] )
              FROM  ���̺��
            ==========================================================================================
            - WINDOW_FUNCTION       : ������ ����ϴ� �Լ��� �ְ�, ���Ӱ� WINDOW �Լ������� �߰��� �Լ��� �ִ�.
            - ARGUMENTS             : �Լ��� ���� 0~N���� �μ��� ������ �� �ִ�.
            - PARTITION BY          : ��ü ������ ���ؿ� ���� �ұ׷����� ���� �� �ִ�.
            - ORDER BY              : � �׸� ���� ������ �������� ����Ѵ�.
            - WINDOWING             : �Լ��� ����� �Ǵ� �� ������ ������ �����ϰ� �����Ѵ�.
            
*/


/*
�׷� �� ���� �Լ�
    1. RANK �Լ�
        - Ư�� �׸� ���� ������ ���ϴ� �Լ�, Ư�� ���������� ������ ���Ҽ��� ����, ���ϰ��� ���ؼ��� ������ ���� �ο�.     
*/

-- ��ü���� �޿��� RANK �ο�
SELECT  
        ENAME,
        SAL,
        RANK()  OVER ( ORDER BY SAL DESC )
  FROM  EMP;
  
  
-- ��ü���� ���޺� �׷� �� RANK �ο�
SELECT
        ENAME,
        JOB,
        SAL,
        RANK()  OVER ( PARTITION BY JOB ORDER BY SAL DESC )
  FROM  EMP;
  
 /*
    2. DENSE_RANK �Լ�
        - ������ �Ǽ��� �ϳ��� �Ǽ��� ���
        - ������ ���� ���� ��� ������ 1,2,2,2,3,4,4,5,5,5,6 ...
 */
 
 
-- ��ü���� �޿��� DENSE_RANK()�� �ο�
SELECT
        ENAME,
        JOB,
        DENSE_RANK()    OVER ( ORDER BY SAL DESC )
  FROM  EMP;
  
-- ��ü���� ���޺� �޿��� DENSE_RANK()�� �ο�
SELECT
        ENAME,
        JOB,
        SAL,
        DENSE_RANK()    OVER( PARTITION BY JOB ORDER BY SAL DESC)
  FROM  EMP;
  
  

/*
    3. ROW_NUMBER �Լ�
        - ������ ���� �ִ��� ������ ������ �ο��� (���� ���� ���� ��� ROWID�� ���� ��)
*/

SELECT
        ROW_NUMBER()    OVER( ORDER BY SAL DESC ) "ROWNUM",
        ENAME,
        JOB,
        SAL,
        RANK()          OVER( ORDER BY SAL DESC ) RANK,
        DENSE_RANK()    OVER( ORDER BY SAL DESC ) DENSERANK
  FROM  EMP;
  
  
  
/*
    <<�Ϲ� ���� �Լ�>>
        1. SUM �Լ�
            - �������� ���� �� ����
*/

-- �Ŵ����� ����� �޿� ���� �հ��
SELECT
        MGR,
        ENAME,
        SAL,
        SUM(SAL) OVER ( PARTITION BY MGR ORDER BY SAL )
  FROM  EMP;
  

/*
    2. MAX�Լ�
        - INLINE VIEW�� ��Ƽ�Ǻ� �ִ밪�� ���� �� ���� ����
*/
SELECT
        MGR,
        ENAME,
        SAL
  FROM  (
            SELECT
                    MGR,
                    ENAME,
                    SAL,
                    MAX(SAL) OVER (PARTITION BY MGR) AS IV_MAX_SAL
              FROM  EMP
        )
 WHERE  SAL = IV_MAX_SAL;
 
 
/*
    3. MIN�Լ�
        - �� ����
*/



/*
    <<�׷� �� �� �Լ�>>
    
    1. LAG �Լ�
        - ��Ƽ�� �� �����쿡�� ���� ���° ���� ���� ������ �� ����
*/


SELECT
        ENAME,
        HIREDATE,
        SAL,
        LAG(SAL, 2, 0) OVER (ORDER BY HIREDATE)
  FROM  EMP
 WHERE  JOB  = 'SALESMAN';
 
-- LAG(SAL, 2, 0) �� 2�� ° ���� SAL�� ��������, ���� ��� 0���� ó���϶�� ��ɾ� �̴�.



/*
    2. LEAD �Լ�
        - ��Ƽ�� �� �����쿡�� ���� �� ��° ���� ���� ������ �� ����
*/
SELECT
        ENAME,
        HIREDATE,
        SAL,
        LEAD(SAL, 2, 0) OVER ( ORDER BY HIREDATE )
  FROM  EMP;
