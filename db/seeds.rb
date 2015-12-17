# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p1 = Producer.create({
  email: 'babwapple@gmail.com', password: 'test', password_confirmation: 'test', phone: 1, first_name: 'Hannah', last_name: 'Edwards', img_url: 'https://pbs.twimg.com/profile_images/574563795932082176/E8ncX11D.jpeg', bio: 'ipsum loremmmmmmm'})

i1 = Instructor.create({
  email: 'testingemailusability@gmail.com', password: 'test', password_confirmation: 'test', phone: 1, first_name: 'Spammy', last_name: 'Edwards', img_url: 'https://upload.wikimedia.org/wikipedia/commons/0/09/Spam_can.png', bio: 'ipsum loremmmmmmm'})

s1 = Student.create({
  email: 'student1@test.test', password: 'test', password_confirmation: 'test', phone: 1, first_name: 'Testy1', last_name: 'Testy1' 
  })
s2 = Student.create({
  email: 'student2@test.test', password: 'test', password_confirmation: 'test', phone: 2, first_name: 'Testy2', last_name: 'Testy2' 
  })
s3 = Student.create({
  email: 'student3@test.test', password: 'test', password_confirmation: 'test', phone: 3, first_name: 'Testy3', last_name: 'Testy3' 
  })

c1 = Cohort.create({
  cohort_name: 'sisyphus', start_date: "-2015-08-08",
    end_date: "-2015-08-06",
    subject: "wdi",
    full_time: 1,
  })

p1.cohorts.push(c1)
i1.cohorts.push(c1)
c1.users.push(s1, s2, s3)

