require 'rails_helper'

describe 'User' do
  scenario 'User visits /courses/:id and sees all students in course' do
    course1 = Course.create!(name: "Mod1")
    student1 = Student.create!(name: "Adam")
    student2 = Student.create!(name: "Jake")
    student3 = Student.create!(name: "Evan")
    student4 = Student.create!(name: "Kelly")
    student_course = StudentCourse.create!(student_id: student1.id, course_id: course1.id)
    student_course = StudentCourse.create!(student_id: student2.id, course_id: course1.id)
    student_course = StudentCourse.create!(student_id: student3.id, course_id: course1.id)
    student_course = StudentCourse.create!(student_id: student4.id, course_id: course1.id)

    visit course_path(course1)

    expect(page).to have_content(student1.name)
    expect(page).to have_content(student2.name)
    expect(page).to have_content(student3.name)
    expect(page).to have_content(student4.name)
  end
end
