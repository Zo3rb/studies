-- Lesson 16: Foreign Key Constraints (trainings)

DROP TABLE IF EXISTS employees_fk;
DROP TABLE IF EXISTS departments_fk;

CREATE TABLE departments_fk (
    department_id BIGSERIAL PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE
);

CREATE TABLE employees_fk (
    employee_id BIGSERIAL PRIMARY KEY,
    employee_name TEXT NOT NULL,
    department_id BIGINT,
    manager_id BIGINT,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES departments_fk(department_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT fk_employee_manager
        FOREIGN KEY (manager_id)
        REFERENCES employees_fk(employee_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

INSERT INTO departments_fk (department_name) VALUES
('Engineering'),
('Analytics');

INSERT INTO employees_fk (employee_name, department_id, manager_id) VALUES
('Ali', 1, NULL),
('Mona', 1, 1),
('Sara', 2, 1);

SELECT e.employee_id, e.employee_name, d.department_name, e.manager_id
FROM employees_fk e
LEFT JOIN departments_fk d ON d.department_id = e.department_id
ORDER BY e.employee_id;

