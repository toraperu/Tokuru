// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .




//headerの位置=>固定、下にスクロールすると隠れる
$(function() {
  var $win = $(window),
      $header = $('header'),
      headerHeight = $header.outerHeight(),
      startPos = 0;

  $win.on('load scroll', function() {
    var value = $(this).scrollTop();
    if ( value > startPos && value > headerHeight ) {
      $header.css('top', '-' + headerHeight + 'px');
    } else {
      $header.css('top', '0');
    }
    startPos = value;
  });
});




//ページトップに戻るボタン
$(function() {
	$('#back a').on('click',function(){
		$('body, html').animate({
			scrollTop:0
			}, 800);
		return false;
	});
});



//連絡手段のその他を選択した時にフォーム出す
$(function(){
	$('#order_contact').change(function(){
		if ($(this).children('option:selected').val() == 'その他') {
			$('.else-contact-form').show();
		} else {
			$('.else-contact-form').hide();
		}
	});
});



//支払い方法にスキルの交換を選択した時、あなたのスキルの入力欄を出す&&価格を非表示にする
$(function(){
	$('#order_payment').change(function(){
		if ($(this).children('option:selected').val() == 'skill') {
			$('.your-skill-form').show();
			$('.existing-price').hide();
			$('.free-price').show();
      $('.cardInput').hide();
		} else {
			$('.your-skill-form').hide();
			$('.existing-price').show();
			$('.free-price').hide();
      $('.cardInput').show();
		}
	});
});





//無限スクロール(Topページ)
//注意点=> •ページネーションの位置重要　•classではなくid名を指定する　•autoTriggerではなくnextSerectorで次の要素を指定する
$(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ((scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
		$('#scroll-target').jscroll({
			contentSelector : "#scroll-target",
			loadingHtml : '<div class="col-xs-12 text-center"><i class="fas fa-spinner"></i></div>',
			nextSelector: '.pagination .next a',
			callback: function() {
             	$('nav.pagination').remove();
         	}
		});
    }
});


//無限スクロールの参考にしたサイトの記述
// $(window).on('scroll', function() {
//     scrollHeight = $(document).height();
//     scrollPosition = $(window).height() + $(window).scrollTop();
//     if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
//           $('.jscroll').jscroll({
//             contentSelector: '.skill-list',
//             nextSelector: 'span.next:last a'
//           });
//     }
// });



//table/tr要素全体がリンクになる
$(function(){
	$('tbody tr[data-href]').addClass('clickable').click(function () {
		window.location = $(this).attr('data-href');
	}).find('a').hover(function () {
		$(this).parents('tr').unbind('click');
	}, function () {
		$(this).parents('tr').click(function () {
			window.location = $(this).attr('data-href');
		});
	});
});




//ルームのメッセージ一覧で新しいメッセージを一番下に表示
$(function(){
	var height = 0;
	$("div.message").each( function(){
		height += ($(this).height());
	})
	$("div.message_box").scrollTop(height);
});



//ゆっくり要素を下に下げながら表示
$(function(){
　$(window).scroll(function (){
    $('.effect-fade').each(function(){
        var elemPos = $(this).offset().top;
        var scroll = $(window).scrollTop();
        var windowHeight = $(window).height();
        if (scroll > elemPos - windowHeight){
            $(this).addClass('effect-scroll');
        }
    });
　});
});




//flash messageの秒数指定
$(function(){
  setTimeout("$('.alert').fadeOut('slow')", 3000) 
})














































