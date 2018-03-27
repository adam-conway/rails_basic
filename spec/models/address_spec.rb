require 'rails_helper'

describe Address do
  describe "relationships" do
    it "has one student" do
      address = Address.new()
      expect(address).to respond_to(:student)
    end
  end
end
