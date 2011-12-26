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
          
$ adjustBoardHeight = ->
  if $('div#board').length
    height = $(window).height() - 160
    $('div#board section ul').css('min-height', height)

$ limitUserStoryPerStatus = ->
  if $('div#board').length
    for section in $('section ul')
      if $(section).children('li.user_stories').length > 4
        hideUserStories(section)
        $(section).children('li.show_more_user_stories').show()

hideUserStories = (e) ->
  last_user_story = $(e).children('li.user_stories').length
  $(e).children('li.user_stories').slice(4, last_user_story).hide()

$ showMoreUserStories = ->
  if $('li.show_more_user_stories').length
    for i in $('li.show_more_user_stories')
      $(i).click ->
        $(this).hide()
        $(this).parent().children('li.user_stories').fadeIn('fast')
