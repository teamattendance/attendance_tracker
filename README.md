#Tracker Attendance#

##User Stories##
This application is used to track the attendance of students across multiple cohorts.  Attendance Tracker can be used by Producers, Instructors, and Students.  

###Students###
A student will be able to sign up to the service after they have been invited by their cohort's instructor.  If the student has already enrolled in a previous course they can sign-in using their previous password.  Once the student signs in they can create or edit their profile as well as see their current attendance record for all enrolled classes.  If a student is running late they will be able to text a specified number to indicate they are late or sick.  The app will register in the students records if the absence is excused or unexcused (sick or late).   More than four lates will accrue into one absence. If the student is in danger of getting 4 absences, they will receive a text with their attendance status.  Once the student reaches 4 absences a text will be sent indicating they must contact their producer.  Their personal page will also display a notification that they need to contact their course producer with a link to email the producer.  Students will not be able to see or edit other student's data.

###Instructors###
Once the Instructor has signed in he/she will be able to see a daily roster of their classes. They will be able to mark every student as Present, Late, Unexcused Absence or Excused Absence.  An instructor may edit or view previous days' attendance records and the overall student data.  Instructors will have the ability to make new cohorts.  Once a cohort is created an e-mail will be automatically generated asking the student to sign in for the first time.  If a student has already taken a course with the school then they can use their previous information.

###Producers###
After a producer signs in they will see a list of all their cohorts. When the producer clicks on a cohort, they will be able to view the attendance records for each student in the class.  The students that need to be contacted due to poor attendence will be higlighted. The producer will be able to jump to specifc date and see the attendance record for the day.

##Technology##
- Ruby on Rails
- ActiveRecord
- HTML
- CSS
- JavaScript
- Heroku
- Chart.js
- Twilio
- ActionMailer

##ERD##
!["attendance_tracker/attendance_tracker_app/ERD.png"]

##Wireframes##





