class CoursesController < ApplicationController
  before_action :set_student

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = @student.courses.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = @student.courses.new
  end

  # GET /courses/1/edit
  def edit
    @course = @student.courses.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = @student.courses.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @student, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      @course = @student.courses.find(params[:id])
      if @course.update(course_params)
        format.html { redirect_to @student, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = @student.courses.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to @student, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Student.Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_name, :course_description)
    end
    def set_student
      @student = Student.find(params[:student_id])
    end
end
