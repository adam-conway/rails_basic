require 'rails_helper'

describe Student do
  describe "relationships" do
    it "has many addresses" do
      student = Student.new()
      expect(student).to respond_to(:addresses)
    end
    it "has many courses" do
      student = Student.new()
      expect(student).to respond_to(:courses)
    end
  end
end
