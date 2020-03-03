$(function () {

  // 画像の削除
  $(".delete-btn").click(function (e) {
    e.preventDefault();
    var image_id = $(this).data("imgid")
    // 新規で画像をいれらときはlengthは「0」になる
    if (image_id.length != 0) {
      $.ajax({
        // Api::BlogsControllerのimage_destroyに飛ぶ
        type: 'DELETE',
        url: '/api/blogs_controller/image_destroy',
        data: { img_id: image_id },
        dataType: 'json'
        .done(function () {
          alert("削除しました");
        })
        .fail(function () {
          alert("削除に失敗しました");
        })
      })
    }
  });
});