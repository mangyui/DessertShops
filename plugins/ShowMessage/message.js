function message(type, msg, time,e) {
    //构造一个包含message类型和消息的jq对象
    $(".ivu-message").remove();
    $("body").append($("<div class='ivu-message' id='ShowMessage' ></div>"));
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
    if (e) {     //传e参数 表示要获取鼠标当前位置
        var x = e.clientX - ($(document).width()/2);
        var y = e.clientY;
        if (y > 100)
            y -= 50;
        else
            y += 50;
        $("#ShowMessage").css({ "left":x,"top": y });
    }
    else        //未传e参数 不需要鼠标位置，直接默认位置
        $("#ShowMessage").css({ "top": "150px" });
    //在父类底部添加
    var $sm = $("#ShowMessage").append($message);
    //在设定时间处淡出
    setTimeout(function () {
        $sm.fadeOut(1000, function () {
            $(this).remove();
        })
    }, time);

};