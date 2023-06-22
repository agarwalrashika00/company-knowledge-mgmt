# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Employee.delete_all
employees = Employee.create([{full_name: 'A'}, {full_name: 'B'}, {full_name: 'C'}, {full_name: 'D'}, {full_name: 'E'}])
Project.delete_all
projects = Project.create([{title: 'P1'}, {title: 'P2'}, {title: 'P3'}, {title: 'P4'}, {title: 'P5'}, {title: 'P6'}, {title: 'P7'}, {title: 'P8'}, {title: 'P9'}])
Employee.first.projects = Project.where(title: ['P1','P2','P3','P6'])
EmployeesProject.last.update(active: true)
Employee.second.projects = Project.where(title: ['P1','P3','P7','P9'])
Employee.third.projects = Project.where(title: ['P1','P8','P9','P2'])
Employee.fourth.projects = Project.where(title: ['P1','P2','P4','P5', 'P6'])
EmployeesProject.last.update(active: true)
EmployeesProject.second_to_last.update(active: true)
Employee.fifth.projects = Project.where(title: ['P3', 'P4', 'P7'])
Technology.delete_all
technologies = Technology.create([{name: 'Html'}, {name: 'Javascript'}, {name: 'Ruby'}, {name: 'Rails'}, {name: 'Ios'}, {name: 'Android'}])
Project.first.technologies = Technology.where(name: ['Html', 'Javascript', 'Ruby', 'Rails'])
Project.second.technologies = Technology.where(name: 'Ios')
Project.third.technologies = Technology.where(name: 'Android')
Project.fourth.technologies = Technology.where(name: ['Ios', 'Android'])
Project.fifth.technologies = Technology.where(name: ['Ruby', 'Rails'])
Project.find_by_title('P6').technologies = Technology.where(name: ['Android', 'Html', 'Javascript'])
Project.find_by_title('P7').technologies = Technology.where(name: ['Android', 'Ios'])
Project.find_by_title('P8').technologies = Technology.where(name: ['Html', 'Javascript', 'Ruby', 'Rails', 'Android'])
Project.find_by_title('P9').technologies = Technology.where(name: 'Ios')
