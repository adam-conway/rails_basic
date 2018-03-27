require 'rails_helper'

describe 'User' do
  scenario 'User visits /students/:id/edit and creates a student' do
    student = Student.create!(name: 'Adam')
    visit edit_student_path(student)

    fill_in "student[name]", with: "Ali"
    click_on "Update Student"

    expect(page).to_not have_content(student.name)
    expect(page).to have_content("Ali")
  end
end
