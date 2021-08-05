drop retirement_titles;


--retrieve titles of employees with birth years 1952 through 1954
SELECT 
em.emp_no,
em.first_name,
em.last_name,
ti.title,
ti.from_date,
ti.to_date
--INTO retirement_titles
FROM employees as em
left join titles as ti
on em.emp_no = ti.emp_no
where (em.birth_date between '1952-01-01' AND '1955-12-31') 
ORDER BY em.emp_no, ti.from_date DESC;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.from_date DESC;


-- Employee count by department number
SELECT COUNT(ut.emp_no),ut.title
FROM unique_titles as ut
GROUP BY ut.title
order by count desc;
