class CohortsController < ApplicationController
  before_action :authorize
  #GET /cohorts
  def index
    @user = User.find(session[:user_id])
    @cohorts = Cohort.all
    @cohorts = @user.cohorts
    if @cohorts.length == 1 && @user.type == "Student"
      redirect_to "/students/#{session[:user_id]}?cohort_id=#{@user.cohorts.first.id}"
    end
  end

  #GET /cohorts/:id/students [params :cohort_id]
  def show
    @user = User.find(session[:user_id])
    if @user.type == "Student"
      redirect_to "/students/#{session[:user_id]}?cohort_id=#{params[:id]}"
    end
    @cohort = Cohort.find(params[:id])
    if @cohort.users.include? @user
      @students = @cohort.users.where(type:"Student")
      @instructors = @cohort.users.where(type:"Instructor")
      @producers = @cohort.users.where(type:"Producer")
      # to be set in erb
      @missed = 0
      @lates = 0
      binding.pry
    else
      redirect_to "/cohorts"
    end
  end

  #GET /cohorts/new
  def new
    @user = User.find(session[:user_id])
    if @user.type == "Instructor"
      @cohort = Cohort.new
    else
      redirect_to "/cohorts"
    end
  end

  #POST /cohorts
  def create
    @user = User.find(session[:user_id])
    @cohort = Cohort.create(cohort_params)
    @instructors = User.where(type:"Instructor")
    @producers = User.where(type:"Producer")
    if @cohort.save
      @instructors.find(@user.id).cohorts.push(@cohort)
      if @instructors.find_by(email: params[:second_instructor_email]) then @instructors.find_by(email: params[:second_instructor_email]).cohorts.push(@cohort) end
      if @instructors.find_by(email:params[:third_instructor_email]) then @instructors.find_by(email:params[:third_instructor_email]).cohorts.push(@cohort) end 
      if @producers.find_by(email:params[:producer_email]) then @producers.find_by(email:params[:producer_email]).cohorts.push(@cohort) end 
      flash[:notice] = "#{@cohort.cohort_name} was successfully created"
      redirect_to "/cohorts/#{@cohort.id}/students"
    else
      render :new
    end
  end

  #GET /cohorts/:id/edit
  def edit
    @user = User.find(session[:user_id])
    @cohort = Cohort.find(params[:id])
    if @user.type == "Student"
      redirect_to "/students/#{session[:user_id]}?cohort_id=#{params[:id]}"
    end
    if @cohort.users.include? @user
      @students = @cohort.users.where(type:"Student")
      @instructors = @cohort.users.where(type:"Instructor")
      @producers = @cohort.users.where(type:"Producer")
    else
      redirect_to "/cohorts"
    end
  end

  #POST /cohorts/:id
  def update
    @user = User.find(session[:user_id])
    @cohort = Cohort.find(params[:id])
    @instructors = User.where(type:"Instructor")
    @producers = User.where(type:"Producer")
    if @cohort.update(cohort_params)
      if @instructors.find_by(email: params[:second_instructor_email]) then @instructors.find_by(email: params[:second_instructor_email]).cohorts.push(@cohort) end
      if @instructors.find_by(email:params[:third_instructor_email]) then @instructors.find_by(email:params[:third_instructor_email]).cohorts.push(@cohort) end 
      if @producers.find_by(email:params[:producer_email]) then @producers.find_by(email:params[:producer_email]).cohorts.push(@cohort) end 
      flash[:notice] = "#{@cohort.cohort_name} was successfully edited"
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


