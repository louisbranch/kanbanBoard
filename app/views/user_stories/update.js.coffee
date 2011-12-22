$('div#form').dialog('close')
$("<%= user_story_item %>").remove()
$("<%= status_list %>").append("<%= escape_javascript(render(:partial => 'user_stories/user_story', :locals => { :user_story => @user_story })) %>")
