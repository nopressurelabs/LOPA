# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).load ->
  $(".radio-inline").click ->
    elem = $($(this).prev())
    if elem.is("#do-subscribe")
      $("#do-subscribe").css("background-position", "0px -15px")
      $("#do-subscribe").attr("tabindex", "0")
      $("#do-not-subscribe").attr("tabindex", "-1")
      $("#do-not-subscribe").css("background-position", "0px 0px")
      $($("#do-subscribe").children()[0]).attr("checked", "checked")
      $($("#do-not-subscribe").children()[0]).removeAttr("checked")
    else
      $("#do-subscribe").css("background-position", "0px 0px")
      $("#do-subscribe").attr("tabindex", "-1")
      $("#do-not-subscribe").attr("tabindex", "0")
      $("#do-not-subscribe").css("background-position", "0px -15px")
      $($("#do-subscribe").children()[0]).removeAttr("checked")
      $($("#do-not-subscribe").children()[0]).attr("checked", "checked")

  $(".intl-toggler").click ->
    $(".intl-toggle").each (index) ->
      if $(this).css("display") == "none"
        $(this).css("display", "block")
      else
        $(this).css("display", "none")

      if $("#take_action_us_based").val()
        $("#take_action_us_based").val("false")
      else
        $("#take_action_us_based").val("true")


setInterval (->
  $.getJSON "stop-lopa-2015/count-actions", (data) ->
    $(".count").children("b").text(data)

  $.getJSON "stop-lopa-2015/last-actions", (data) ->
    items = []
    $.each data.actions, (element) ->
      elem = this
      str = "<tr>"
      str += "<td><div>" + elem.fullname + "</div><div>" + elem.country + "</div></td>"
      str += "<td class=\"timeago\">" + elem.time_ago + "</td>"
      str += "</tr>"
      items.push str
      return
    $("table.table").children("tbody").html(items)

  return
), 2000
