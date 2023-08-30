--sungjuk���̺� ����
drop table sungjuk;

--sungjuk���̺� ����
create table sungjuk(
    sno    int           primary key   --�⺻Ű(���ϼ�)
    ,uname varchar(10)   not null
    ,kor   int           check(kor between 0 and 100)  --�������� 0~100���̸� �Է°���
    ,eng   int           check(eng between 0 and 100)  --�������� 0~100���̸� �Է°���
    ,mat   int           check(mat between 0and 100)
    ,addr  varchar(50)   check(addr in('Seoul', 'Jeju', 'Busan', 'Suwon'))
    ,tot   int           default 0
    ,aver  int           default 0
    ,wdate date          default sysdate       --���� ��¥ �Լ�
    ,email varchar(50)   unique                --�ߺ��� �� ������� ����
);

////////////////////////////////////////////////////////////////////////////////
select * from sungjuk;


�� [���̺� �������� ���� �޼���]
--1)primary key ��������
--���� ���� - ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007330)�� ����˴ϴ�
--sno Į���� �⺻Ű(PK)
insert into sungjuk(sno) values(1);   --2�� �������� �� ���� �߻�


--2)not null ����
--���� ���� - ORA-01400: NULL�� ("SYSTEM"."SUNGJUK"."UNAME") �ȿ� ������ �� �����ϴ�
insert into sungjuk(sno) values(1);   --uname Į���� not null�����̹Ƿ� �ݵ�� ���� �Է��ؾ� ��
insert into sungjuk(sno, uname) values(1, 'KOREA');
insert into sungjuk(sno, uname) values(2, '���ѹα�');
insert into sungjuk(sno, uname) values(3, '���ѹα�');
insert into sungjuk(sno, uname) values(5, '�̽���');

delete from sungjuk where sno=5;   -- '�̽���' �� ����


--uname varchar(10) �ϰ� ���ڰ��� �׽�Ʈ �մϴ�
insert into sungjuk(sno, uname) values(1, '1234567890');
insert into sungjuk(sno, uname) values(2, 'ABCDEFGHIJ');


--SQL ����: ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" ���� ���� ���� �ʹ� ŭ(����: 11, �ִ밪: 10)
insert into sungjuk(sno, uname) values(3, 'ABCDEFGHIJK');



insert into sungjuk(sno, uname) values(4, '����ȭ');

--SQL ����: ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
insert into sungjuk(sno, uname) values(5, '���ѹα�');


--3) check ��������
--���� ���� - ORA-02290: üũ ��������(SYSTEM.SYS_C007338)�� ����Ǿ����ϴ�
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', -10, 20, 300);


--���� ���� - ORA-02290: üũ ��������(SYSTEM.SYS_C007339)�� ����Ǿ����ϴ�
--addrĮ���� 'Incheon' ��� �� ��
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 30, 'Incheon');


--4) default ��������
--�ش�Į���� �����Ͱ� �Էµ��� ���� ���, tot�� aver�� 0�Է�, wdate�� ���糯¥�� �Էµ�

insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 30, 'Seoul');

insert into sungjuk(sno, uname, kor, eng, mat, addr, tot, aver, wdate)
values(2, 'ȫ�浿', 10, 20, 30, 'Seoul', 60, 30, '2023-08-20');


--5)unique ��������
insert into sungjuk(sno, uname, kor, eng, mat, addr, email)
values(1, 'ȫ�浿', 10, 20, 30, 'Seoul', 'webmaster@itwill.co.kr');


--���� ���� - ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007360)�� ����˴ϴ�
--�ߺ���� �� ��  primary key����� ��ü�� �� �ִ�
--�� 1���� ���ؼ� null���� ������ �ش�
insert into sungjuk(sno, uname, kor, eng, mat, addr, email)
values(2, 'ȫ�浿', 10, 20, 30, 'Seoul', 'webmaster@itwill.co.kr');

--SQL ����: ORA-00913: ���� ���� �ʹ� �����ϴ� 00913. 00000 -  "too many values"
insert into sungjuk(sno, uname, kor, eng, mat)
values(2, 'ȫ�浿', 10, 20, 30, 'Seoul');

--

select * from sungjuk;











