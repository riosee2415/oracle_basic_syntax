/*
    WINDOW_FUNCTION ����
    -> ��� �ణ�� ���踦 ���� �����ϱ� ���� ���� �Լ�
    
    �� WINDOW FUNCTION ����
        - ����(RANK) ���� �Լ�        : RANK, DENSE_RANK, ROW_NUMBER
            
        - ����(AGGREGATE) ���� �Լ�   : SUM, MAX, MUN, AVG, COUNT
        
        - �� ���� ���� �Լ�           : FIRST_VALUE, LAST_VALUE, LAG, LEAD
        
        - ���� ���� �Լ�              : CUME_DIST, PERCENT_RANK, NTITLE, 
    

    �� WINDOW�Լ����� OVER ������ �ʼ��̴�.
    
    [�������]
    WINDOW_FUNCTION(expr) OVER( [PARTITION BY��] [ORDER BY��] [WINDOWING ��] )
        �� expr      : ��� �÷�
        �� PARTITION : ��ü ������ ���ؿ� ���� �ұ׷����� ���� �� �ִ�.
        �� ORDER BY  : � �׸� ���� ������ ������ �� ORDER BY ���� ����Ѵ�.
        �� WINDOWING : �Լ��� ����� �Ǵ� �� ������ ������ �����ϰ� ������ �� �ִ�.
                        ROWS�� �������� ��� ���� ����, RANGE�� ������ ���� ���� ��Ÿ���µ�, �� ���� �ϳ��� �����ؼ� ����� �� �ִ�.
                        
    
*/



/********************************************************************************************************************************************************************************/
/********************************************************************************************************************************************************************************/


/*
    �� RANK �Լ� - Ư�� �׸�(Į��) / Ư������(PARTITION)/ ��ü �����Ϳ� ���� ������ ���ϴ� �Լ�
    - ������ ���� ���ؼ��� ������ ������ �ο��Ѵ�.
*/
--����1) ��� �����Ϳ��� �޿��� ���� ������ JOB���� �޿��� ���� ������ ���� ����Ѵ�.
SELECT
        ENAME,
        JOB,
        RANK()  OVER( ORDER BY SAL DESC ) AS ALL_RANK,
        RANK()  OVER( PARTITION BY JOB ORDER BY SAL DESC ) AS JOB_RANK
  FROM  EMP;
  /*
    ORDER BY SAL DESC ���ǰ� PARTITION BY JOB ������ �浹 : JOB���δ� ���� X, ORDER BY SAL DESC �������� ����
    �� ���� ������ ��, ���� ������ �ο��ϰ� ���� �پ���� : 1, 2, 2, 4 ... ...
  */

SELECT
        ENAME,
        JOB,
        SAL,
        RANK()  OVER( ORDER BY SAL DESC ) AS ALL_RANK
  FROM  EMP;
  
  
  
  
  
  
/*  
    �� DENSE_RANK() �Լ� - RANK�� ���������, ������ ������ �ϳ��� �Ǽ��� ����Ѵ�.
*/
--����2) ��������Ϳ��� �޿��� ���� ������, ������ ������ �ϳ��� ����� ������ ����� ���� ����Ѵ�.
SELECT
        ENAME,
        JOB,
        RANK()          OVER( ORDER BY SAL ) AS RANK,
        DENSE_RANK()    OVER( ORDER BY SAL ) AS DENSE_RANK
  FROM  EMP;
  
  
  
/*
    �� ROW_NUMBER() �Լ� - RANK�� DENSE_RANK�� ����������, ������ ���̶� ������ ������ �ο��Ѵ�.
*/
--����3) ��������Ϳ��� �޿��� ���� ������, ������ ������ �������� �ʴ� ����� ���� ����Ѵ�.
SELECT  
        ENAME,
        JOB,
        RANK()          OVER( ORDER BY SAL ) AS RANK,
        ROW_NUMBER()    OVER( ORDER BY SAL ) AS ROW_NUMBER
  FROM  EMP;




/*
   �� �Ϲ� ���� �Լ�
*/

--����4) ������� �޿��� ���� �Ŵ����� �ΰ� �ִ� ������� SAL ���� ���Ѵ�.

SELECT
        MGR,
        ENAME,
        SAL,
        SUM(SAL) OVER( PARTITION BY MGR ) MGR_SUM
  FROM  EMP;




/*
�ڡڡڡڡڡڡ�
    LAG �Լ�
    ��Ƽ�Ǻ� �����쿡�� ���� �� ��° ���� ���� ������ �� �ִ�.
*/

--����5) �������� �Ի����ڰ� ���� �������� �����ϰ�, ���κ��� �Ի����ڰ� �Ѹ� �ռ� ����� �޿��� ������ �޿��� �Բ� ����Ѵ�.
SELECT
        ENAME,
        HIREDATE,
        LEAD(SAL)   OVER( ORDER BY HIREDATE ) AS AFTER_SAL,
        SAL,
        LAG(SAL)    OVER( ORDER BY HIREDATE ) AS PREV_SAL
  FROM  EMP;


/*
    LAG �Լ��� 3���� ARGUMENT���� ����� �� �ִ�.
    �� ��° ���ڴ� �� ��° ���� ���� �������� �����ϴ� ���̰�(DEFAULT : 1), �� ��° ���ڴ� ���� ��� ��Ƽ���� ù ��° ���� ��� ������ �����Ͱ� ���� NULL���� �����µ�, �� ��� �ٸ� ������
    �ٲ� �� �ִ�. ��������� NVL�̳� IS NULL�� ��ɰ� �����ϴ�.
    
    -LAG, LEAD �Լ� ���� ORDER BY ���� �ʼ� �Է»��� �̴�.
*/

SELECT
        ENAME,
        HIREDATE,
        SAL,
        LAG(SAL, 2, 0)    OVER( ORDER BY HIREDATE ) AS PREV_SAL
  FROM  EMP;























    
 /*
    IN ������.
    - WHERE ����÷�  IN (��ȸ�� ��1, ��ȸ�� ��2, ��ȸ�Ұ� 3, ... ... )
    
    IN�����ڴ� �������� ��ȸ�� �� ��, �ϳ��� ��ġ�ϸ� True�� �Ǵ� ������ �̴�.
    ���� ���� �ӵ��� �����Ͽ� ���󵵰� ���� Ȱ�뵵�� ����.
    
 */
 
 
 /*
    ORDER BY ����
    - �÷��� �����Ͽ� �������� �Ǵ� ������������ ������ �� �ִ�.
    
    [�������]
    ORDER BY ����÷� {ASC || DESC} 
    
    �� ���� �� �⺻���� - ASC  [��������]
                          DESC [��������]
                          
    ***************************************************
    SELECT
            Į��1,
            Į��2,
            ...
      FROM  ���̺�                             <- ������� �⺻ SELECT ����
     WHERE  ���ǽ�                             <- WHERE ������
     ORDER  BY  ����÷� {ASC | DESC}          <- ORDER BY ��
    ***************************************************
    
 */
 
 