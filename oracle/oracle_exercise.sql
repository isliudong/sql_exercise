-- Create table 学生信息
create table HAND_STUDENT
(
  STUDENT_NO     VARCHAR2(10) not null,
  STUDENT_NAME   VARCHAR2(20),
  STUDENT_AGE    NUMBER(2),
  STUDENT_GENDER VARCHAR2(5)
);
-- Add comments to the table 
comment on table HAND_STUDENT
  is '学生信息表';
-- Add comments to the columns 
comment on column HAND_STUDENT.STUDENT_NO
  is '学号';
comment on column HAND_STUDENT.STUDENT_NAME
  is '姓名';
comment on column HAND_STUDENT.STUDENT_AGE
  is '年龄';
comment on column HAND_STUDENT.STUDENT_GENDER
  is '性别';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HAND_STUDENT add primary key (STUDENT_NO);

-- Create table 教师信息表
create table HAND_TEACHER
(
  TEACHER_NO   VARCHAR2(10) not null,
  TEACHER_NAME VARCHAR2(20),
  MANAGER_NO   VARCHAR2(10)
);
-- Add comments to the table 
comment on table HAND_TEACHER
  is '教师信息表';
-- Add comments to the columns 
comment on column HAND_TEACHER.TEACHER_NO
  is '教师编号';
comment on column HAND_TEACHER.TEACHER_NAME
  is '教师名称';
comment on column HAND_TEACHER.MANAGER_NO
  is '上级编号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HAND_TEACHER add primary key (TEACHER_NO);

-- Create table 课程信息表
create table HAND_COURSE
(
  COURSE_NO   VARCHAR2(10) not null,
  COURSE_NAME VARCHAR2(20),
  TEACHER_NO  VARCHAR2(20) not null
);
-- Add comments to the table 
comment on table HAND_COURSE
  is '课程信息表';
-- Add comments to the columns 
comment on column HAND_COURSE.COURSE_NO
  is '课程号';
comment on column HAND_COURSE.COURSE_NAME
  is '课程名称';
comment on column HAND_COURSE.TEACHER_NO
  is '教师编号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HAND_COURSE add constraint PK_COURSE primary key (COURSE_NO, TEACHER_NO);

-- Create table 成绩信息表
create table HAND_STUDENT_CORE
(
  STUDENT_NO VARCHAR2(10) not null,
  COURSE_NO  VARCHAR2(10) not null,
  CORE       NUMBER(4,2)
);
-- Add comments to the table 
comment on table HAND_STUDENT_CORE
  is '学生成绩表';
-- Add comments to the columns 
comment on column HAND_STUDENT_CORE.STUDENT_NO
  is '学号';
comment on column HAND_STUDENT_CORE.COURSE_NO
  is '课程号';
comment on column HAND_STUDENT_CORE.CORE
  is '分数';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HAND_STUDENT_CORE add constraint PK_SC primary key (STUDENT_NO, COURSE_NO);


/*******初始化学生表的数据******/
insert into HAND_STUDENT values ('s001','张三',23,'男');
insert into HAND_STUDENT values ('s002','李四',23,'男');
insert into HAND_STUDENT values ('s003','吴鹏',25,'男');
insert into HAND_STUDENT values ('s004','琴沁',20,'女');
insert into HAND_STUDENT values ('s005','王丽',20,'女');
insert into HAND_STUDENT values ('s006','李波',21,'男');
insert into HAND_STUDENT values ('s007','刘玉',21,'男');
insert into HAND_STUDENT values ('s008','萧蓉',21,'女');
insert into HAND_STUDENT values ('s009','陈萧晓',23,'女');
insert into HAND_STUDENT values ('s010','陈美',22,'女');
commit;
/******************初始化教师表***********************/
insert into HAND_TEACHER values ('t001', '刘阳','');
insert into HAND_TEACHER values ('t002', '谌燕','t001');
insert into HAND_TEACHER values ('t003', '胡明星','t002');
commit;
/***************初始化课程表****************************/
insert into HAND_COURSE values ('c001','J2SE','t002');
insert into HAND_COURSE values ('c002','Java Web','t002');
insert into HAND_COURSE values ('c003','SSH','t001');
insert into HAND_COURSE values ('c004','Oracle','t001');
insert into HAND_COURSE values ('c005','SQL SERVER 2005','t003');
insert into HAND_COURSE values ('c006','C#','t003');
insert into HAND_COURSE values ('c007','JavaScript','t002');
insert into HAND_COURSE values ('c008','DIV+CSS','t001');
insert into HAND_COURSE values ('c009','PHP','t003');
insert into HAND_COURSE values ('c010','EJB3.0','t002');
commit;
/***************初始化成绩表***********************/
insert into HAND_STUDENT_CORE values ('s001','c001',58.9);
insert into HAND_STUDENT_CORE values ('s002','c001',80.9);
insert into HAND_STUDENT_CORE values ('s003','c001',81.9);
insert into HAND_STUDENT_CORE values ('s004','c001',60.9);
insert into HAND_STUDENT_CORE values ('s001','c002',82.9);
insert into HAND_STUDENT_CORE values ('s002','c002',72.9);
insert into HAND_STUDENT_CORE values ('s003','c002',81.9);
insert into HAND_STUDENT_CORE values ('s001','c003','59');
commit;

