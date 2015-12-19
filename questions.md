Is it OK that our log and tmp folders are blank? Did we fuck up by moving our folders?

Do we have a model for users or simply for each subclass?

LOOK AT USER MODEL

do we have to add type manually

form helper?
<%= form_for(student) do |f| %>
<% this_param = student.id.to_s %>
<%= f.text_field this_param %>
<%= f.submit %>


<input type="text" name=<%= student.id.to_s %> value = "present">
<%= f.text_field :attendence %>

      <% if record.day > Cohort.find(params[:cohort_id]).start_date && record.day < Cohort.find(params[:cohort_id]).end_date  %>
<%end%>