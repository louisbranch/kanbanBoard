$('div#form').dialog('close')
$("<%= status_list %>").append("<%= escape_javascript(render(:partial => 'user_stories/user_story', :locals => { :user_story => @user_story })) %>")
