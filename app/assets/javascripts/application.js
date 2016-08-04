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
  $(".button-collapse").sideNav({
     edge: 'right',
    menuWidth: 300, // Default is 240
  });
  $('.modal-trigger').leanModal({
    dismissible: false,
    starting_top: '5%', // Starting top style attribute
  });
  flatpickr('.flatpickr')


  // input type="file 미리보기"
  $(".image_in").change(function(){
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
    img_url = $(this).children().val();
    text = this.textContent;
    $('#attend').empty();
    $('#attend').text("'"+text +"'에 참가합니다.");
    $('#marketIn').val(img_url);
    $('#marketImg').attr("src", img_url);
  })

  // post 좋아요 버튼
  $('.like_submit').click(function(){
    post_id = this.value;
    element = this;
    text = this.innerHTML;
    aler
    count = parseInt(document.getElementById("like_count_"+post_id).innerHTML);
    $.ajax({
      method: "POST",
      url: "/post_like",
      data: {post_id: post_id},
      success: function(){
        if( text == "좋아요" ){
          $("#like_count_" + post_id).text( count + 1);
          $(element).text("좋아요 취소");
       } else {
          $("#like_count_" + post_id).text( count - 1);
          $(element).text("좋아요");
       };
      }
    })
  });
//댓글 보기
  $('.re_view').css( 'cursor', 'pointer' );
  $(".re_view").click(function(){
  post_id = this.getAttribute('value');
    if ( $("#reply_"+post_id).css("display") == "none") {
      $("#reply_"+post_id).show("slow");
    }
    else {
      $("#reply_"+post_id).hide("slow");
    }
  })
  //댓글 삭제
  $(".reply_delete").click(function(){
    reply_id = this.value;
    $.ajax({
      method: "get",
      url: "/reply_delete",
      data: {re_id: reply_id},
      success: function(){
        $('#one_reply_'+reply_id).remove();
      }
    })
  })
//댓글 수정
  $(".reply_update").click(function(){
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
    $('.reply_cancel').click(function(){
      $('#re_content_'+reply_id).show();
      $('#re_content_update_'+reply_id).remove();
      $('.reply_cancel').remove();
      $('.reply_ok').remove();
      $('#reply_update_'+reply_id).css('display', '');
      $('#reply_delete_'+reply_id).css('display', '');
    });
  //수정 확인 버튼
    $('.reply_ok').click(function(){
      text = $('#re_content_update_'+reply_id).val();
      $.ajax({
        method: "post",
        url: "/reply_update",
        data: {re_id: reply_id, content: text},
        success: function(){
          $('#re_content_'+reply_id).text(text);
          $('#re_content_'+reply_id).show();
          $('#re_content_update_'+reply_id).remove();
          $('.reply_cancel').remove();
          $('.reply_ok').remove();
          $('#reply_update_'+reply_id).css('display', '');
          $('#reply_delete_'+reply_id).css('display', '');
        }
      })
    })
  });

});
