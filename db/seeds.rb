User.create(email: "admin@example.com", password: "admin@example.com", password_confirmation: "admin@example.com")
User.create(email: "student@example.com", password: "student@example.com", password_confirmation: "student@example.com")
User.update_all confirmed_at: DateTime.now

Classroom.create(name: "Room1")
Classroom.create(name: "Room2")
Classroom.create(name: "Room3")

Service.create(name: "Math", duration: 45, student_price: 0)
Service.create(name: "Massage", duration: 45, student_price: 0)
Service.create(name: "Yoga", duration: 45, student_price: 0)

Course.create(user: User.first, classroom: Classroom.first, service: Service.first)
Course.first.update(monday: true, wednesday: true)
Course.first.update(start_time: Time.now + 1.day)

Course.create(user: User.second, classroom: Classroom.second, service: Service.second)
Course.second.update(tuesday: true, thursday: true)
Course.second.update(start_time: Time.now + 1.day)

# Lesson
# Enrollment
# Attendance
