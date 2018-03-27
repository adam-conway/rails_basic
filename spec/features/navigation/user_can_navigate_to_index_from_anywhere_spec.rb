require 'rails_helper'

describe 'User' do
  scenario 'User uses nav bar link to get to student index page' do

    visit new_student_path

    within(".nav-bar") do
      click_link "Students"
    end

    expect(current_path).to eq(students_path)
  end
  scenario 'User uses nav bar link to get to create student page' do

    visit students_path

    within(".nav-bar") do
      click_link "Create A Student"
    end

    expect(current_path).to eq(new_student_path)
  end
end
