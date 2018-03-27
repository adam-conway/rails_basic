require 'rails_helper'

describe 'User' do
  scenario 'User visits /students/:id and sees student page' do
    student = Student.create!(name: "Adam")

    visit student_path(student)

    expect(page).to have_content("Adam")
  end
end
