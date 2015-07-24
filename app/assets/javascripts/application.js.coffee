# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

initEvents = ->
  $(".navbar-toggle").click ->
    if $(".navbar-collapse").hasClass("collapse in")
      $(".navbar-collapse").removeClass("in")
      $(".navbar-collapse").attr("aria-expanded", "false")
    else
      $(".navbar-collapse").addClass("collapse in")
      $(".navbar-collapse").attr("aria-expanded", "true")


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


$(document).ready initEvents
