
create table dept01
(
deptno number(2),
dename varchar2(14),
loc varchar(13)
);

desc dept01;

insert into dept01 
values
(10, 'ACCOUNTING', 'NEW YORK');

insert into dept01 
values
(20, 'REASERCH', 'DALLAS');

select * from dept01;

insert into dept01 (deptno, dname)
values (30, 'SALAES');

insert into dept01 
values
(40, 'OPERATIONS', NULL);

insert into dept01 
values
(50, '', 'CHICAGO');

select * from dept;
select * from dept01;


-- ���������� ����Ͽ� dept�ȿ� �ִ� ������ dept01 ���̺� ������ �Ѳ����� insert
-- where���� ����Ͽ� ���ϴ� �����͸� �����Ͽ� insert�� �� �ִ�.
insert into dept01
select * from dept;



select * from dept01;


--INSERT ALL���� ����ϸ� ���������� ����� ���Ǿ��� ���� ���̺� �����Է� ����

-- �����ȣ, �����, �Ի����ڷ� ������ EMP_HIR ���̺��,
-- �����ȣ, �����, �ش�����ڷ� ������ EMP_MGR���̺��� �� ���̺�� ����

-- ������̺�(EMP)���� �μ���ȣ�� 20�� ������� �˻��Ͽ� EMP_HIR���̺���
-- �����ȣ, �����, �Ի��� // EMP_MGR ���̺����� �����ȣ, �����, �����ڸ�
-- �Է��϶�.

-- insert all ��ɹ��� ���������� ��� ������ ���Ǿ��� ���� ���̺� ���ÿ� �Է��ϱ� ���� ��ɹ� �Դϴ�.

-- �� �̶� ������ ����, ���������� �÷���� �����Ͱ� �ԷµǴ� ���̺��� �÷����� �����ؾ� �Ѵ�.


