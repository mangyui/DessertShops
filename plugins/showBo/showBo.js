var Showbo = {

};
Showbo.IsIE = !!document.all;
Showbo.IEVersion = (function () {
    if (!Showbo.IsIE) return -1;
    try {
        return parseFloat(/msie ([\d\.]+)/i.exec(navigator.userAgent)[1]);
    } catch (e) {
        return -1;
    }
})();
Showbo.$ = function (Id, isFrame) {
    var o;
    if ("string" == typeof (Id)) o = document.getElementById(Id);
    else if ("object" == typeof (Id)) o = Id;
    else return null;
    return isFrame ? (Showbo.IsIE ? frames[Id] : o.contentWindow) : o;
}
Showbo.isStrict = document.compatMode == "CSS1Compat";
Showbo.BodyScale = {
    x: 0,
    y: 0,
    tx: 0,
    ty: 0
};
Showbo.getClientHeight = function () {
    return Showbo.isStrict ? document.documentElement.clientHeight : document.body.clientHeight;
}
Showbo.getScrollHeight = function () {
    var h = !Showbo.isStrict ? document.body.scrollHeight : document.documentElement.scrollHeight;
    return Math.max(h, this.getClientHeight());
}
Showbo.getHeight = function (full) {
    return full ? this.getScrollHeight() : this.getClientHeight();
}
Showbo.getClientWidth = function () {
    return Showbo.isStrict ? document.documentElement.clientWidth : document.body.clientWidth;
}
Showbo.getScrollWidth = function () {
    var w = !Showbo.isStrict ? document.body.scrollWidth : document.documentElement.scrollWidth;
    return Math.max(w, this.getClientWidth());
}
Showbo.getWidth = function (full) {
    return full ? this.getScrollWidth() : this.getClientWidth();
}
Showbo.initBodyScale = function () {
    Showbo.BodyScale.x = Showbo.getWidth(false);
    Showbo.BodyScale.y = Showbo.getHeight(false);
    Showbo.BodyScale.tx = Showbo.getWidth(true);
    Showbo.BodyScale.ty = Showbo.getHeight(true);
}
Showbo.Msg = {
    INFO: 'info',
    ERROR: 'error',
    WARNING: 'warning',
    IsInit: false,
    timer: null,
    dvTitle: null,
    dvCT: null,
    dvBottom: null,
    dvBtns: null,
    lightBox: null,
    dvMsgBox: null,
    defaultWidth: 400,
    moveProcessbar: function () {
        var o = Showbo.$('dvProcessbar'),
            w = o.style.width;
        if (w == '') w = 20;
        else {
            w = parseInt(w) + 20;
            if (w > 100) w = 0;
        }
        o.style.width = w + '%';
    },
    InitMsg: function (width) {
        var ifStr = '<iframe src="javascript:false" mce_src="javascript:false" style="position:absolute; visibility:inherit; top:0px;left:0px;width:100%; height:100%; z-index:-1;' +
            'filter=\'progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)\';"></iframe>',
            html = '<div class="top"><div class="right"><div class="title" id="dvMsgTitle"></div></div></div>' +
            '<div class="body"><div class="right"><div class="ct" id="dvMsgCT"></div></div></div>' +
            '<div class="bottom" id="dvMsgBottom"><div class="right"><div class="Sbtn" id="dvMsgBtns"></div></div></div>';
        this.dvMsgBox = document.createElement("div");
        this.dvMsgBox.id = "dvMsgBox";
        this.dvMsgBox.innerHTML += html;
        document.body.appendChild(this.dvMsgBox);
        this.lightBox = document.createElement("div");
        this.lightBox.id = "ShowBolightBox";
        document.body.appendChild(this.lightBox);

        if (Showbo.IsIE && Showbo.IEVersion < 7) {
            this.lightBox.innerHTML += ifStr;
            this.dvMsgBox.innerHTML += ifStr;
        }
        this.dvBottom = Showbo.$('dvMsgBottom');
        this.dvBtns = Showbo.$('dvMsgBtns');
        this.dvCT = Showbo.$('dvMsgCT');
        this.dvTitle = Showbo.$('dvMsgTitle');
        this.IsInit = true;
    },
    checkDOMLast: function () {
        if (document.body.lastChild != this.lightBox) {
            document.body.appendChild(this.dvMsgBox);
            document.body.appendChild(this.lightBox);
        }
    },
    createBtn: function (p, v, fn) {
        var btn = document.createElement("input");
        btn.type = "button";
        btn.className = 'Sbtn';
        btn.value = v;
        if (p == "yes")
            btn.id = "YesBtn";
        btn.onmouseover = function () {
            this.className = 'btnfocus';
        }
        btn.onmouseout = function () {
            this.className = 'Sbtn';
        }
        if (v == "付款")
            btn.onclick = function (e) {
                var orderid = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("span").eq(0).text();
                var orderpr = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("span").eq(1).text();
                var pwd = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("#msg_txtInput").val();
                $.post("/Handlers/ChangeMoney.ashx", { type: "-",pwd:pwd, orderid: orderid,price:orderpr }, function (data) {
                    if (data == "ok") {
                        message("success", "付款成功！", 2000);
                        setTimeout(function () {
                            window.location.href = "/user.aspx";
                        }, 1500);
                    }
                    else if (data == "errorpwd")
                        message("error", "密码错误", 3000);
                    else if (data == "errormoney")
                        message("error", "余额不足", 2000);
                    else if (data == "errorcustomer")
                        message("error", "请先登录", 2000);
                    else
                        message("error", "付款失败！", 3000);
                })
            }
        else if (v == "充值")
            btn.onclick = function (e) {
                var money = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("span").eq(1).text();
                var pwd = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("#msg_txtInput").val();
                $.post("/Handlers/ChangeMoney.ashx", { type: "+", pwd: pwd, addmoney: money }, function (data) {
                    if (data == "ok") {
                        message("success", "充值成功！", 2000);
                        setTimeout(function () {
                            window.location.href = "/user.aspx";
                        }, 1500);
                    }
                    else if (data == "errorpwd")
                        message("error", "密码错误", 3000);
                    else if (data == "errorcustomer")
                        message("error", "请先登录", 2000);
                    else
                        message("error", "充值失败！", 3000);
                })
            }
        else if (v == "收货")
            btn.onclick = function (e) {
                var orderid = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("span").eq(0).text();
                $.post("/Handlers/Oporder.ashx", { type: "shouhuo",orderid: orderid }, function (data) {
                    if (data == "ok") {
                        message("success", "收货成功！", 2000);
                        setTimeout(function () {
                            window.location.href = "/user.aspx";
                        }, 1500);
                    }
                    else if (data == "errorcustomer")
                        message("error", "请先登录", 2000);
                    else
                        message("error", "收货失败！", 3000);
                })
            }
        else if (v == "评价")
            btn.onclick = function (e) {
                var orderid = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("span").eq(0).text();
                //var pwd = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("#msg_txtInput").val();
                $.post("/Handlers/Oporder.ashx", { type: "pingjia", orderid: orderid }, function (data) {
                    if (data == "ok") {
                        message("success", "评价成功！", 2000);
                        setTimeout(function () {
                            window.location.href = "/user.aspx";
                        }, 1500);
                    }
                    else if (data == "errorcustomer")
                        message("error", "请先登录", 2000);
                    else
                        message("error", "评价失败！", 3000);
                })
            }
        else if (v == "删除")
            btn.onclick = function (e) {
                var orderid = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("span").eq(0).text();
                //var pwd = $(this).parents("#dvMsgBox").find("#dvMsgCT").find("#msg_txtInput").val();
                $.post("/Handlers/Oporder.ashx", { type: "delete", orderid: orderid }, function (data) {
                    if (data == "ok") {
                        message("success", "删除成功！", 2000);
                        setTimeout(function () {
                            window.location.href = "/user.aspx";
                        }, 1500);
                    }
                    else if (data == "errorcustomer")
                        message("error", "请先登录", 2000);
                    else
                        message("error", "删除失败！", 3000);
                })
            }
        else
            btn.onclick = function () {
                Showbo.Msg.hide();
                if (fn) fn(p);
            }
        return btn;
    },
    alert: function (msg) {
        this.show({
            buttons: {
                yes: '确认'
            },
            msg: msg,
            title: '消息'
        });
    },
    confirm: function (msg, fn) {
        this.show({
            buttons: {
                yes: '确认',
                no: '取消'
            },
            msg: msg,
            title: '提示',
            fn: fn
        });
    },
    prompt: function (labelWord, defaultValue, txtId, fn) {
        if (!labelWord) labelWord = '请输入：';
        if (!defaultValue) defaultValue = "";
        if (!txtId) txtId = "msg_txtInput";
        this.show({
            title: '输入提示',
            msg: labelWord + '<br/>' + '<input type="text" id="' + txtId + '" style="width:200px" value="' + defaultValue + '"/>',
            buttons: {
                yes: '确认',
                no: '取消'
            },
            fn: fn
        });
    },
    todele: function (num, labelWord, defaultValue, txtId, fn) {
        if (!labelWord) labelWord = '请';
        if (!defaultValue) defaultValue = "请";
        if (!txtId) txtId = "msg_txtInput";
        this.show({
            title: '删除订单',
            msg: '订单号：<span>' + num + '</span><br/>总金额：<span>' + labelWord + '</span>$<br/>' ,
            buttons: {
                yes: '删除',
                no: '取消'
            },
            fn: fn
        });
    },
    topwd: function (num, labelWord, defaultValue, txtId, fn) {
        if (!labelWord) labelWord = '请输入密码';
        if (!defaultValue) defaultValue = "请输入密码";
        if (!txtId) txtId = "msg_txtInput";
        this.show({
            title: '付款',
            msg: '订单号：<span>' + num + '</span><br/>总金额：<span>' + labelWord + '</span>$<br/>' + '<input type="password" id="' + txtId + '" style="width:200px  text-align:center;" placeholder="' + defaultValue + '"/>',
            buttons: {
                yes: '付款',
                no: '取消'
            },
            fn: fn
        });
    },
    tochong: function (num, labelWord, defaultValue, txtId, fn) {
        if (!labelWord) labelWord = '请输入密码';
        if (!defaultValue) defaultValue = "请输入密码";
        if (!txtId) txtId = "msg_txtInput";
        this.show({
            title: '充值',
            msg: '用户名：<span>' + num + '</span><br/>充值金额：<span>' + labelWord + '</span>$<br/>' + '<input type="password" id="' + txtId + '" style="width:200px  text-align:center;" placeholder="' + defaultValue + '"/>',
            buttons: {
                yes: '充值',
                no: '取消'
            },
            fn: fn
        });
    },
    toshou: function (num, labelWord, defaultValue, txtId, fn) {
        if (!labelWord) labelWord = '请输入密码';
        if (!defaultValue) defaultValue = "请输入密码";
        if (!txtId) txtId = "msg_txtInput";
        this.show({
            title: '收货',
            msg: '订单号：<span>' + num + '</span><br/>总金额：<span>' + labelWord + '</span>$<br/>',
            buttons: {
                yes: '收货',
                no: '取消'
            },
            fn: fn
        });
    },
   toping: function (num, labelWord, defaultValue, txtId, fn) {
        if (!labelWord) labelWord = '未知';
        if (!defaultValue) defaultValue = "请输入对这次消费的评价";
        if (!txtId) txtId = "msg_txtInput";
        this.show({
            title: '评价',
            msg: '订单号：<span>' + num + '</span><br/>总金额：<span>' + labelWord + '</span>$<br/>' + '<textarea id="' + txtId + '" style="width:300px" placeholder="' + defaultValue + '"></textarea>',
            buttons: {
                yes: '评价',
                no: '取消'
            },
            fn: fn
        });
    },
    wait: function (msg, title) {
        if (!msg) msg = '正在处理..';
        this.show({
            title: title,
            msg: msg,
            wait: true
        });
    },
    show: function (cfg) {
        if (!cfg) throw ("没有指定配置文件！");
        if (Showbo.IsIE) window.attachEvent("onresize", this.onResize);
        else window.addEventListener("resize", this.onResize, false);
        if (!this.IsInit) this.InitMsg();
        else this.checkDOMLast();
        if (cfg.width) this.defaultWidth = cfg.width;
        this.dvMsgBox.style.width = this.defaultWidth + 'px';
        if (this.timer) {
            clearInterval(this.timer);
            this.timer = null;
        }
        this.dvTitle.innerHTML = '';
        if (cfg.title) this.dvTitle.innerHTML = cfg.title;
        this.dvCT.innerHTML = '';
        if (cfg.wait) {
            if (cfg.msg) this.dvCT.innerHTML = cfg.msg;
            this.dvCT.innerHTML += '<div class="pro"><div class="bg" id="dvProcessbar"></div></div>';
            this.dvBtns.innerHTML = '';
            this.dvBottom.style.height = '10px';
            this.timer = setInterval(function () {
                Showbo.Msg.moveProcessbar();
            }, 1000);
        } else {
            if (!cfg.buttons || (!cfg.buttons.yes && !cfg.buttons.no)) {
                cfg.buttons = {
                    yes: '确定'
                };
            }
            if (cfg.icon) this.dvCT.innerHTML = '<div class="icon ' + cfg.icon + '"></div>';
            if (cfg.msg) this.dvCT.innerHTML += cfg.msg + '<div class="clear"></div>';
            this.dvBottom.style.height = '45px';
            this.dvBtns.innerHTML = '<div class="height"></div>';
            if (cfg.buttons.yes) {
                this.dvBtns.appendChild(this.createBtn('yes', cfg.buttons.yes, cfg.fn));
                if (cfg.buttons.no) this.dvBtns.appendChild(document.createTextNode('　'));
            }
            if (cfg.buttons.no) this.dvBtns.appendChild(this.createBtn('no', cfg.buttons.no, cfg.fn));
        }
        Showbo.initBodyScale();
        this.dvMsgBox.style.display = 'block';
        this.lightBox.style.display = 'block';
        this.onResize(false);
    },
    hide: function () {
        this.dvMsgBox.style.display = 'none';
        this.lightBox.style.display = 'none';
        if (this.timer) {
            clearInterval(this.timer);
            this.timer = null;
        }
        if (Showbo.IsIE) window.detachEvent('onresize', this.onResize);
        else window.removeEventListener('resize', this.onResize, false);
    },
    onResize: function (isResize) {
        if (isResize) Showbo.initBodyScale();
        Showbo.Msg.lightBox.style.width = $(window).width() + 'px'; //Showbo.BodyScale.tx + 'px';
        Showbo.Msg.lightBox.style.height = $(window).height() + 'px';
        Showbo.Msg.dvMsgBox.style.top = Math.floor((document.documentElement.clientHeight - Showbo.Msg.dvMsgBox.offsetWidth) / 2) + 'px';
        Showbo.Msg.dvMsgBox.style.left = Math.floor((document.documentElement.clientWidth - Showbo.Msg.dvMsgBox.offsetWidth) / 2) + 'px';
    }
}