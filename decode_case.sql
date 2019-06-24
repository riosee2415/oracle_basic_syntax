-- ������ ���� DECODE �Լ� : switch case���� ������ ����� ����
-- �������� ��쿡 ���Ͽ� ������ �� �ִ� �Լ�

--DECODE (ǥ����,  ����1, ���1,
--                ����2, ���2,
--                ����3, ���3,
--                �⺻���n
--        )
        
        

select 
    ename,
    deptno,
    decode(deptno, 10, 'ACCOUNTNIG',
                   20, 'research',
                   30, 'sales',
                   40, 'operations'
            ) as dename
from emp;


select * from emp;
--���޿� ���� �޿��� �λ��ϵ��� ����.
--������ ANAIYST�� ����� 5%, SALESMAN�� ����� 10%, MANAGER�� ����� 15%, CLERK�� ����� 20% �λ��Ѵ�.

select 
    ename,
    job,
    sal,
    decode(job, 'ANALYST', (sal*1.05),
                'SALESMAN', sal*1.1,
                'MANAGER', sal*1.15,
                'CLERK', sal*1.20
            ) as new_sal
from emp;
                

--CASE ǥ���� WHEN ����1 THEN ���1,
--            WHEN ����2 THEN ���2,
--            WHEN ����3 THEN ���3,
--            �⺻���n
--END


select
    ename,
    deptno,
    CASE when deptno='10' then upper('accounting')
         when deptno='20' then upper('research')
         when deptno='30' then upper('sales')
         when deptno='40' then upper('operations')
    END as dename
FROM emp;
      

select
    ename,
    sal,
    case    when sal >= 1000 then '1000�̻�'
            else '1000����'
    END as salcase
from emp;