● 모조 칼럼
    - Oracle DBMS에서 제공해 준다
    - rownum 행 번호
    - rowid 행의 주소값
    
select * from sungjuk;
select sno, rowid from sungjuk;
select sno, rowid, rownum from sungjuk;

select sno, uname, addr, rownum
from sungjuk
where rownum>=1 and rownum<=5;

select * from sungjuk;
from sungjuk
where rownum>=1 and rownum<=5;

select sno, uname, addr, rownum
from sungjuk
where addr='Seoul';

select sno, uname, addr, rownum
from sungjuk
where kor between 80 and 89;

--자신의 행번호를 포함해서 정렬됨. rownum을 추가하는 시점도 고려해야 함
select sno, uname, addr, rownum
from sungjuk
order by uname;