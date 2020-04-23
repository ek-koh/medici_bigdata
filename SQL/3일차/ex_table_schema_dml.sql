drop table IF EXISTs emp;
drop table IF EXISTs dept;
CREATE TABLE dept (
    deptno               int  NOT NULL  AUTO_INCREMENT,
    dname                varchar(20)    ,
    loc                  varchar(20)    ,
    CONSTRAINT pk_dept PRIMARY KEY ( deptno )
 ) engine=InnoDB;
 
CREATE TABLE emp (
    empno                int  NOT NULL  AUTO_INCREMENT,
    ename                varchar(20)    ,
    job                  varchar(20),
    mgr                  smallint    ,
    hiredate             date    ,
    sal                  numeric(7,2)    ,
    comm                 numeric(7,2)    ,
    deptno               int    ,
    CONSTRAINT pk_emp PRIMARY KEY ( empno )
 ) engine=InnoDB;
 
CREATE INDEX idx_emp ON emp ( deptno );
 
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY ( deptno ) REFERENCES dept( deptno ) ON DELETE NO ACTION ON UPDATE NO ACTION;
