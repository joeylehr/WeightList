Through - Trail and Lehrer 
1st real issue: 

Originally was using form_tag for the New view in the Post#new -- was able to change it to form_for --> stackoverflow to the rescue:

http://stackoverflow.com/questions/10154785/ruby-on-rails-undefined-method-discussions-path-nested-resource-one-to-many

<%= form_tag(weight_journal_posts_path, method: :post) do %>
  
  <p><%= label_tag "Entry Date" %>
  <%= date_field_tag :entry_date %></p>

  <p><%= label_tag "Current Weight" %>
  <%= number_field_tag :current_weight %></p>

  <p><%= label_tag "Worked Out" %>
  <%= check_box_tag :worked_out? %></p>

  <p><%= label_tag "Motivational Level (1-10)" %>
  <%= number_field_tag :motivation_level, in: 1..10 %></p>
  <br>

  <%= submit_tag "Good job!" %>
<% end %>



=====

40 days to loose 20 pounds
40 days = total amount of days /

User has a start_date (March 1)
User has an end date  (March 15)
Post on the 4th   
== 11 days left ==

end_date - start_date =>total_days_of_diet = 14 days

end_date - post_date = 

March 15th - March 4th 

Days Remaining
(@user.final_weigh_in_date - @post.entry_date).to_i















