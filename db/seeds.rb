User.create(email: "admin@example.com", password: "admin@example.com", password_confirmation: "admin@example.com")
User.create(email: "student@example.com", password: "student@example.com", password_confirmation: "student@example.com")
User.update_all confirmed_at: DateTime.now
