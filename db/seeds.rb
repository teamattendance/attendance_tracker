# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# working email
p1 = Producer.create({
  email: 'babwapple@gmail.com', password: 'test', password_confirmation: 'test', phone: "1", first_name: 'Hannah', last_name: 'Edwards', img_url: 'https://pbs.twimg.com/profile_images/574563795932082176/E8ncX11D.jpeg', bio: 'ipsum loremmmmmmm'})
# working email
p2 = Producer.create({
  email: 'egnaro78@gmail.com', password: 'test', password_confirmation: 'test', first_name: 'Prodigal', last_name: 'Producer'
  })

# working email
i1 = Instructor.create({
  email: 'testingemailusability@gmail.com', password: 'test', password_confirmation: 'test', phone: "1", first_name: 'Issac', last_name: 'Inwood', img_url: 'https://upload.wikimedia.org/wikipedia/commons/0/09/Spam_can.png', bio: 'ipsum loremmmmmmm'})
# working email
i2 = Instructor.create({
  email: 'testingattendence@gmail.com', password: 'test', password_confirmation: 'test', phone: "1", first_name: 'Notsung', last_name: 'Notchoi'
  })
# NOT working email
i3 = Instructor.create({
  email: 'letstrythis@gmail.com', password: 'test', password_confirmation: 'test', phone: "1", first_name: "Daniel", last_name: "Dunst"
  })


# working email
s1 = Student.create({
  email: 'julia.pearson@gmail.com', password: 'test', password_confirmation: 'test', phone: "1", first_name: 'Jemima', last_name: 'Jones' 
  })
# working email
s2 = Student.create({
  email: 'salguero.meredith@gmail.com', password: 'test', password_confirmation: 'test', phone: "+14125769880", first_name: 'Mary', last_name: 'Salsbury' 
  })
# NOT working email
s3 = Student.create({
  email: 'letstrythis@gmail.com', password: 'test', password_confirmation: 'test', phone: "3", first_name: 'Julius', last_name: 'Albert' 
  })
# NOT working email
s4 = Student.create({
  email: 'letstrythis@gmail.com', password: 'test', password_confirmation: 'test', phone: "2", first_name: 'Maximus', last_name: 'Millions' 
  })
# NOT working email
s4 = Student.create({
  email: 'letstrythis@gmail.com', password: 'test', password_confirmation: 'test', phone: "3", first_name: 'Jordan', last_name: 'Fields' 
  })
# NOT working email
s5 = Student.create({
  email: 'letstrythis@gmail.com', password: 'test', password_confirmation: 'test', phone: "3", first_name: 'Tanya', last_name: 'Greenberg' 
  })

c1 = Cohort.create({
  cohort_name: 'Sisyphus (Complete)', start_date: "2015-06-10",
  end_date: "2015-06-17",
  subject: "WDI",
  max_absences: 2,
  full_time: 1,
  })

days1 = [
  {day: "2015-06-10"},
  {day: "2015-06-11", attendence: "late"},
  {day: "2015-06-12", attendence: "late"},
  {day: "2015-06-13"},
  {day: "2015-06-14", attendence: "unexcused"},
  {day: "2015-06-15"},
  {day: "2015-06-16"},
  {day: "2015-06-17"}
]

days2 = [
  {day: "2015-06-10", attendence: "late"},
  {day: "2015-06-11", attendence: "late"},
  {day: "2015-06-12"},
  {day: "2015-06-13"},
  {day: "2015-06-14"},
  {day: "2015-06-15"},
  {day: "2015-06-16"},
  {day: "2015-06-17"}
]

days3 = [
  {day: "2015-06-10"},
  {day: "2015-06-11"},
  {day: "2015-06-12"},
  {day: "2015-06-13", attendence: "late"},
  {day: "2015-06-14"},
  {day: "2015-06-15"},
  {day: "2015-06-16"},
  {day: "2015-06-17"}
]

days4 = [
  {day: "2015-06-10"},
  {day: "2015-06-11", attendence: "late"},
  {day: "2015-06-12", attendence: "late"},
  {day: "2015-06-13", attendence: "late"},
  {day: "2015-06-14", attendence: "late"},
  {day: "2015-06-15"},
  {day: "2015-06-16"},
  {day: "2015-06-17"}
]

p1.cohorts.push(c1)
i1.cohorts.push(c1)
i2.cohorts.push(c1)
i3.cohorts.push(c1)
c1.users.push(s1, s2, s3, s4)

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

days4.each do |day|
  d = DateRecord.create(day)
  s4.date_records.push(d)
end

days5 = [
  {day: "2015-12-01", attendence: "late"},
  {day: "2015-12-02", attendence: "late"},
  {day: "2015-12-03", attendence: "late"},
  {day: "2015-12-04", attendence: "late"},
  {day: "2015-12-07", attendence: "late"},
  {day: "2015-12-09", attendence: "late"},
  {day: "2015-12-10", attendence: "late"},
  {day: "2015-12-11", attendence: "late"},
  {day: "2015-12-14", attendence: "late"},
  {day: "2015-12-15", attendence: "late"},
  {day: "2015-12-16", attendence: "late"},
  {day: "2015-12-17", attendence: "late"},
  {day: "2015-12-21", attendence: "late"},
]

days6 = [
  {day: "2015-12-01"},
  {day: "2015-12-02"},
  {day: "2015-12-03"},
  {day: "2015-12-04"},
  {day: "2015-12-07"},
  {day: "2015-12-09"},
  {day: "2015-12-10", attendence: "unexcused"},
  {day: "2015-12-11"},
  {day: "2015-12-14"},
  {day: "2015-12-15"},
  {day: "2015-12-16"},
  {day: "2015-12-17"},
  {day: "2015-12-21"},
]

days7 = [
  {day: "2015-12-01"},
  {day: "2015-12-02"},
  {day: "2015-12-03"},
  {day: "2015-12-04", attendence: "unexcused"},
  {day: "2015-12-07"},
  {day: "2015-12-09"},
  {day: "2015-12-10"},
  {day: "2015-12-11", attendence: "unexcused"},
  {day: "2015-12-14"},
  {day: "2015-12-15", attendence: "unexcused"},
  {day: "2015-12-16"},
  {day: "2015-12-17", attendence: "unexcused"},
  {day: "2015-12-21"},
]

days8 = [
  {day: "2015-12-01"},
  {day: "2015-12-02"},
  {day: "2015-12-03", attendence: "unexcused"},
  {day: "2015-12-04"},
  {day: "2015-12-07"},
  {day: "2015-12-09"},
  {day: "2015-12-10", attendence: "late"},
  {day: "2015-12-11"},
  {day: "2015-12-14"},
  {day: "2015-12-15"},
  {day: "2015-12-16", attendence: "unexcused"},
  {day: "2015-12-17"},
  {day: "2015-12-21"},
]

c2 = Cohort.create({
  cohort_name: 'Artemis (Current)', start_date: "2015-12-01",
  end_date: "2016-01-20",
  subject: "WDI",
  max_absences: 4,
  full_time: 1,
  })

p2.cohorts.push(c2)
i1.cohorts.push(c2)
i2.cohorts.push(c2)
i3.cohorts.push(c2)
c2.users.push(s2, s3, s4, s5)

days5.each do |day|
  d = DateRecord.create(day)
  s2.date_records.push(d)
end

days6.each do |day|
  d = DateRecord.create(day)
  s3.date_records.push(d)
end

days7.each do |day|
  d = DateRecord.create(day)
  s4.date_records.push(d)
end

days8.each do |day|
  d = DateRecord.create(day)
  s5.date_records.push(d)
end
