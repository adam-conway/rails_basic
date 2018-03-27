require 'rails_helper'

describe 'User' do
  scenario 'User visits /students/:id and sees student page' do
    student = Student.create!(name: "Adam")

    visit student_path(student)

    expect(page).to have_content("Adam")
  end

  scenario 'User visits /students/:id and sees many addresses' do
    student = Student.create!(name: "Adam")
    address1 = student.addresses.create!(description: "Great", street: "Main", city: "Denver", state: "CO", zip: "80220")
    address2 = student.addresses.create!(description: "Not good", street: "MLK", city: "SF", state: "CA", zip: "1234")
    address3 = student.addresses.create!(description: "bad", street: "Champa", city: "NYC", state: "TX", zip: "2456")
    address4 = student.addresses.create!(description: "opk", street: "Larimer", city: "Houston", state: "NY", zip: "4564")

    visit student_path(student)

    expect(page).to have_content(address1.description)
    expect(page).to have_content(address2.street)
    expect(page).to have_content(address3.city)
    expect(page).to have_content(address4.state)
  end

  scenario 'User visits /students/:id and sees many courses' do
    student = Student.create!(name: "Adam")
    course1 = Course.create!(name: "Mod1")
    course2 = Course.create!(name: "Mod2")
    course3 = Course.create!(name: "Mod3")
    course4 = Course.create!(name: "Mod4")
    student_course = StudentCourse.create!(student_id: student.id, course_id: course1.id)
    student_course = StudentCourse.create!(student_id: student.id, course_id: course2.id)
    student_course = StudentCourse.create!(student_id: student.id, course_id: course3.id)
    student_course = StudentCourse.create!(student_id: student.id, course_id: course4.id)

    visit student_path(student)

    expect(page).to have_content(course1.name)
    expect(page).to have_content(course2.name)
    expect(page).to have_content(course3.name)
    expect(page).to have_content(course4.name)
  end
end
