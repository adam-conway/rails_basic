require 'rails_helper'

describe 'User' do
  scenario 'User visits /students/new and creates a student' do
    student = Student.create!(name: "Adam")
    visit new_student_address_path(student)

    fill_in "address[description]", with: "1123"
    fill_in "address[street]", with: "Main St"
    fill_in "address[city]", with: "Denver"
    fill_in "address[state]", with: "CO"
    fill_in "address[zip]", with: "80220"

    click_on "Create Address"

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content(Address.last.description)
    expect(page).to have_content(Address.last.street)
    expect(page).to have_content(Address.last.city)
    expect(page).to have_content(Address.last.state)
    expect(page).to have_content(Address.last.zip)
    expect(student.addresses.count).to eq(1)
  end
end
