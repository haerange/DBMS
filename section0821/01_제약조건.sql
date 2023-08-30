--sungjuk테이블 삭제
drop table sungjuk;

--sungjuk테이블 생성
create table sungjuk(
    sno    int           primary key   --기본키(유일성)
    ,uname varchar(10)   not null
    ,kor   int           check(kor between 0 and 100)  --국어점수 0~100사이만 입력가능
    ,eng   int           check(eng between 0 and 100)  --영어점수 0~100사이만 입력가능
    ,mat   int           check(mat between 0and 100)
    ,addr  varchar(50)   check(addr in('Seoul', 'Jeju', 'Busan', 'Suwon'))
    ,tot   int           default 0
    ,aver  int           default 0
    ,wdate date          default sysdate       --현재 날짜 함수
    ,email varchar(50)   unique                --중복된 값 허용하지 않음
);

////////////////////////////////////////////////////////////////////////////////
select * from sungjuk;


● [테이블 제약조건 에러 메세지]
--1)primary key 제약조건
--오류 보고 - ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C007330)에 위배됩니다
--sno 칼럼은 기본키(PK)
insert into sungjuk(sno) values(1);   --2번 실행했을 때 에러 발생


--2)not null 조건
--오류 보고 - ORA-01400: NULL을 ("SYSTEM"."SUNGJUK"."UNAME") 안에 삽입할 수 없습니다
insert into sungjuk(sno) values(1);   --uname 칼럼은 not null조건이므로 반드시 값을 입력해야 함
insert into sungjuk(sno, uname) values(1, 'KOREA');
insert into sungjuk(sno, uname) values(2, '대한민국');
insert into sungjuk(sno, uname) values(3, '대한민국');
insert into sungjuk(sno, uname) values(5, '이스라엘');

delete from sungjuk where sno=5;   -- '이스라엘' 행 삭제


--uname varchar(10) 하고 글자갯수 테스트 합니다
insert into sungjuk(sno, uname) values(1, '1234567890');
insert into sungjuk(sno, uname) values(2, 'ABCDEFGHIJ');


--SQL 오류: ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" 열에 대한 값이 너무 큼(실제: 11, 최대값: 10)
insert into sungjuk(sno, uname) values(3, 'ABCDEFGHIJK');



insert into sungjuk(sno, uname) values(4, '무궁화');

--SQL 오류: ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" 열에 대한 값이 너무 큼(실제: 12, 최대값: 10)
insert into sungjuk(sno, uname) values(5, '대한민국');


--3) check 제약조건
--오류 보고 - ORA-02290: 체크 제약조건(SYSTEM.SYS_C007338)이 위배되었습니다
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, '홍길동', -10, 20, 300);


--오류 보고 - ORA-02290: 체크 제약조건(SYSTEM.SYS_C007339)이 위배되었습니다
--addr칼럼에 'Incheon' 허용 안 함
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, '홍길동', 10, 20, 30, 'Incheon');


--4) default 제약조건
--해당칼럼에 데이터가 입력되지 않은 경우, tot와 aver는 0입력, wdate는 현재날짜가 입력됨

insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, '홍길동', 10, 20, 30, 'Seoul');

insert into sungjuk(sno, uname, kor, eng, mat, addr, tot, aver, wdate)
values(2, '홍길동', 10, 20, 30, 'Seoul', 60, 30, '2023-08-20');


--5)unique 제약조건
insert into sungjuk(sno, uname, kor, eng, mat, addr, email)
values(1, '홍길동', 10, 20, 30, 'Seoul', 'webmaster@itwill.co.kr');


--오류 보고 - ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C007360)에 위배됩니다
--중복허용 안 함  primary key기능을 대체할 수 있다
--단 1번에 한해서 null값을 인정해 준다
insert into sungjuk(sno, uname, kor, eng, mat, addr, email)
values(2, '홍길동', 10, 20, 30, 'Seoul', 'webmaster@itwill.co.kr');

--SQL 오류: ORA-00913: 값의 수가 너무 많습니다 00913. 00000 -  "too many values"
insert into sungjuk(sno, uname, kor, eng, mat)
values(2, '홍길동', 10, 20, 30, 'Seoul');

--

select * from sungjuk;











