# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    $('#access_permission').change ->
        if !@checked
            $('#create_permission').prop 'checked', false
            $('#edit_permission').prop 'checked', false
            $('#delete_permission').prop 'checked', false
            $('#user_user_type_id').val('2')
        return

    $('#create_permission').change ->
        if @checked
            $('#access_permission').prop 'checked', true
        return

    $('#edit_permission').change ->
        if @checked
            $('#access_permission').prop 'checked', true
        return

    $('#delete_permission').change ->
        if @checked
            $('#access_permission').prop 'checked', true
        return

    $('#user_user_type_id').change ->
        if $(this).val() == '1'
            select_change true
        else
            select_change false

    select_change = (isChecked) ->
        $('#access_permission').prop 'checked', isChecked
        $('#create_permission').prop 'checked', isChecked
        $('#edit_permission').prop 'checked', isChecked
        $('#delete_permission').prop 'checked', isChecked

    return
