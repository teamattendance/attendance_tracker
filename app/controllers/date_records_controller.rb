  # edit_date_record GET   /date_records/:id/edit(.:format)                 date_records#edit
  #      date_record PATCH /date_records/:id(.:format)                      date_records#update
  #                  PUT   /date_records/:id(.:format)                      date_records#update

  class DateRecords < ApplicationController

    # GET
    # Path:
    # /cohorts/:id/students/date_records/new

    def new
     @students = Cohort.find(params['id']).students

      @students.each do |student|
        DateRecord.new()
      end
    end

    # POST

    def create
      # this goes through all the params we were passed, each named as the student's id and with the value of present, absent, late
      params.each do |named_param|
        # make this id into an integer
        this_id = named_param.to_i
        # find this student
        student = Student.find(this_id)
        # this is the input value of the param
        presence = named_param.val()
        # create a date record 
        this_record = DateRecord.create({attendence: presence, day: Time.now})
        # then assign it to this student
        student.date_records.push(this_record)
      end
      redirect_to '/cohorts/#{params[:id]}/students'
      # so this should have gone through each param/student and made the correct date_record for them
    end

    # /date_records/:id/edit(.:format)
    def edit
      @date = DateRecord.find(params['id'])
    end

    # /date_records/:id(.:format)
    def update
      date = DateRecord.find(params['id'])
      date.update({attendence: params['attendence']})

      redirect_to '/students/#{@date.student.id}'
    end

  end