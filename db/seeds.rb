User.create(email: "admin@example.com", password: "admin@example.com", password_confirmation: "admin@example.com")
User.create(email: "student@example.com", password: "student@example.com", password_confirmation: "student@example.com")
User.update_all confirmed_at: DateTime.now

Classroom.create(name: "Room1")
Classroom.create(name: "Room2")
Classroom.create(name: "Room3")

Service.create(name: "Math", duration: 45, client_price: 0)
Service.create(name: "Massage", duration: 45, client_price: 0)
Service.create(name: "Yoga", duration: 45, client_price: 0)

