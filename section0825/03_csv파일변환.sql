��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ� (11873��)
create table school (
     schoolid       varchar2(10)  --�б�ID
    ,schoolname     varchar2(255) --�б���
    ,schoolgubun    varchar2(20)  --�б��ޱ���
    ,schooladdr     varchar2(2000) --���������θ��ּ�
    ,cdate          date          --�������� (���� YYYY-MM-DD)
    ,udate          date          --��������
    ,latitude       number(20,10) --����
    ,longitude      number(20,10) --�浵
);

commit;
select count(*) from school;
select * from school;