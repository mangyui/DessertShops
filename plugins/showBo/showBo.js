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
    defaultWidth: 300,
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
        btn.onmouseover = function () {
            this.className = 'btnfocus';
        }
        btn.onmouseout = function () {
            this.className = 'Sbtn';
        }
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
            msg: labelWord+'<br/>' + '<input type="text" id="' + txtId + '" style="width:200px" value="' + defaultValue + '"/>',
            buttons: {
                yes: '确认',
                no: '取消'
            },
            fn: fn
        });
    },
    topwd: function (labelWord, defaultValue, txtId, fn) {
        if (!labelWord) labelWord = '请输入密码';
        if (!defaultValue) defaultValue = "";
        if (!txtId) txtId = "msg_txtInput";
        this.show({
            title: '提示',
            msg: labelWord+'<br/>' + '<input type="text" id="' + txtId + '" style="width:200px" value="' + defaultValue + '"/>',
            buttons: {
                yes: '确认',
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