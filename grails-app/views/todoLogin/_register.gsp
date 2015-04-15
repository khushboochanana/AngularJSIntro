
<div class="panel panel-default inner">
    <div class="panel-heading">
        <h3 class="panel-title">Register</h3>
    </div>

    <div class="panel-body" style="padding-left: 47px">
        <g:form class="form" method="post" name="registerForm"  controller="todoLogin" action="register">
            <label>First Name *</label>
           <g:textField name="toDoUser.firstName"/><br><br>
            <label>Last Name *</label>
            <g:textField name="toDoUser.lastName"/><br><br>
            <label>User Name *</label>
            <g:textField name="toDoUser.username"/><br><br>
            <label>Email *</label>
           <g:textField name="toDoUser.email" /><br><br>
            <label >Password *</label>
            <g:passwordField name="toDoUser.password"/><br><br>
            <input type="submit" name="register" value="Register" class="loginButton">
        </g:form>

    </div>
</div>
