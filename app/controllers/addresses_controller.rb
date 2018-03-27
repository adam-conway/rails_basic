class AddressesController < ApplicationController

  def new
    # binding.pry
    @student = Student.find(params[:student_id])
    @address = Address.new
  end

  def create
    student = Student.find(params[:student_id])
    @address = student.addresses.new(address_params)
    @address.save
    redirect_to student_path(student)
  end

  private

  def address_params
    params.require(:address).permit(:description, :street, :city, :state, :zip)
  end
end
