# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $(window).resize ->
        resizeSpreadsheet()

    $('#tbody tbody').scroll ->
        $('#tcounter thead').prop("scrollTop", this.scrollTop)
        $('#theader thead').prop("scrollLeft", this.scrollLeft)

    resizeSpreadsheet = () ->
        leftHeight = $('#left').height()
        windowHeight = $(window).height()
        navbarHeight = $('#navbar-plusing').height()
        $('#right').height(windowHeight-leftHeight-navbarHeight-50)
        $('#tbody').height(windowHeight-leftHeight-navbarHeight-40)

        tBodyWidth = $('#tbody tbody').width()
        $('#theader').width(tBodyWidth+28)

    resetTableScroll = () ->
        scrollTop = $("#tbody tbody").scrollTop()
        scrollLeft = $("#tbody tbody").scrollLeft()
        $('#tcounter thead').prop("scrollTop", scrollTop)
        $('#theader thead').prop("scrollLeft", scrollLeft)

    resizeSpreadsheet()
    resetTableScroll()
