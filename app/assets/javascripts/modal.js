$(document).on('turbolinks:load', function(){
  // モーダル表示位置用変数
  var scrollPosition;

  // 「.modal-open」をクリック
  $('.modal-open').click(function(){
    // オーバーレイ用の要素を追加
    $('body').append('<div class="modal-overlay"></div>');
    // オーバーレイをフェードイン
    $('.modal-overlay').fadeIn('slow');

    // モーダルコンテンツのIDを取得
    var modal = '#' + $(this).attr('data-target');

    // モーダルコンテンツの表示位置を設定
    modalResize();

      // モーダルコンテンツフェードイン
    $(modal).fadeIn('slow');

    // モーダル表示中の背景スクロールをロック
    scrollPosition = $(window).scrollTop();
    $('body').addClass('fixed').css({'top': -scrollPosition});

    // 「.modal-close」をクリック
    $('.modal-close').off().click(function(){
      // モーダルコンテンツとオーバーレイをフェードアウト
      $(modal).fadeOut('slow');
      $('.modal-overlay').fadeOut('slow',function(){
        // オーバーレイを削除
        $('.modal-overlay').remove();
      });
    });

    // リサイズしたら表示位置を再取得
    $(window).on('resize', function(){
      modalResize();
    });

    // モーダルコンテンツの表示位置を設定する関数
    function modalResize(){
      // ウィンドウの横幅、高さを取得
      var w = $(window).width();
      // var h = $(window).height();

      // モーダルコンテンツの表示位置を取得
      var x = (w - $(modal).outerWidth(true)) / 2;
      // var y = (h - $(modal).outerHeight(true)) / 2;

      // モーダルコンテンツの表示位置を設定
      $(modal).css({'left': x + 'px','top': 65 + 'px'});
    }
  });

  // モーダル閉じた後のスクロールロック解除
  $('.modal-content').on('click', function() {
    $('body').removeClass('fixed').css({'top': 0});
    window.scrollTo( 0 , scrollPosition );
  });

});
