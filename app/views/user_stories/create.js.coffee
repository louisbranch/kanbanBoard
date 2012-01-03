<% if @user_story.errors.any? %>
  $('div#form ul#error_messages').remove()
  $('div#form').prepend("<%= escape_javascript(render :partial => 'shared/error_messages', :locals => {:object => @user_story}) %>")
<% else %>
  $('div#form').dialog('close')
  user_story = $("<%= escape_javascript(render(:partial => 'user_stories/user_story', :locals => { :user_story => @user_story, :project => @project })) %>").hide()
  $("<%= status_list %>").append(user_story)
  $(user_story).fadeIn('fast')
<% end %>

