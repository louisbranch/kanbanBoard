if $('div#form').length
  $('div#form').remove()
$("<div id=form></div>").dialog
  title: 'Edit User Story',
  width: 400,
  position: ['center',50]
  open: ->
    $("div#form").html("<%= escape_javascript(render(:partial => 'user_stories/form')) %>")
    $('form div#status').hide()
						
