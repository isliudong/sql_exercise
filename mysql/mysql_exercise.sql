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
