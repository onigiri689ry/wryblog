$(function () {
  function buildHTML(comment) {
    var html = `<strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                </strong>
                ${comment.text}`
    return html;
  }
  $('#new_comment').on('submit', function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function (data) {
      var html = buildHTML(data);
      $('.blog-show-box-comment-show').append(html);
      $('.comment-box').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function () {
      alert('error');
    })
  })
})