class ExercisesController < ApplicationController
  respond_to :html, :json
  # GET /exercises
  # GET /exercises.json
  before_filter :set_scope
  before_filter :only_admin, only: [:show]

  def index
    @exercises = Exercise.by_student

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercises }
    end
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = @exercises_scope.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/new
  # GET /exercises/new.json
  def new
    @exercise = Exercise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find(params[:id])
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = @student.exercises.find_or_create_by_name(params[:exercise][:name])
    @exercise.contents = params[:exercise][:contents]
    @exercise.ordering = params[:exercise][:ordering]

    @exercise.save

    respond_with @exercise
  end

  # PUT /exercises/1
  # PUT /exercises/1.json
  def update
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      if @exercise.update_attributes(params[:exercise])
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
  end

  private
  def set_scope
    @exercises_scope = if params[:student_id].present?
                        @student = Student.find_by_account_number(params[:student_id])
                        @student.exercises
                       else
                        Exercise
                      end
  end

  def only_admin
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
