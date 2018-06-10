function message(type, msg, time) {
    //构造一个包含message类型和消息的jq对象
    var $message = $("<div class='ivu-message-notice' style='height: 50px;'>\
                                     <div class='ivu-message-notice-content'>\
                                         <div class='ivu-message-notice-content-text'>\
                                             <div class='ivu-message-custom-content ivu-message-" + type + "'>\
                                                 <i class='ivu-icon ivu-icon-information-circled'></i>\
                                                 <span>" + msg + "</span>\
                                             </div>\
                                         </div>\
                                     </div>\
                                 </div>");

    //  var $message = $("<div style='height: 50px;'>"+msg+"</div>");

    //在父类底部添加
    $(".ivu-message").append($message);
    //在设定时间处淡出
    $message.fadeOut(time, function() {
        $(this).remove();
    })
};