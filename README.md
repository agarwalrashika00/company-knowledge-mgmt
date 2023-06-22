1. Find names of all employees currently not working in any projects. ->
Employee.joins('left join employees_projects on employees.id = employees_projects.employee_id and employees_projects.active = 1').distinct.where('employees_projects.active is null').pluck(:full_name)

### fires ->
Employee Pluck (51.4ms)  SELECT DISTINCT "employees"."full_name" FROM "employees" left join employees_projects on employees.id = employees_projects.employee_id and employees_projects.active = 1 WHERE (employees_projects.active is null)

2. Find all employees who have exposure to all HTML, Javascript and IOS.

Employee.joins(projects: :technologies).where('technologies.name': ['Html', 'Javascript', 'Ios']).select('employees.full_name', 'count(distinct technologies.id) as t_count').group('employees.id').having('t_count >= 3')

3. Find the technologies in which a particular employee(Say B) has expertise(3 or more projects)

Employee.joins(projects: :technologies).select('employees.full_name', 'technologies.id as t_id', 'count(*) as tech_count').group('employees.id', 'technologies.id').having('tech_count >= 3')

4. Find the employee who has done most no of projects in android (do this using variable also).

Employee.joins(projects: :technologies).where('technologies.name': 'Android').select('employees.full_name', 'count(*) as and_count').group('employees.id').order('and_count desc').first

### fires -> 
Employee Load (0.3ms)  SELECT "employees"."full_name", count(*) as and_count FROM "employees" INNER JOIN "employees_projects" ON "employees_projects"."employee_id" = "employees"."id" INNER JOIN "projects" ON "projects"."id" = "employees_projects"."project_id" INNER JOIN "projects_technologies" ON "projects_technologies"."project_id" = "projects"."id" INNER JOIN "technologies" ON "technologies"."id" = "projects_technologies"."technology_id" WHERE "technologies"."name" = ? GROUP BY "employees"."id" ORDER BY and_count desc LIMIT ?  [["name", "Android"], ["LIMIT", 1]]