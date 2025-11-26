-- zad 1
SELECT
    first_name,
    last_name,
    salary
FROM
    teachers
WHERE
    last_name ILIKE 's%'
ORDER BY
    hire_date DESC;

-- zad 2
SELECT
    first_name,
    last_name
FROM
    teachers
WHERE
    salary > (
        SELECT AVG(salary) FROM teachers
    );

-- zad 3

SELECT
    c.class_name,
    t.last_name AS teacher_last_name,
    t.first_name AS teacher_first_name,
    COUNT(s.student_id) AS student_count
FROM
    classes c
JOIN
    teachers t ON c.teacher_id = t.id
LEFT JOIN
    students s ON c.class_id = s.class_id
GROUP BY
    c.class_name, t.last_name, t.first_name
ORDER BY
    student_count DESC;

-- zad 4
SELECT
    s.first_name,
    s.last_name
FROM
    students s
JOIN
    classes c ON s.class_id = c.class_id
JOIN
    teachers t ON c.teacher_id = t.id
WHERE
    EXTRACT(YEAR FROM s.enrollment_date) = 2023
    OR t.salary BETWEEN 30000 AND 40000;

-- zad 5

CREATE INDEX idx_teachers_last_name ON teachers (last_name);

EXPLAIN ANALYZE
SELECT *
FROM teachers
WHERE last_name = 'Smith';