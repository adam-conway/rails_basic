require 'rails_helper'

describe 'User' do
  scenario 'User visits /students and sees all students' do
    student1 = Student.create!(name: "Adam")
    student2 = Student.create!(name: "Evan")
    student3 = Student.create!(name: "Kelly")
    student4 = Student.create!(name: "Jake")
    student5 = Student.create!(name: "Kolya")

    visit students_path

    expect(page).to have_content(student1.name)
    expect(page).to have_content(student2.name)
    expect(page).to have_content(student3.name)
    expect(page).to have_content(student4.name)
    expect(page).to have_content(student5.name)
    expect(Student.all.count).to eq(5)
  end

  scenario 'User visits /students and goes to student show page' do
    student1 = Student.create!(name: "Adam")
    student2 = Student.create!(name: "Evan")
    student3 = Student.create!(name: "Kelly")
    student4 = Student.create!(name: "Jake")
    student5 = Student.create!(name: "Kolya")

    visit students_path
    click_link "Kelly"

    expect(page).to have_content(student3.name)
    expect(current_path).to eq(student_path(student3))
  end
end
