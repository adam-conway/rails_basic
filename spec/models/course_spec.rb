require 'rails_helper'

describe Course do
  describe "relationships" do
    it "has many students" do
      course = Course.new()
      expect(course).to respond_to(:students)
    end
  end
end
