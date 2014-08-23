jQuery ->
  $('#new_item').fileupload
    dataType: 'json'

    add: (e, data) ->
      data.context = $('[type="submit"]')
        .click ->
          data.context = $('<p/>').text('Uploading...').replaceAll $(this)
          data.submit()

    done: (e, data) ->
      data.form
        .after $('<p/>').text('Upload finished.')
        .hide()

      $.each data.result.files, (index, file) ->
        file_element = $('<li/>').text("#{file.name} on #{file.created_at}")#.appendTo(document.body)
        $('.items-list').prepend file_element

    progressall: (e, data) ->
      progress = parseInt data.loaded / data.total * 100, 10
      $('.progress .progress-bar').css 'width', "#{progress}%"
