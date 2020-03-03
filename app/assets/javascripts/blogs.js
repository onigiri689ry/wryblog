$(function () {
  var buildInputFile = function (num) {
    var input = `<input data-id="${num}" type="file" name="blog[images_attributes][${num}][image_url]" id="blog_images_attributes_${num}_image_url">`
    return input
  }

  var blog_img = $('.write_image')
  if (blog_img.length)
    blog_img.parents('.write__image-select__ul-text').css('opacity', 1);
  blog_img.parent().next('.btn-box').css('display', 'block');
  
  $(".blog-detail__top__item-image-list__inner").on({
    'mouseenter': function () {
      var child = $(this).children();
      url = $(child).attr('src');
      inner_id = $(child).data('inner_id');
      photo = $('.blog-detail__top__item-image-main--photo');
      main = $("#main_" + inner_id);
      $(photo).fadeOut();
      $(main).fadeIn();
    }
  });

  $('.write__image-select__ul-text').on('change', 'input[type="file"]', function (e) {
    var id = $(this).data('id'),
      file = e.target.files[0],
      reader = new FileReader(),
      $label = $(".ul-id-" + id),
      $li = $label.children('li')

    // 画像ファイル以外の場合は何もしない
    if (file.type.indexOf("image") < 0) {
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function (file) {
      return function (e) {
        // liの中を削除する
        $li.empty();
        // 透過していた領域を表示する
        $label.css('opacity', '1');
        // 領域の中にロードした画像を表示するimageタグを追加
        $li.append($('<img>').attr({
          src: e.target.result,
          width: "114px",
          height: "116px",
          class: "preview",
          title: file.name,
        }));
        // 編集削除ボタンを表示する
        $('.btn-box').css('display', 'block');
      };
    })(file);

    reader.readAsDataURL(file);
  });



  // 削除ボタンクリック
  $(this).on("click", ".delete-btn", function () {
    var input = $(this).parent().siblings('input');
    var num = $(input).data('id');
    $(this).parent().prev().empty();
    $(input).remove();
    var html = buildInputFile(num)
    $(this).parent().parent().append(html);
    $(this).parent().parent().css('opacity', '0');
    return false;
  });
});