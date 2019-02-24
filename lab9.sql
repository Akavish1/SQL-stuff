set serveroutput on size 30000;
--blocks
---1 - a block that gives a 15% raise to all employees of department 10
--print how many workers have recieved a raise
begin
update emp
    set sal = sal * 0.85
    where deptno = 10;
    DBMS_OUTPUT.put_line(TO_CHAR(SQL%ROWCOUNT)||
	' employee(s) updated');
end;
/    
---2 - a block that takes a new and an old job description, finds all the employees matching the old job description and changes it to the new one
--print how many workers have had their job description changed
declare 
    olddesc varchar2(9);
    newdesc varchar2(9);
begin
    olddesc := 'CLERK';
    newdesc := 'CLERKLOL';
update emp
    set job = newdesc
    where job = olddesc;
    DBMS_OUTPUT.put_line(TO_CHAR(SQL%ROWCOUNT)||
	' employee(s) updated');
end;
/

--cursors
---1 - a program that prints all the columns and rows for dept, using a for loop
set serveroutput on size 30000;
declare
    cursor c1 is
        select *
        from emp;
    rowrec emp%rowtype;    
begin
    open c1;
    loop
        fetch c1 into rowrec;
        exit when c1%notfound;
        dbms_output.put_line('EMPNO: ' || '' || rowrec.empno);
        dbms_output.put_line('EMPNO: ' || '' || rowrec.ename);
        dbms_output.put_line('EMPNO: ' || '' || rowrec.sal);
    end loop;
    close c1;
end;    
/
---2 - a program that copies the rows in dept to a table named old_dept with no for loop
--print how many rows have been copied
DECLARE
	CURSOR dept_cur
	IS
	SELECT deptno
	, dname
	, loc
	FROM dept;
	r_dept dept_cur%ROWTYPE;
BEGIN
	OPEN dept_cur;
LOOP
	FETCH dept_cur INTO r_dept;
	EXIT WHEN dept_cur%NOTFOUND;
	INSERT INTO old_dept
	(deptno,dname,loc) VALUES
	(r_dept.deptno,r_dept.dname,r_dept.loc);
END LOOP;
	DBMS_OUTPUT.put_line(TO_CHAR(dept_cur%ROWCOUNT)||
	' department(s) copied');
	CLOSE dept_cur;
END;