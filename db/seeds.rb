# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(name: "tarun", email: "tarun@example.com", password: "tarun123", age:"40", experience: "10 years", qualification: "Advance knowledge of Rails" ,type: "Recruiter")
User.create(name: "rahul", email: "rahul@example.com", password: "rahul123", age:"33", experience: "9 years", qualification: "Advance knowledge of Ruby", type: "Recruiter")
User.create(name: "karan", email: "karan@example.com", password: "karan123", age:"35", experience: "8 years", qualification: "Advance knowledge of Java", type: "Recruiter")


User.create(name: "ram", email: "ram@example.com", password: "ram123", age:"24", experience: "Fresher", qualification: "BCA", type: "Seeker")
User.create(name: "raj", email: "raj@example.com", password: "raj123", age:"25", experience: "Fresher", qualification: "MCA" ,type: "Seeker")


Job.create(title: "Devloper", description: "devloper description", location: "Indore", requirement: "Basic knowledge of coding", user_id: 1)
Job.create(title: "Manager", description: "manager description", location: "Indore", requirement: "Basic knowledge of management", user_id: 1)
Job.create(title: "HR", description: "HR description", location: "Indore", requirement: "Basic knowledge of HR", user_id: 2)
Job.create(title: "Tester", description: "tester description", location: "Indore", requirement: "Basic knowledge of testing", user_id: 2)
		

JobSeeker.create(user_id:4,job_id:1, status: "applied")
JobSeeker.create(user_id:4,job_id:2, status: "applied")
JobSeeker.create(user_id:4,job_id:3, status: "applied")
JobSeeker.create(user_id:5,job_id:1, status: "applied")
JobSeeker.create(user_id:5,job_id:4, status: "applied")
JobSeeker.create(user_id:5,job_id:2, status: "applied")
JobSeeker.create(user_id:5,job_id:3, status: "applied")

