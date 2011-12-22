$ dragUserStories = ->
  if $('section ul').length
    $('section ul').sortable
      scroll: false,
      connectWith: 'section ul',
      placeholder: 'user_stories placeholder',
      handle: 'header',
      opacity: 0.9,
      over: ->
        $(this).parent().addClass('active')
      out: ->
        $(this).parent().removeClass('active')
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
