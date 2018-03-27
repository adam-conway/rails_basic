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

    expect(page).to have_content("Great")
    expect(page).to have_content("MLK")
    expect(page).to have_content("NYC")
    expect(page).to have_content("4564")
  end
end
