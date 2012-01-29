$('<%= "#issue_#{@issue.id}" %>').fadeOut 'fast', ->
  $(this).remove()
