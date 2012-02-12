$('<%= "#user_story_#{@user_story.id}" %>').fadeOut 'fast', ->
  $(this).remove()
