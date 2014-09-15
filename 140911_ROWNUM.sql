select * from TBL_YH_BBS;

select *
from
(
select 
 ROWNUM rn, bbsno, title, content, writer, regdate
FROM
 tbl_yh_bbs
 where bbsno>0
  order by bbsno
);

select 
 /*+INDEX_DESC(tbl_yh_bbs pk_yh_bbs) */
 *
 from
  tbl_yh_bbs
where
 bbsno>0  -- index range ½ºÄµÇÏ·Á°í 
 and rownum <=20;