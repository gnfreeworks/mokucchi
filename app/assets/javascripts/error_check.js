$(document).on('turbolinks:load', function(){

  function errorMessage(){
    function buildHTML(message) {
      var html =`<div class="error-messege"><p class="mb-0 text-danger">・${message}を入力してください。</p></div>`
      return html;
    }

    //現在表示中のerror_messageは削除
    $("div.error-messege").remove();

    //もくもく会投稿用チェック
    if($("#post_title").val() == ""){
      $("input#post_title").before(buildHTML("タイトル"));
    }
    if($("#post_access_url").val() == ""){
      $("input#post_access_url").before(buildHTML("接続URL"));
    }
    if($("#post_description").val() == ""){
      $("textarea#post_description").before(buildHTML("説明欄"));
    }

    //プロフィール用チェック
    if($("#user_name").val() == ""){
      $("input#user_name").before(buildHTML("表示名"));
    }

  }


  // views/posts/new
  $(document).on('click', '#new-post', function () {
    errorMessage();
  });
  // views/posts/edit
  $(document).on('click', '#edit-post', function () {
    errorMessage();
  });

  // views/devise/registrations/edit
  $(document).on('click', '#edit-profile', function () {
    errorMessage();
  });

});