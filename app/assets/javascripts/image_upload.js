$(document).on('turbolinks:load', function () {
  $(function () {
    function buildHTML(image) {
      var html =
        `
        <div class="prev-content">
          <img src="${image}", alt="preview" class="prev-image">
        </div>
        `
      return html;
    }
    $(document).on('change', '.hidden_file_field', function () {
      var file = this.files[0];
      var reader = new FileReader();
      // DataURIScheme文字列を取得
      reader.readAsDataURL(file);
      // 読み込みが完了したら処理実行
      reader.onload = function () {
        var image = this.result;
        if ($('.prev-content').length == 0) {
          var html = buildHTML(image)
          // 作成した.prev-contentをiconの代わりに表示
          $('.prev-contents').prepend(html);
          // 画像が表示されるのでiconを隠す
          $('.photo-icon').hide();
        } else {
          // 既に画像がプレビューされていれば画像データのみ入れ替え
          $('.prev-content .prev-image').attr({ src: image });
        }
      }
    });
  });
});