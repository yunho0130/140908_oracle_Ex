select * from tbl_bbs order by bbsno desc;

select /*+INDEX_DESC(tbl_bbs pk_bbs) */ * from tbl_bbs where bbsno>0;


CREATE user Stu_yunho IDENTIFIED by Stu_yunho;

grant connect, dba to Stu_yunho;
