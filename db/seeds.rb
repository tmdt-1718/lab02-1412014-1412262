# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Message.create(body: "hello you");
#Message.create(body: "hello you 1");
#Message.create(body: "hello you 2");
#Message.create(body: "hello you 3");
#Message.create(body: "hello you 123");
#Message.create(body: "hello you 123");
#Message.create(body: "hello you 342");
#Message.create(body: "hello you 343");
#Message.create(body: "hello you 1233");
#Message.create(body: "hello you 2323");

#Smessage.create(user_id: 1 , message_id: 1)
#Rmessage.create(user_id: 2 , message_id: 1, readed: false)

#Smessage.create(user_id: 2 , message_id: 2)
#Rmessage.create(user_id: 3 , message_id: 2, readed: false)

#Smessage.create(user_id: 3, message_id: 3)
#Rmessage.create(user_id: 4 , message_id: 3, readed: false)

#Smessage.create(user_id: 4, message_id: 4)
#Rmessage.create(user_id: 5 , message_id: 4, readed: false)

#Smessage.create(user_id: 2, message_id: 5)
#Rmessage.create(user_id: 1, message_id: 5, readed: false)

#Smessage.create(user_id: 5, message_id: 6)
#Rmessage.create(user_id: 1, message_id: 6, readed: false)


m1 = Rmessage.find(5)
m1.readed = false
m1.save

m1 = Rmessage.find(6)
m1.readed = false
m1.save

#m1 = Rmessage.find(3)
#m1.readed = false
#m1.save

#m1 = Rmessage.find(4)
#m1.readed = false
#m1.save

#m1 = Rmessage.find(5)
#m1.readed = false
#m1.save

#m1 = Rmessage.find(6)
#m1.readed = false
#m1.save