-- 第一单元select语句
-- 列选择
SELECT student_no,student_name from hand_student
-- 行选择
SELECT * from hand_student
-- 多表连接查询
SELECT hand_student.student_name,hand_student_core.course_no,hand_student_core.core
from hand_student,hand_student_core

-- 字段加减?出现多余小数
SELECT hand_student.student_name,hand_student_core.course_no,hand_student_core.core+100
from hand_student,hand_student_core
-- 别名，不能加引号
SELECT hand_student.student_name as name , hand_student_core.course_no 课程号, hand_student_core.core
 FROM hand_student,hand_student_core

-- CONCAT(str1,str2,...)(N,from_base,to_base)连接
SELECT CONCAT(hand_student.student_name,hand_student_core.course_no),hand_student_core.core
from hand_student,hand_student_core

-- 去重
SELECT DISTINCT hand_student.student_name as 'name' ,hand_student_core.course_no 课程号,hand_student_core.core
from hand_student,hand_student_core


-- 第二单元条件限制
SELECT hand_student.student_name from hand_student where hand_student.student_name='张三'

SELECT hand_student.student_name from hand_student where hand_student.student_name<>'张三'

SELECT hand_student.student_name from hand_student where hand_student.student_no>'s005'

SELECT hand_student.student_name from hand_student where hand_student.student_no BETWEEN 's005' and 's006'

SELECT hand_student.student_name from hand_student where hand_student.student_no in ('s005','s006')

INSERT INTO hand_student VALUES('s011','王%',24,'男')

SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name LIKE '王%';


-- 使用NULL条件：
SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name is null;
-- 使用多个条件组合的逻辑操作符：
SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name LIKE '王%' and hand_student.student_no>'s010' ;
-- 使用ORDER BY 子句进行排序：

SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name LIKE '王%' ORDER BY hand_student.student_no asc ;

SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name LIKE '王%' ORDER BY hand_student.student_no desc ;

-- 第三单元：单行函数 
-- 大小写敏感
SELECT hand_student.student_name from hand_student where upper(hand_student.student_no)='s001'
SELECT hand_student.student_name from hand_student where LOWER(hand_student.student_no)='S001'


-- 常用字符函数
SELECT s.student_no, LENGTH(s.student_no), INSTR(s.student_no,'0')from hand_student s where SUBSTR(s.student_no,2)='009'

-- 数字操作函数：
SELECT ROUND(45.923,2), ROUND(45.923,0), ROUND(45.923,-1) FROM DUAL;

SELECT TRUNC(45.923,2), TRUNC(45.923), TRUNC(45.923,-2) FROM DUAL;

SELECT MOD(45.923,2) FROM DUAL;

-- 日期操作
SELECT TO_CHAR(SYSDATE,'yyyy-mm-dd')  FROM DUAL;

SELECT TO_NUMBER(TO_CHAR(SYSDATE,'dd'))+1 days FROM DUAL;

SELECT SYSDATE +1 FROM DUAL

-- 就近年
SELECT  TO_DATE('01-2-90', 'DD-MM-RR') FROM DUAL

-- 当前年
SELECT  TO_DATE('01-2-90', 'DD-MM-YY') FROM DUAL


-- 条件表达式
--1
SELECT hand_student.student_name,CASE hand_student.student_no
	WHEN 's001' THEN
		'ooo'
	ELSE
		hand_student.student_no
END FROM hand_student;
--2
SELECT hand_student.student_name,
DECODE(hand_student.student_no,'s001','ooo')
FROM hand_student;

-- 第四单元：多表关联查询 

SELECT
	c.student_no,
	max( s.student_name ) 
FROM
	hand_student s,
	hand_student_core c 
GROUP BY
	c.student_no
	
