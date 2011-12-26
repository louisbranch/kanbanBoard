$('div#form').dialog('close')
user_story = $("<%= escape_javascript(render(:partial => 'user_stories/user_story', :locals => { :user_story => @user_story })) %>").hide()
$("<%= status_list %>").append(user_story)
$(user_story).fadeIn('fast')
