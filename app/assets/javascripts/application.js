// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



$(function(){
  $('.flexslider').flexslider({});

  $(".button-collapse").sideNav({
     edge: 'right',
    menuWidth: 300, // Default is 240
  });
  $('.modal-trigger').leanModal({
    dismissible: false
  });
  // 후기 modal
  $('.modal-trigger_ep').leanModal({
  });
  flatpickr('.flatpickr')
  // polar 글쓰기

  $("#polar").css( 'cursor', 'pointer' );
  $("#polar").click(function(){
    if($("#polar-write").css("display") == "none"){
        $("#polar-write").show("slow");
    } else {
        $("#polar-write").hide("slow");
    }
  })


  // input type="file 미리보기"
  $(document).on('change', '.image_in', function (){
    ex = this.id;
    readURL(this);
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#image_'+ex).attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
  });


    // 마켓 참가 img 미리보기

  $(".flea").click(function(){
    market_id = $(this).val();
    text = this.textContent;
    img_url = $('#market_img_'+market_id).val();
    term_end = $('#market_end_'+market_id).val();
    $('#attend_text').text("'"+text +"'에 참가합니다.");
    $('#banner').val("'"+text +"'에 참가합니다.");
    $('#term_end').val(term_end);
    $('#marketIn').val(img_url);
    $('#marketImg').attr("src", img_url);
    $('#market_id').val(market_id)
  })
    // post 좋아요 버튼
    $(document).on('click', '.like_submit', function (){
      post_id = this.value;
      this_btn = this;
      element = this.innerHTML;
      img = $(this).children().attr('class');
      count = parseInt($(".like_count_"+post_id).text());
      var likePath = $("#like-id").data("pathToAsset");
      var unlikePath = $("#unlike-id").data("pathToAsset");
      load = '<div id="preload_btn" class="preloader-wrapper active" style="width:20px; height:20px;"><div class="spinner-layer spinner-red-only"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div></div>';
      $(this).html(load);
      $.ajax({
        method: "POST",
        url: "/post_like",
        data: {post_id: post_id},
        success: function(){
          if( img == "like_img" ){
            $(this_btn).html(element);
            $(".like_count_" + post_id).text( count - 1);
            $(this_btn).children().attr("src", unlikePath );
            $(this_btn).children().attr("class", "unlike_img" );
            $(".like_counts_" + post_id).text( count - 1);
         } else {
            $(this_btn).html(element);
            $(".like_count_" + post_id).text( count + 1);
            $(this_btn).children().attr("src", likePath);
            $(this_btn).children().attr("class", "like_img" );
            $(".like_counts_" + post_id).text( count + 1);
         };
        }
      })
      return false;
    });
  $(document).on('click', '.re_view',  //댓글 보기
      function (){
        post_id = this.getAttribute('value');
        if ( $("#reply_"+post_id).css("display") == "none") {
          $("#reply_"+post_id).show("slow");
        }
        else {
          $("#reply_"+post_id).hide("slow");
        }
        return false;
      });
       // 댓글 작성
    $('body').on('click', '.re_submit', function (){
            var post_id = $(this).val();
            if ( $('#re_input_'+post_id).val() != '') {
              reply_id = parseInt($('#last_re_id').val());
              user_id = $('#current_user_id').val();
              user_kind = $('#current_user_kind').val();
              user_nick = $('#current_user_nick').text();
              reply_content = $('#re_input_'+post_id).val();

              var reply_content_span = $('<span />',{
                'id': 're_content_' + String(reply_id + 1)
              })
              var seller_nick = $('<a />',{
                'class': 'nickname',
                'style': 'display:inline-block font-size:15px;',
                'href': '/user_page/'+ user_id
              })
              var buyer_nick = $('<span />',{
                'style': 'color: gray;  font-size: 20px;'
              })
              var in_span = $('<span />', {})
              var out_div = $('<div />', {
                  'id': 'one_reply_'+ String(reply_id + 1),
                  'style': "margin-bottom:5px"
                });
              // 댓글 수정,삭제 버튼
              var edit_i = $('<i />', {
                'class': 'material-icons',
                'text': 'mode_edit',
                'style': 'font-size:22px'
              });
              var delete_i = $('<i />', {
                'class': 'material-icons',
                'text': 'delete',
                'style': 'font-size:22px'
              });
              var edit_btn =$('<button />', {
                'class': 'reply_update enjoy-css',
                'style': 'height: 20px;',
                'id': 'reply_update_'+ String(reply_id+1),
                'value': String(reply_id+1)
              });
              var delete_btn = $('<button />', {
                'class': 'reply_delete enjoy-css',
                'style': 'height: 20px;',
                'id': 'reply_delete_'+ String(reply_id+1),
                'value': String(reply_id+1)
             });
              $('#re_form_'+post_id).after('<div class="progress" id="re_preload"><div class="indeterminate"></div></div>');
              $.ajax({
                method: "post",
                url: "/post_reply",
                data: {post_id: post_id, content: reply_content},
                success: function(){
                  $('#last_re_id').val(reply_id + 1);
                  $('#re_input_'+post_id).val('');
                  $('#re_preload').remove();
                  $('#re_form_'+post_id).after(out_div);
                  $('#one_reply_'+String(reply_id + 1)).append(in_span);
                  if ( user_kind == "seller") {
                    $('#one_reply_'+String(reply_id + 1)).children().append(seller_nick.append(user_nick));
                  }
                  else {
                    $('#one_reply_'+String(reply_id + 1)).children().append(buyer_nick.append(user_nick));
                  }
                  $('#one_reply_'+String(reply_id + 1)).children().append(" : ");
                  $('#one_reply_'+String(reply_id + 1)).children().append(reply_content_span.append(reply_content));
                  $('#one_reply_'+ String(reply_id + 1)).append(edit_btn);
                  $('#reply_update_' +String(reply_id + 1)).append(edit_i);
                  $('#one_reply_'+ String(reply_id + 1)).append(delete_btn);
                  $('#reply_delete_' + String(reply_id + 1)).append(delete_i);
                }
              });
            }
            return false;
        });
//댓글 삭제
    $(document).on('click', '.reply_delete',  function (){
          reply_id = this.value;
          load = '<div id="preload_btn" class="preloader-wrapper active" style="width:25px; height:25px;"><div class="spinner-layer spinner-red-only"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div></div>';
          $(this).html(load);
          $.ajax({
            method: "get",
            url: "/reply_delete",
            data: {re_id: reply_id},
            success: function(){
              $('#one_reply_'+reply_id).remove();
            }
          })
        });
        $(document).on('click', '.reply_update',  //댓글 수정
          function (){
            reply_id = this.value;
            reply_content = $('#re_content_'+reply_id).text();
              var input = $('<input />', {
                  'type': 'text',
                  'id': 're_content_update_'+ reply_id,
                  'name': 'content',
                  'value': reply_content,
                  'style': "width:50%"
                });
              var done = $('<i />', {
                'class': 'small material-icons',
                'text': 'done'
              });
              var settings_backup_restore = $('<i />', {
                'class': 'small material-icons',
                'text': 'settings_backup_restore'
              });
              var ok =$('<button />', {
                'class': 'reply_ok enjoy-css',
                'style': 'height: 20px;'
              });
              var cancel = $('<button />', {
                'class': 'reply_cancel enjoy-css',
                'style': 'height: 20px;'
              });
              $('#re_content_'+reply_id).parent().append(input);
              $('#re_content_'+reply_id).parent().append(ok);
              $('.reply_ok').append(done);
              $('#re_content_'+reply_id).parent().append(cancel);
              $('.reply_cancel').append(settings_backup_restore);
              $('#re_content_'+reply_id).hide();
              $('#reply_update_'+reply_id).css('display', 'none');
              $('#reply_delete_'+reply_id).css('display', 'none');
              input.focus();
            // 수정 취소 버튼
            $(document).on('click', '.reply_cancel', function (){
              $('#re_content_'+reply_id).show();
              $('#re_content_update_'+reply_id).remove();
              $('.reply_cancel').remove();
              $('.reply_ok').remove();
              $('#reply_update_'+reply_id).css('display', '');
              $('#reply_delete_'+reply_id).css('display', '');
            });
          //수정 확인 버튼
          $(document).on('click', '.reply_ok', function (){
              $('.reply_cancel').remove();
              load = '<div id="preload_btn" class="preloader-wrapper active" style="width:25px; height:25px;"><div class="spinner-layer spinner-red-only"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div></div>';
              $(this).html(load);
              text = $('#re_content_update_'+reply_id).val();
              $.ajax({
                method: "post",
                url: "/reply_update",
                data: {re_id: reply_id, content: text},
                success: function(){
                  $('#re_content_update_'+reply_id).remove();
                  $('#re_content_'+reply_id).text(text);
                  $('#re_content_'+reply_id).show();
                  $('.reply_ok').remove();
                  $('#reply_update_'+reply_id).css('display', '');
                  $('#reply_delete_'+reply_id).css('display', '');
                }
              })
            })
          });

// 회원가입 버튼
          $(document).on('click', '#nickname_check', function (){
            nickname = $('#nickname').val();
            if (nickname==""){}
            else {
              $.ajax({
                method: "post",
                dataType: "json",
                url: "/services/same_nickname",
                data: {nickname: nickname},
                success: function(json){
                  var result = $.parseJSON(json);
                  if (result) {
                    $('.email_check_modal_content').text('\'' + nickname + '\'은 사용가능한 닉네임 입니다.');
                    $('#nickname').attr("readonly", "readonly");
                    $('#nickname_check').hide();
                    $('#nickname_change').show();
                    $('#same_check').hide();
                    $('#same_ok').show();
                    $('#email_check_modal').openModal();
                  }
                  else {
                    $('.email_check_modal_content').text('\'' + nickname + '\'은 중복된 닉네임 입니다.');
                    $('#email_check_modal').openModal();
                  }
                }
              })
            }
          });
          $(document).on('click', '#nickname_change', function (){
            $('#nickname').removeAttr("readonly");
            $('#nickname_change').hide();
            $('#nickname_check').show();
            $('#same_ok').hide();
            $('#same_check').show();
          });



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  pagination
  // posts
  if ($('.posts_pagination').length) {
    $(window).scroll(function() {
      var url = $('.posts_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.posts_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
  // like_posts
  if ($('.like_posts_pagination').length) {
    $(window).scroll(function() {
      var url = $('.like_posts_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.like_posts_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
  // goods
  if ($('.goods_pagination').length) {
    $(window).scroll(function() {
      var url = $('.goods_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.goods_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
  // my_ep
  if ($('.my_ep_pagination').length) {
    $(window).scroll(function() {
      var url = $('.my_ep_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.my_ep_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
  // ep
  if ($('.ep_pagination').length) {
    $(window).scroll(function() {
      var url = $('.ep_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.ep_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
// search
  // user_searches
  if ($('.user_searches_pagination').length) {
    $(window).scroll(function() {
      var url = $('.user_searches_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.user_searches_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
  // post_searches
  if ($('.post_searches_pagination').length) {
    $(window).scroll(function() {
      var url = $('.post_searches_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.post_searches_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
  // flea_searches
  if ($('.user_searches_pagination').length) {
    $(window).scroll(function() {
      var url = $('.user_searches_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.user_searches_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
  // past_fleas
  if ($('.past_fleas_pagination').length) {
    $(window).scroll(function() {
      var url = $('.past_fleas_pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.past_fleas_pagination').html('<div class="progress"><div class="indeterminate"></div></div>');
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
});
