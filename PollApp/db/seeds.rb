# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(username: 'Presidio9')
u2 = User.create!(username: 'Hewlett-Packard')
u3 = User.create!(username: 'Apple222')
u4 = User.create!(username: 'Shoei43')

p1 = Poll.create!(title: "What's the meaning of life?", author_id: u1.id)
p2 = Poll.create!(title: "SQL 4Eva?", author_id: u2.id)

q1 = Question.create!(poll_id: p1.id, text: "Do you even code bro?")
q2 = Question.create!(poll_id: p2.id, text: "SQL or ActiveRecord?")

a1 = AnswerChoice.create!(question_id: q1.id, text: 'You bet!')
a2 = AnswerChoice.create!(question_id: q1.id, text: 'No!')

a3 = AnswerChoice.create!(question_id: q2.id, text: 'SQL')
a4 = AnswerChoice.create!(question_id: q2.id, text: 'Is this a serious question?')

r1 = Response.create!(user_id: u1.id, answer_choice_id: a3.id)
r2 = Response.create!(user_id: u2.id, answer_choice_id: a3.id)

r3 = Response.create!(user_id: u4.id, answer_choice_id: a4.id)
r4 = Response.create!(user_id: u3.id, answer_choice_id: a3.id)
