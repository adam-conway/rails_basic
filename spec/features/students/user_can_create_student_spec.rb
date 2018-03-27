require 'rails_helper'

describe 'User' do
  scenario 'User visits /students/new and creates a student' do

    visit new_student_path

    fill_in "student[name]", with: "Ali"
    click_on "Create Student"

    expect(page).to have_content(Student.last.name)
    expect(Student.all.count).to eq(1)
  end
end
