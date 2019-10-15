--List the following details of each employee: employee number, last name, first name, gender, and salary
select emp.emp_no as EmpNo,emp.first_name As FirstName,emp.last_name As LastName, emp.gender as Gender, sal.salary as Salary
from employees emp
inner join salaries sal on emp.emp_no = sal.emp_no

--List employees who were hired in 1986
select * from employees
where hire_date between '1986-01-10' and '1986-12-31'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, titles.title, dept_manager.from_date, employees.first_name, employees.last_name, employees.hire_date, dept_manager.to_date
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.from_date = employees.hire_date
join titles on titles.emp_no = dept_manager.emp_no
where titles.title like 'M%'
order by departments.dept_no

--List the department of each employee with the following information: employee number, last name, first name, and department name
select d.emp_no,emp.first_name,emp.last_name, dept.dept_name from dept_emp d
join departments dept on dept.dept_no = d.dept_no
join employees emp on emp.emp_no = d.emp_no

--List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
from employees
where first_name ='Hercules' and last_name like ('B%')

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select d.emp_no,emp.first_name,emp.last_name, dept.dept_name from dept_emp d
join departments dept on dept.dept_no = d.dept_no
join employees emp on emp.emp_no = d.emp_no
where dept.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
select d.emp_no,emp.first_name,emp.last_name, dept.dept_name from dept_emp d
join departments dept on dept.dept_no = d.dept_no
join employees emp on emp.emp_no = d.emp_no
where dept.dept_name = 'Sales'
OR dept.dept_name = 'Development'
order by dept.dept_name desc

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select count(last_name) as count, last_name from employees
group by last_name
order by last_name desc