-- 各科平均成绩及格率
select c.course_no course_id,round(avg(c.core),2) 平均分,
round(100*sum(case when c.core>=60 then 1 else 0 end)/count(c.core),0)||'%' 及格率
from hand_student_core c
group by c.course_no

-- 等于连接

SELECT
	hand_student.student_name,
	hand_student_core.core 
FROM
	hand_student,
	hand_student_core 
WHERE
	hand_student.student_no = hand_student_core.student_no
	
	-- 交叉连接

SELECT
	hand_student.student_name,
	hand_student_core.core 
FROM
	hand_student,
	hand_student_core 
	
		
	-- 自然连接

SELECT
	hand_student.student_name,
	hand_student_core.core 
FROM
	hand_student NATURAL JOIN
	hand_student_core 
	
	-- 外链接：左外连接

SELECT
	hand_student.student_name,
	hand_student_core.core 
FROM
	hand_student left join
	hand_student_core 
on
	hand_student.student_no = hand_student_core.student_no
	-- 外链接：右外连接
	SELECT
	hand_student.student_name,
	hand_student_core.core 
FROM
	hand_student right join
	hand_student_core 
on
	hand_student.student_no = hand_student_core.student_no
	
	-- 自连接,得到非自己的成绩
SELECT
	s1.student_name,
	s2.core 
FROM
	hand_student s1,
	hand_student_core s2 
WHERE
	s1.student_no <> s2.student_no
	
	-- 内连接
	
	SELECT
	hand_student.student_name,
	hand_student_core.core 
FROM
	hand_student  join
	hand_student_core 
on
	hand_student.student_no = hand_student_core.student_no
	
-- 第五单元：分组计算函数和GROUP BY子句 
	
SELECT
	c.course_no course_id,
	round( avg( c.core ), 2 ) 平均分,
	round( 100 * sum( CASE WHEN c.core >= 60 THEN 1 ELSE 0 END ) / count( c.core ), 0 ) || '%' 及格率 
FROM
	hand_student_core c 
GROUP BY
	c.course_no
	
-- 常用函数
SELECT
	AVG( hand_student_core.CORE ) 平均成绩,
	MAX( hand_student_core.CORE ) 最高分,
	MIN( hand_student_core.CORE ) 最低分,
	SUM( hand_student_core.CORE ) 所有同学总分 
FROM
	hand_student_core
	
	
-- group by having
SELECT
	c.course_no course_id,
	round( avg( c.core ), 2 ) 平均分,
	CONCAT(
		round( 100 * sum( CASE WHEN c.core >= 60 THEN 1 ELSE 0 END )/ count( c.core ), 0 ),
		'%' 
	) as 及格率 
FROM
	hand_student_core c 
GROUP BY
	c.course_no 
HAVING
	sum( CASE WHEN c.core >= 60 THEN 1 ELSE 0 END ) >0
	
	
-- 第六单元：子查询 
SELECT
	hand_student_core.core 
FROM
	hand_student_core 
WHERE
	hand_student_core.CORE > ( SELECT MIN( hand_student_core.CORE ) FROM hand_student_core )
	
-- 第七单元：DML语句 
INSERT INTO hand_student
VALUES
	( 's012', 'libai', 25, '男' ) 
-- 	
UPDATE hand_student 
SET hand_student.STUDENT_Name = 'wangwei' 
WHERE
	hand_student.STUDENT_NO = 's012'
-- 	
	DELETE 
FROM
	hand_student 
WHERE
	hand_student.STUDENT_Name = 'wangwei'

-- 事务控制 

-- 开启事务
START TRANSACTION

SELECT * from hand_student

INSERT INTO hand_student
VALUES
	( 's012', 'libai', 25, '男' ) 
	

SELECT * from hand_student

-- 回滚
ROLLBACK

SELECT * from hand_student

-- 句查Session之间的阻塞关系
SELECT decode(request, 0, 'Holder: ', 'Waiter: ') || sid sess,
 id1,
 id2,
 lmode,
 request,
 TYPE
 FROM gv$lock
WHERE (id1, id2, TYPE) IN (SELECT id1, id2, TYPE
 FROM gv$lock
 WHERE request > 0
 AND TYPE != 'HW')
ORDER BY id1, request;



-- 第九单元：数据库对象-表
/*
表的命名要求和表中列的命名要求：
1、必须以字母开头
2、长度不能超过30个字符
3、只能包含 A–Z, a–z, 0–9, _, $, and #
4、不能与数据库中的已有对象重名
5、不能使用Oracle 数据库的保留字*/

-- 复制表

CREATE TABLE table_copy_student AS (SELECT * FROM hand_student)

