# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p1 = Producer.create({
  email: 'babwapple@gmail.com', password: 'test', password_confirmation: 'test', phone: "1", first_name: 'Hannah', last_name: 'Edwards', img_url: 'https://pbs.twimg.com/profile_images/574563795932082176/E8ncX11D.jpeg', bio: 'ipsum loremmmmmmm'})

p2 = Producer.create({
  email: 'producin@g.a', password: 'test', password_confirmation: 'test', first_name: 'greatest', last_name: 'ever'
  })

p3 = Producer.create({
  email: 'dontstopproducin@yahoo.co.uk', password: 'test', password_confirmation: 'test', first_name: 'wub', last_name: 'alubadubdub'
  })

i1 = Instructor.create({
  email: 'testingemailusability@gmail.com', password: 'test', password_confirmation: 'test', phone: "1", first_name: 'Spammy', last_name: 'Edwards', img_url: 'https://upload.wikimedia.org/wikipedia/commons/0/09/Spam_can.png', bio: 'ipsum loremmmmmmm'})

i2 = Instructor.create({
  email: 'ascot@bo.i', password: 'test', password_confirmation: 'test', first_name: 'Not Sung', last_name: 'Not Choi'
  })

i3 = Instructor.create({
  email: 'sarg@beatles.pepper', password: 'test', password_confirmation: 'test', first_name: "Ringo", last_name: "Starr"
  })

s1 = Student.create({
  email: 'student1@test.test', password: 'test', password_confirmation: 'test', phone: "1", first_name: 'Testy1', last_name: 'Testy1' 
  })
s2 = Student.create({
  email: 'student2@test.test', password: 'test', password_confirmation: 'test', phone: "2", first_name: 'Testy2', last_name: 'Testy2' 
  })
s3 = Student.create({
  email: 'student3@test.test', password: 'test', password_confirmation: 'test', phone: "3", first_name: 'Testy3', last_name: 'Testy3' 
  })

c1 = Cohort.create({
  cohort_name: 'sisyphus', start_date: "2015-08-08",
  end_date: "2015-08-11",
  subject: "wdi",
  full_time: 1,
  })

days1 = [
  {day: "2015-08-08"},
  {day: "2015-08-09"},
  {day: "2015-08-10", attendence: "unexcused"},
  {day: "2015-08-11"}
]

days2 = [
  {day: "2015-08-08", attendence: "unexcused"},
  {day: "2015-08-09"},
  {day: "2015-08-10", attendence: "late"},
  {day: "2015-08-11"}
]
days3 = [
  {day: "2015-08-08"},
  {day: "2015-08-09"},
  {day: "2015-08-10", attendence: "late"},
  {day: "2015-08-11", attendence: "unexcused"}
]

p1.cohorts.push(c1)
i1.cohorts.push(c1)
c1.users.push(s1, s2, s3)

days1.each do |day|
  d = DateRecord.create(day)
  s1.date_records.push(d)
end

days2.each do |day|
  d = DateRecord.create(day)
  s2.date_records.push(d)
end

days3.each do |day|
  d = DateRecord.create(day)
  s3.date_records.push(d)
end
