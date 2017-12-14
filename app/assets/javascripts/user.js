$(document).ready(function () {
  $('.btn-search-user').click(function() {
    var name = $('#name').val();
    $.ajax({
      url: '/users',
      type: 'GET',
      data: {name: name},
      success: function(result) {
        $('.users-ajax').html(result);
      },
      error: function (result) {
        alert(I18n.t('categories.create.error'));
      }
    });
  });
});
