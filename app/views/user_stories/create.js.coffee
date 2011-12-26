<% if flash.now[:error] %>
  $('div#form ul#flash_error').remove()
  $('div#form').prepend("<%= escape_javascript(render(:partial => 'shared/flash_msgs')) %>")
<% else %>
  $('div#form').dialog('close')
  user_story = $("<%= escape_javascript(render(:partial => 'user_stories/user_story', :locals => { :user_story => @user_story })) %>").hide()
  $("<%= status_list %>").append(user_story)
  $(user_story).fadeIn('fast')
<% end %>