-- 只想保留表结构，但不想要数据

CREATE TABLE table_copy_student2 AS SELECT * FROM hand_student WHERE 1=2

-- 更改表的语法添加列：

ALTER TABLE table_copy_student ADD  COLUMN num INT

-- 更改表的语法更改列：

ALTER TABLE table_copy_student MODIFY  COLUMN num INT(4)

-- 更改表的语法删除列：

ALTER TABLE table_copy_student DROP  COLUMN num



-- 删除表：
DROP TABLE table_copy_student;


-- 清空表
TRUNCATE TABLE tableName;


-- 第十单元：数据库对象-约束 

/*常用约束
NOT NULL （非空约束）
UNIQUE （唯一性约束）
PRIMARY KEY （主键约束）
FOREIGN KEY （外键约束）
CHECK （自定义约束）
*/

-- 主键约束
ALTER TABLE table_copy_student ADD CONSTRAINT p_k PRIMARY KEY(STUDENT_NO)

-- 外键约束
/*外键约束类型：
• REFERENCES: 表示列中的值必须在父表中存在
• ON DELETE CASCADE: 当父表记录删除的时候自动删除子表中的相应记录.
• ON DELETE SET NULL: 当父表记录删除的时候自动把子表中相应记录的值设为NULL*/

-- 表不匹配，约束无法创建
ALTER TABLE table_copy_student ADD CONSTRAINT f_k FOREIGN KEY ( STUDENT_NO ) references hand_student_core ( STUDENT_NO ) ON DELETE CASCADE

/*删除约束：
ALTER TABLE employees
DROP CONSTRAINT emp_manager_fk;
Table altered.

失效/生效 约束：
ALTER TABLE employees
DISABLE CONSTRAINT emp_emp_id_pk CASCADE;
Table altered.

ALTER TABLE employees
ENABLE CONSTRAINTemp_emp_id_pk;
Table altered.
*/


-- 查询系统中存在哪些约束：

SELECT
	constraint_name,
	constraint_type,
	search_condition 
FROM
	user_constraints 
WHERE
	table_name = 'hand_student';
	
	

-- 创建复杂视图

CREATE VIEW top_3_hight_student AS SELECT
c.student_no,
c.course_no,
c.core 
FROM
	hand_student_core c
	LEFT JOIN hand_student_core c2 ON c.course_no = c2.course_no 
	AND c.core <= c2.core 
GROUP BY
	c.student_no,
	c.course_no,
	c.core 
HAVING
	count( c2.student_no )<= 3 
ORDER BY
	c.core DESC,
	c.student_no

-- 删除视图

DROP VIEW top_3_hight_student;

-- TOP-N 查询：

select * from hand_student where rownum<2

-- 第十二单元：数据库对象-序列、索引、同义词 

-- 序列的创建：
create sequence SEQ_my_ID
increment by 1
start with 1
minvalue 1
maxvalue 9999999
order
cache 20
cycle;

-- 获取序列值
select SEQ_my_ID.nextval from dual; 

-- 删除序列：
DROP SEQUENCE SEQ_my_ID;

-- 索引创建
CREATE INDEX student_name_idx
ON hand_student(STUDENT_Name);

-- 函数索引：当查询语句的Where条件中，某些列使用了函数表达式时，普通索引对查询没有帮助

CREATE INDEX student_name_fun_idx
ON hand_student(UPPER(STUDENT_Name));-- 将普通索引字段改为函数所需函数即可

-- 第十三单元：控制用户权限

CREATE USER DEHAAN IDENTIFIED BY root;

CREATE ROLE manager ;

GRANT create table, create view to manager;

GRANT manager to DEHAAN;

-- 集合操作 SQL结果集的集合操作： 并集、交集、差集

SELECT
	hand_student.STUDENT_NO 
FROM
	hand_student 
UNION ALL
SELECT
	hand_student_core.STUDENT_NO 
FROM
	hand_student_core

-- 第十四单元：Group By 子句的增强 

-- 在Group By 中使用Rollup 产生常规分组汇总行 以及分组小计：
SELECT hand_student_core.STUDENT_NO,hand_student_core.COURSE_NO,sum(hand_student_core.CORE)
FROM hand_student_core
GROUP BY rollup(hand_student_core.STUDENT_NO,hand_student_core.COURSE_NO)

-- 在Group By 中使用Cube 产生Rollup结果集 + 多维度的交叉表数据源：
SELECT hand_student_core.STUDENT_NO,hand_student_core.COURSE_NO,sum(hand_student_core.CORE)
FROM hand_student_core
GROUP BY cube(hand_student_core.STUDENT_NO,hand_student_core.COURSE_NO)


