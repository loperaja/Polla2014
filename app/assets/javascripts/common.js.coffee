$(document).ready ->
	$(".autoShorten").autoShorten()

$(document).on 'click', '.modal_form_submit', ->
	$('#myModal').modal('hide')

$ ->
  $(".loading").hide() # hide it initially.
  # show on any Ajax event.
  $(document).ajaxStart(->
    $(".loading").show()
    $(".form-horizontal").fadeOut "slow"
    return
  ).ajaxStop ->
    $(".loading").hide() # hide it when it is done.
    return

  return	
  
$(document).on 'click', '.back-to-top', ->
	window.scrollTo 0, 0
	
jQuery.fn.autoShorten = ->
  @each ->
    if $(this).text().length > 100
      words = $(this).text().substring(0, 100).split(" ")
      shortText = words.slice(0, words.length - 1).join(" ") + " <strong>ver mas</strong>"
      $(this).data("replacementText", $(this).text()).html(shortText).css(cursor: "pointer").hover(->
        $(this).css color: "#333"
        return
      , ->
        $(this).css color: "#666"
        return
      ).click ->
        tempText = $(this).html()
        $(this).html $(this).data("replacementText")
        $(this).data "replacementText", tempText
        return

    return


  