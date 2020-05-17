// $(document).on('turbolinks:load', function(){
$(function() {
  function buildHtml(comment){
    var html = `
          <li class="comment-box">
            <div class="comment-user">${comment.name}</div>
            <div class="comment-sentence">${comment.comment.replace(/\r?\n/g, '<br />')}</div>
          </li>`;
    return html;
  };

  $(document).on('click', '.modal-open' ,function(e){
    //カスタムデータ属性"data-id"の値を取得
    var $postId = $(this).data('id');
    $.ajax({
      type: 'GET',
      url: '/posts/' + $postId,
      data: { postId: $postId },
      dataType: 'json'
    })
    .done(function (data) {
      // 挿入されているコメント情報をリセット
      $("ul#target-show-comment").empty();
      $.each( data.comments, function( index, comment ) {
        var showPost = buildHtml(comment);
        // コメントを挿入
        $("ul#target-show-comment").append(showPost);
      });
    })
    .fail(function (){
      console.log("失敗しました");
    });


    //------自動更新で最新コメントを取得して表示させる------//
    var reloadMessages = function() {
      $.ajax({
        type: 'GET',
        url: '/posts/' + $postId,
        data: { postId: $postId },
        dataType: 'json'
      })
      .done(function (data) {
        // 挿入されているコメント情報をリセット
        $("ul#target-show-comment").empty();
        $.each( data.comments, function( index, comment ) {
          var showPost = buildHtml(comment);
          // コメントを挿入
          $("ul#target-show-comment").append(showPost);
        });
      })
      .fail(function (){
        console.log("失敗しました");
      });

      var id = setTimeout(reloadMessages, 4000);
      console.log("id = " + id + " flag = " + flag);
      if(flag == false){
        clearTimeout(id);
      }
    };
    reloadMessages();
  });
  

  var flag;
  $(document).on('click', '.post-details' ,function(e){
    flag = true;
  });
  $(document).on('click', '.modal-close' ,function(e){
    flag = false;
  });

  
  $(document).on('click', '.comment-submit' ,function(e){
    //カスタムデータ属性"data-id"の値を取得
    var $postId = $(this).data('id');
    var $postComment = $("#_posts_"+ $postId + "_post_comments_comment").val();
    e.preventDefault();
    $.ajax({
      type: 'GET',
      url: '/posts/' + $postId + '/post_comments',
      data: { post_id: $postId,
              comment: $postComment
            },
      dataType: 'json'
    })
    .done(function (data) {
      var showPost = buildHtml(data.comment);
      // コメントを挿入
      $("ul#target-show-comment").append(showPost);
      // 入力フォームをリセット
      $('textarea[name="/posts/'+ $postId +'/post_comments[comment]"]').val("");
      // コメント投稿時に一番下までスクロール
      $(".modal-post__content__comment--scloll").animate({scrollTop: $(".modal-post__content__comment--scloll")[0].scrollHeight},'swing');
    })
    .fail(function (){
      console.log("失敗しました");
    });
  });
});