-- Grouping Set 来代替多次UNION:
SELECT hand_student_core.STUDENT_NO,hand_student_core.COURSE_NO,sum(hand_student_core.CORE)
FROM hand_student_core
GROUP BY grouping sets (hand_student_core.STUDENT_NO,hand_student_core.COURSE_NO); 


-- 第十五单元：子查询进阶 

-- 查询课程分数高于课程J2ee中所有
SELECT
	hsc.student_no,
	hs.student_name,
	hc.course_name,
	hsc.core 
FROM
	hand_student_core hsc,
	hand_course hc,
	hand_student hs 
WHERE
	hsc.course_no = hc.course_no 
	AND hsc.student_no = hs.student_no 
	AND hsc.core > ALL ( SELECT hsc.core FROM hand_student_core hsc, hand_course hc WHERE hsc.course_no = hc.course_no AND hc.course_name = 'J2SE' ) 
	AND hc.course_name != 'J2SE';
	
	
-- 使用Exists操作
	
SELECT
	* 
FROM
	hand_student hs
WHERE
	 EXISTS (
	SELECT
		'X' 
	FROM
		hand_student,
		hand_student_core 
WHERE
	hs.STUDENT_NO = hand_student_core.STUDENT_NO)
	
	-- 使用WITH子句
WITH my1 AS (
	SELECT
		* 
	FROM
		hand_student hs 
	WHERE
	EXISTS ( SELECT 'X' FROM hand_student, hand_student_core WHERE hs.STUDENT_NO = hand_student_core.STUDENT_NO )) 
SELECT
	* 
FROM
	my1 
WHERE
	my1.student_age > 20
	
	
-- 第十六单元：递归查询 

--查询教师刘阳向下各级
select a.teacher_no, a.teacher_name, a.mid, a.mname, b.course_name
  from (select t.teacher_no,
               t.teacher_name,
               t.manager_no mid,
               (select hand_teacher.teacher_name
                  from hand_teacher
                 where hand_teacher.teacher_no = t.manager_no) mname
          from hand_teacher t) a
 right join (select hc.course_name, ht.teacher_no
               from hand_course hc, hand_teacher ht
              where hc.teacher_no = ht.teacher_no) b
    on a.teacher_no = b.teacher_no
		
		
-- 第十七单元：INSERT 增强 

/*语法：
INSERT ALL INTO （表1）
VALUES (查出来的字段1, 查出来的字段2)
INTO (表2)
VALUES (查出来的字段1, 查出来的字段2)
SELECT 语句;
*/
create  TABLE copy_student as SELECT * from hand_student where 1=2
create  TABLE copy_student2 as SELECT * from hand_student where 1=2

INSERT ALL INTO
copy_student
VALUES ( id,s_name,age,gender )
copy_student2
VALUES ( id,s_name,age,gender )
SELECT
	STUDENT_NO id,
	STUDENT_NAME s_name,
	STUDENT_AGE age,
	STUDENT_GENDER gender     
FROM hand_student     

-- 列转行,一行变多行，交叉报表的反操作(未完成)

INSERT ALL
 INTO sales_info VALUES (employee_id,week_id,sales_MON)
 INTO sales_info VALUES (employee_id,week_id,sales_TUE)
 INTO sales_info VALUES (employee_id,week_id,sales_WED)
 INTO sales_info VALUES (employee_id,week_id,sales_THUR)
 INTO sales_info VALUES (employee_id,week_id, sales_FRI)
 SELECT EMPLOYEE_ID, week_id, sales_MON, sales_TUE,
 sales_WED, sales_THUR,sales_FRI
 FROM sales_source_data;


-- 第十八单元：SQL进阶功能概括

-- 一、分析函数提供一系列比较高级的SQL功能。分析函数时建立在数据窗口（over在一定的数据库范
-- 围进行数据分析），在一定的数据范围进行排序、汇总等。

-- 二、闪回：一种机制可以用来查询之前一段时间内修改行原先的值，比如我们错误的提
-- 交了修改结果，现在又想查看修改行原来的值，这时候就可以使用闪回

-- 三、全局临时表

-- 四、物化视图： 是一种特殊的物理表，有别于普通的数据视图。在一段时间内保存
-- 固定的数据，提供自动刷新和手动刷新的机制

-- 五、VPD 全称Virtual Private Database，这个技术提供了对数据库信息的细粒度访问控制。
-- 是数据库层面的一种非常成熟的数据访问控制技术，通过策略函数来实现的具体的控制。
