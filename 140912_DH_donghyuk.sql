-- �κ� ���� ó�� �ܰ� 1
-- 2�������� ��� ��. 
select 
  * 
from
  (
  select /*+INDEX_DESC(tbl_bbs pk_bbs)*/
    rownum rn, bbsno, title, content, writer, regdate
  from tbl_bbs
  where rownum <= 20 and bbsno > 0
  ) bbs
where rn > 10

-- �κй���ó�� �ܰ� 2 ���̺� ����(�ε��� Ȯ�� �ʼ�)
select
*
from
  (select 
    * 
  from
    (
    select /*+INDEX_DESC(tbl_bbs pk_bbs)*/
      rownum rn, bbsno, title, content, writer, regdate
    from tbl_bbs
    where rownum <= 20 and bbsno > 0
    ) bbs
  where rn > 10
) bbs, tbl_reply reply
where bbs.bbsno = reply.bbsno(+)

-- 3�ܰ� group by, order by ���
select
 bbs.bbsno, min(title), min(content), min(writer), count(reply.bbsno)
from
  (select 
    * 
  from
    (
    select /*+INDEX_DESC(tbl_bbs pk_bbs)*/
      rownum rn, bbsno, title, content, writer, regdate
    from tbl_bbs
    where rownum <= 1000 and bbsno > 0
    ) bbs
  where rn > 990
) bbs, tbl_reply reply
where bbs.bbsno = reply.bbsno(+)
group by bbs.bbsno

select * from scott.emp
order by deptno