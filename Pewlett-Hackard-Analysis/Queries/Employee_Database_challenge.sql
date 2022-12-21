-- Module 7 - CHALLENGE - Pewlett-Hackard Employees Database

-- Number of Retiring Employees by Title

-- Deliverable 1 

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirees_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title,
INTO unique_titles
FROM retirees_titles AS rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Before exporting the table, confirm the table is correct, then export

SELECT * FROM unique_titles;

-- Write another query file to retrieve the number of employees
-- by their most recent job title who are about to retire

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles; 