 # edit_date_record GET   /date_records/:id/edit(.:format)                 date_records#edit
  #      date_record PATCH /date_records/:id(.:format)                      date_records#update
  #                  PUT   /date_records/:id(.:format)                      date_records#update

  class DateRecordsController < ApplicationController
    before_action :authorize

    # GET
    # Path:
    # /cohorts/:id/students/date_records/new

    def new
      @user = User.find(session[:user_id]) 
      @cohort_id = params[:id]
      @students = Cohort.find(params[:id]).users.where(type: "Student")
      @students.last.date_records.each do |this_date_record|
        if this_date_record.day == params[:date].to_date
          redirect_to "/cohorts/#{@cohort_id}/students"
          # add notice? that date record exists
        else
          @students.each do
            DateRecord.new()
          end
        end
      end

    end

    # POST
    def create
      # this goes through all the params we were passed, each named as the student's id and with the value of present, absent, late
      params.each do |key, value|
        # make this id into an integer
        id = key.to_i
        if id != 0
          # find this student
          student = Student.find(id)
          # this is the input value of the param
          presence = value
          # create a date record 
          this_record = DateRecord.create({attendence: presence, day: params[:date]})
          # then assign it to this student
          student.date_records.push(this_record)
        end
      end
      redirect_to "/cohorts/#{params[:id]}/students"
      # so this should have gone through each param/student and made the correct date_record for them
    end

    # /date_records/:id/edit(.:format)
    def edit
      @user = User.find(session[:user_id])
      # locate the date_record we're editing
      @date = DateRecord.find(params[:id])
    end

    # /date_records/:id(.:format)
    def update
      # take the params from path id to find date
      date = DateRecord.find(params[:id])
      # update the date with the params from the form
      date.update({attendence: params[:attendence]})
      student_id = date.student
      cohort_id =  User.find(student_id).cohorts.first.id
      # go back to student's show page
      redirect_to "/students/#{date.student.id}?cohort_id=#{cohort_id}"
    end

    # cohorts/:id/date_records
    def index
      @user = User.find(session[:user_id])
      @cohort = Cohort.find(1)
      @students = @cohort.users.where(type: "Student")
    end

  end