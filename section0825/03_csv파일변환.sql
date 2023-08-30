문2) 한국교원대학교_초중등학교위치.csv를 변환해서 테이블에 저장하시오 (11873행)
create table school (
     schoolid       varchar2(10)  --학교ID
    ,schoolname     varchar2(255) --학교명
    ,schoolgubun    varchar2(20)  --학교급구분
    ,schooladdr     varchar2(2000) --소재지도로명주소
    ,cdate          date          --생성일자 (형식 YYYY-MM-DD)
    ,udate          date          --변경일자
    ,latitude       number(20,10) --위도
    ,longitude      number(20,10) --경도
);

commit;
select count(*) from school;
select * from school;