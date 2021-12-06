-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employees_name, monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id;

-- 2. ������� ���� ���������� � ������� �� ������ 2000.
select employees_name, monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select employees_name, monthly_salary from employee_salary
join salary on salary.id = employee_salary.salary_id
left join employees on employees.id = employee_salary.employee_id
where employees_name is null;
;
-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select employees_name, monthly_salary from employee_salary
join salary on salary.id = employee_salary.salary_id
left join employees on employees.id = employee_salary.employee_id
where employees_name is null and monthly_salary < 2000;

-- 5. ����� ���� ���������� ���� �� ��������� ��.
select employees_name, monthly_salary from employee_salary
join salary on salary.id = employee_salary.salary_id
right join employees on employees.id = employee_salary.employee_id
where monthly_salary is null;

-- 6. ������� ���� ���������� � ���������� �� ���������.
select employees_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id;

-- 7. ������� ����� � ��������� ������ Java �������������.
select employees_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Java %';

-- 8. ������� ����� � ��������� ������ Python �������������.
select employees_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Python%';

-- 9. ������� ����� � ��������� ���� QA ���������.
select employees_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 10. ������� ����� � ��������� ������ QA ���������.
select employees_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Man%QA%';

-- 11. ������� ����� � ��������� ��������������� QA
select employees_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Auto%QA%';

-- 12. ������� ����� � �������� Junior ������������
select employees_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Junior%';

-- 13. ������� ����� � �������� Middle ������������
select employees_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Middle%';

-- 14. ������� ����� � �������� Senior ������������
select employees_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Senior%';

-- 15. ������� �������� Java �������������
select monthly_salary from roles_employee
join roles on roles_employee.role_id = roles.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Java %';

-- 16. ������� �������� Python �������������
select monthly_salary from roles_employee
join roles on roles_employee.role_id = roles.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Python%';

-- 17. ������� ����� � �������� Junior Python �������������
select employees_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Jun%Python%';

-- 18. ������� ����� � �������� Middle JS �������������
select employees_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Mid%JavaS%';

-- 19. ������� ����� � �������� Senior Java �������������
select employees_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Sen%Java %';

-- 20. ������� �������� Junior QA ���������
select monthly_salary, role_name from roles_employee
join roles on roles_employee.role_id = roles.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Jun%QA%';

-- 21. ������� ������� �������� ���� Junior ������������
select role_name, avg(monthly_salary) as average_salary from roles_employee
join roles on roles_employee.role_id = roles.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Junior%'
group by role_name;

-- 22. ������� ����� ������� JS �������������
select role_name, sum (monthly_salary) as salary_sum from roles_employee
join roles on roles_employee.role_id = roles.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%JavaSc%'
group by role_name;

-- 23. ������� ����������� �� QA ���������
select role_name, min (monthly_salary) as min_salary from roles_employee
join roles on roles_employee.role_id = roles.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA%'
group by role_name;

-- 24. ������� ������������ �� QA ���������
select role_name, max (monthly_salary) as max_salary from roles_employee
join roles on roles_employee.role_id = roles.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA%'
group by role_name;

-- 25. ������� ���������� QA ���������
select count (employees.id) as amount from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 26. ������� ���������� Middle ������������.
select count (employees.id) as amount from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';

-- 27. ������� ���������� �������������
select count (employees.id) as amount from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';

-- 28. ������� ���� (�����) �������� �������������.
select sum(monthly_salary) as funds from roles_employee
join roles on roles_employee.role_id = roles.id
join employee_salary on roles_employee.employee_id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where role_name like '%developer%';

-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
select employees_name, role_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
order by monthly_salary asc;

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employees_name, role_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;

-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employees_name, role_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2300
order by monthly_salary asc;

-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employees_name, role_name, monthly_salary from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc;