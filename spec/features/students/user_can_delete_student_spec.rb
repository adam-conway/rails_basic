require 'rails_helper'

describe 'User' do
  scenario 'User visits /students and can delete a student' do
    student1 = Student.create!(name: "Adam")
    student2 = Student.create!(name: "Jake")
    student3 = Student.create!(name: "Evan")
    student4 = Student.create!(name: "Kelly")
    student5 = Student.create!(name: "Kolya")

    visit students_path
    within(".student_#{student2.id}") do
      click_link "Delete"
    end

    expect(page).to have_content(student1.name)
    expect(page).to_not have_content(student2.name)
    expect(page).to have_content(student3.name)
    expect(page).to have_content(student4.name)
    expect(page).to have_content(student5.name)
    expect(Student.all.count).to eq(4)
  end
end
