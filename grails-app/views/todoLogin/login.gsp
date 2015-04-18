<html>
<head>
    <meta name='layout' content='main'/>
    <title>TODO APPLICATION</title>
    <style type='text/css' media='screen'>
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    .inner {
        width: 340px;
        padding-bottom: 6px;
        margin: 60px auto;
        text-align: left;
        border: 1px solid #aab;
        background-color: #f0f0fa;
        -moz-box-shadow: 2px 2px 2px #eee;
        -webkit-box-shadow: 2px 2px 2px #eee;
        -khtml-box-shadow: 2px 2px 2px #eee;
        box-shadow: 2px 2px 2px #eee;
    }

    #login .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #f7f7ff;
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;
        font-weight: bold;
    }

    #login .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 4px 0 3px 0;
        padding-left: 105px;
        margin-bottom: 20px;
        height: 1%;
    }

    #login .inner .cssform input[type='text'] {
        width: 120px;
    }

    #login .inner .cssform label {
        font-weight: bold;
        float: left;
        text-align: right;
        margin-left: -105px;
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }

    #login #remember_me_holder {
        padding-left: 120px;
    }

    #login #submit {
        margin-left: 15px;
    }

    #login #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 200px
    }

    #login .inner .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #login .inner .text_ {
        width: 120px;
    }

    #login .inner .chk {
        height: 12px;
    }
    </style>

    <script>
        $(document).ready(function () {
            alert("hiii");

            $(document).on("click", ".loginForm", function () {
                alert("hiii");
//                alert($(".loginForm").attr("data-ajax-url"));
                var username = document.getElementById("j_password").value;
                var password = document.getElementById("j_username").value;
                alert(username);
               alert(password);
                $.ajax({
                    url: "http://localhost:8080/api/login",
                    type:'POST',
                    data: {
                        username: username,
                        password: password
                    },
                    success: function (data) {
                        alert();
                        alert(JSON.stringify(data))
                    },
                    error: function () {
                        alert("Some Error Occurred")
                    }
                });
                alert("inside")
            });
        })
        ;
        //        console.log(jQuery.fn.jquery)
    </script>
    <asset:javascript src="angular-1.2.16.js"/>

</head>

<body>
<div class="row">
    <div class="col-md-6">
        <div id='login'>
            <div class='inner'>
                <div class='fheader'>Please Login</div>

                <g:if test='${flash.message}'>
                    <div class='login_message'>${flash.message}</div>

                </g:if>
            %{--<form data-ajax-url="http://localhost:8080/rest/login" class="loginForm">--}%
            %{--<label for='j_username'>UserName:</label>--}%
            %{--<input type='text' class='text_' name='j_username' id='j_username'/>--}%
            %{--<label for='j_password'>Password:</label>--}%
            %{--<input type='password' class='text_' name='j_password' id='j_password'/>--}%
            %{--<input type='submit' id="submit" value='Login'/>--}%
            %{--</form>--}%
                ${postUrl}
                <form action='${postUrl}' method='POST' class='loginForm cssform' id='loginForm' autocomplete='off'>
                    <p>
                        <label for='j_username'>UserName:</label>
                        <input type='text' class='text_' name='j_username' id='j_username'/>
                    </p>

                    <p>
                        <label for='j_password'>Password:</label>
                        <input type='password' class='text_' name='j_password' id='j_password'/>
                    </p>

                    <p id="remember_me_holder">
                        <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                               <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <label for='remember_me'>remember me</label>
                    </p>

                    <p>
                        <input type='submit' value='Login'/>
                    </p>
                </form>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <g:render template="/todoLogin/register"/>

    </div>

</div>
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
