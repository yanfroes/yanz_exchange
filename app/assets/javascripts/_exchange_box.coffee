$(document).ready ->

  $('.inverter').on "click", ->
    a = $("#currency").val()
    b = $("#currency_destination").val()

    $("#currency").val(b)
    $("#currency_destination").val(a)
    $('form').submit()

  $(document).on "change", ->
    $('form').submit()

  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
