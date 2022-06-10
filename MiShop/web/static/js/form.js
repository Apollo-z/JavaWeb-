$(document).ready(function() {
    // 手机号码验证
    // jQuery.validator.addMethod("isPhone", function(value, element) {
    //     var length = value.length;
    //     return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));
    // }, "请正确填写您的手机号码。");
    //
    // // 电话号码验证
    // jQuery.validator.addMethod("isTel", function(value, element) {
    //     var tel = /^(\d{3,4}-)?\d{7,8}$/g; // 区号－3、4位 号码－7、8位
    //     return this.optional(element) || (tel.test(value));
    // }, "请正确填写您的电话号码。");
    // 匹配密码，以字母开头，长度在6-12之间，必须包含数字和特殊字符。

    jQuery.validator.addMethod("isPwd", function(value, element) {
        var str = value;
        if (str.length < 6 )
            return false;
        return  str;
    }, "长度最少需要6位");


    $("#register").validate({
        errorElement : 'span',
        errorClass : 'help-block',

        // feedbackIcons: {
        //     valid: 'glyphicon glyphicon-ok',
        //     invalid: 'glyphicon glyphicon-remove',
        //     validating: 'glyphicon glyphicon-refresh'
        // },

        rules : {
            name : "required",
            password : {
                required : true,
                isPwd : true
            },
            repassword : {
                required : true,
                isPwd : true,
                equalTo : "#password2"
            },
            email : {
                required : true,
                email : true
            }

        },
        messages : {
            name : "请输入姓名",
            password : {
                required : "请输入密码",
                minlength : jQuery.format("密码不能小于{0}个字 符")
            },
            repassword : {
                required : "请输入确认密码",
                minlength : "确认密码不能小于5个字符",
                equalTo : "两次输入密码不一致"
            },
            email : {
                required : "请输入Email地址",
                email : "格式错误"
            }
        },
        //自定义错误消息放到哪里
            errorPlacement: function(error, element) {
                //
                // if (element.is(":checkbox")||element.is(":radio")){
                //     error.appendTo(element.parent().parent());
                // }else {
                //     element.after('<span class="form-control-feedback" aria-hidden="true"></span>');
                //     error.insertAfter(element);
                // }
                element.next().remove();
                element.after('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                element.closest('.form-group').append(error);


        },
        //给未通过验证的元素进行处理
        highlight : function(element) {
            $(element).closest('.form-group').addClass('has-error has-feedback');
        },
        //验证通过的处理
        success : function(label) {
            var el=label.closest('.form-group').find("input");
            el.next().remove();
            el.after('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
            label.closest('.form-group').removeClass('has-error').addClass("has-feedback has-success");
            label.remove();

        },

    });
});