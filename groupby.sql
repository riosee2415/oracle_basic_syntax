-- ��� ���̺��� �μ���ȣ�� �׷����� ���ô�.

select 
    deptno
from emp
group by deptno; 


-- �Ҽ� �μ��� ����� ���϶�.

select
    deptno,
    avg(sal)
from emp
group by deptno;

select 
    deptno,
    min(sal),
    max(sal)
from emp
group by deptno;



-- �� �μ��� ��� �� �� Ŀ�̼��� �޴� ������� ���� ����ϼ���.

select
    deptno,
    count(*),
    count(comm)
from emp
group by deptno; 


select
    job,
    count(job),
    avg(sal)
from emp
group by job;


select
    deptno,
    avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;


-- �μ��� �ִ밪�� �ּҰ��� ���ϵ�, �ִ� �޿��� 2900 �̻��� �μ��� ���
select
    deptno,
    max(sal),
    min(sal)
from emp
group by deptno
having max(sal) >= 2900;


    
    
    
    
    
    
    
    
    
    

