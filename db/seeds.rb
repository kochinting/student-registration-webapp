# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Student.destroy_all
Course.destroy_all


Student.create [
                   {first_name: "Tom", last_name: "Hanks"},
                   {first_name: "Donald", last_name: "Trump"}
               ]

tom = Student.find_by first_name: "Tom"
tom.courses.create [
                       {course_name: "Calculus", course_description: "simply calculus"},
                       {course_name: "English", course_description: "simply english"}

                   ]

donald = Student.find_by first_name: "Donald"
donald.courses.create [
                          {course_name: "Art", course_description: "simply art"},
                          {course_name: "Music", course_description: "simply music"},
                          {course_name: "Math", course_description: "simply math"}

                      ]
