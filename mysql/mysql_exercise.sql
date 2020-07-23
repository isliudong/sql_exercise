-- Create table 学生信息
create table HAND_STUDENT
(
  STUDENT_NO     VARCHAR(10) not null,
  STUDENT_NAME   VARCHAR(20),
  STUDENT_AGE    int(2),
  STUDENT_GENDER VARCHAR(5)
);
COMMIT;
-- Add comments to the table 
ALTER TABLE HAND_STUDENT COMMENT '学生信息表' ;
-- Add comments to the columns
ALTER TABLE HAND_STUDENT MODIFY COLUMN STUDENT_NO VARCHAR ( 10 ) COMMENT '学号';
ALTER TABLE HAND_STUDENT MODIFY COLUMN STUDENT_Name VARCHAR ( 20 ) COMMENT '姓名';
ALTER TABLE HAND_STUDENT MODIFY COLUMN STUDENT_age INT ( 2 ) COMMENT '年龄';
ALTER TABLE HAND_STUDENT MODIFY COLUMN student_GENDER VARCHAR ( 5 ) COMMENT '性别';
-- Create/Recreate primary, unique and foreign key constraints
ALTER TABLE HAND_STUDENT ADD PRIMARY KEY ( STUDENT_NO );
-- Create table 教师信息表
create table HAND_TEACHER
(
  TEACHER_NO   VARCHAR(10) not null,
  TEACHER_NAME VARCHAR(20),
  MANAGER_NO   VARCHAR(10)
);

-- Create/Recreate primary, unique and foreign key constraints 
alter table HAND_TEACHER add primary key (TEACHER_NO);

-- Create table 课程信息表
create table HAND_COURSE
(
  COURSE_NO   VARCHAR(10) not null,
  COURSE_NAME VARCHAR(20),
  TEACHER_NO  VARCHAR(20) not null
);

-- Create/Recreate primary, unique and foreign key constraints 
alter table HAND_COURSE add constraint PK_COURSE primary key (COURSE_NO, TEACHER_NO);

-- Create table 成绩信息表
create table HAND_STUDENT_CORE
(
  STUDENT_NO VARCHAR(10) not null,
  COURSE_NO  VARCHAR(10) not null,
  CORE       FLOAT4
);

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
-- 别名
SELECT hand_student.student_name as 'name' ,hand_student_core.course_no 课程号,hand_student_core.core
from hand_student,hand_student_core

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

SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name LIKE '王.%' ESCAPE '.';
-- 使用NULL条件：
SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name is null;
-- 使用多个条件组合的逻辑操作符：
SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name LIKE '王%' and hand_student.student_no>'s010' ;
-- 使用ORDER BY 子句进行排序：

SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name LIKE '王%' ORDER BY hand_student.student_no asc ;

SELECT hand_student.student_name FROM hand_student WHERE hand_student.student_name LIKE '王%' ORDER BY hand_student.student_no desc ;

-- 第三单元：单行函数

-- 大小写不敏感
SELECT hand_student.student_name from hand_student where upper(hand_student.student_no)='s001'
SELECT hand_student.student_name from hand_student where LOWER(hand_student.student_no)='S001'

-- 常用字符函数
SELECT s.student_no, LENGTH(s.student_no), INSTR(s.student_no,'0')from hand_student s where SUBSTR(s.student_no,2)='009'

-- 数字操作函数：
SELECT ROUND(45.923,2), ROUND(45.923,0), ROUND(45.923,-1) FROM DUAL;


-- 日期操作
SELECT SYSDATE()  FROM DUAL;
SELECT SYSDATE()/7 weeks FROM DUAL;
SELECT TO_DAYS(SYSDATE()) + 1 days FROM DUAL;
SELECT DATE_ADD(SYSDATE(),INTERVAL 1 day)  FROM DUAL;


-- 条件表达式

SELECT hand_student.student_name,CASE hand_student.student_no
	WHEN 's001' THEN
		'ooo'
	ELSE
		hand_student.student_no
END FROM hand_student;
