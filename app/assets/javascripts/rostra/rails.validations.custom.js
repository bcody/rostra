var custom_validation_callbacks = {

  tag_list_length: function(element, event_data) {
    var validate_tag_list_length = element.attr('id') === 'question_tag_list' && element.val().length > 0;

    if (validate_tag_list_length) {

      var error = function() {
        var existing_error = element.siblings('.error')

        if (existing_error.length) {
          return existing_error
        } else {
          return element.after('<span class="error"></span>').next();
        }
      }();

      var valid = element.val().replace(/,\s+$/, '').split(',').length < 6;

      if (valid) {
        error.text('cannont have more than 5 tags');
        element.parent().addClass('field_with_errors')
        element.data('valid', false);
      } else {
        error.text('');
        element.parent().removeClass('field_with_errors')
        element.data('valid', true);
      }
    }
  }

};

clientSideValidations.callbacks.element.after = function(element, event_data) {
  custom_validation_callbacks.tag_list_length(element, event_data);
}
