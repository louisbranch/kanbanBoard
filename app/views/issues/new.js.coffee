if $('div#form').length
  $('div#form').remove()
$("<div id=form></div>").dialog
  title: 'New Issue',
  width: 400,
  position: ['center',50]
  open: ->
    $("div#form").html("<%= escape_javascript(render('form', :project => @project, :user_story => @user_story, :issue => @issue)) %>")
