class StudentsController < ApplicationController
  respond_to :json
  def create
    @student = Student.find_or_create_by_account_number(params[:student][:account_number])
    respond_with @student
  end
end
