class CohortsController < ApplicationController

  #GET /cohorts
  def index
    @user = User.find(session[:user_id])
    @cohorts = Cohort.all
    @cohorts = @user.cohorts
    if @cohorts.length == 1 && @user.type == "Student"
      redirect_to "/students/#{session[:user_id]}"
    end
  end

  #GET /cohorts/:id/students [params :cohort_id]
  def show
    @user = User.find(session[:user_id])
    if @user.type == "Student"
      redirect_to "/students/#{session[:user_id]}"
    end
    @cohort = Cohort.find(params[:id])
    @students = @cohort.users.where(type:"Student")
    @instructors = @cohort.users.where(type:"Instructor")
    @producers = @cohort.users.where(type:"Producer")
    # to be set in erb
    @missed = 0
    @lates = 0
  end

  #GET /cohorts/new
  def new
    @cohort = Cohort.new
  end

  #POST /cohorts
  def create
    @cohort = Cohort.create(cohort_params)
    @instructors = User.where(type:"Instructor")
    if @cohort.save
      binding.pry
      @instructors.find_by(email: params[:user_email]).cohorts.push(@cohort)

      # if @instructors.find_by(email:params[:instructor_email_2]).cohorts.push(@cohort) end
      # if @instructors.find_by(email:params[:instructor_email_3]).cohorts.push(@cohort) end
      flash[:notice] = "#{@cohort.cohort_name} was successfully created"
      redirect_to "/cohorts/#{@cohort.id}/students"
    else
      render :new
    end
  end


  private

  def cohort_params
    params.require(:cohort).permit(:cohort_name, :start_date, :end_date, :subject, :full_time, :max_absences)
  end

end


