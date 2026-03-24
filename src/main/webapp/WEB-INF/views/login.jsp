<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
/* Modal background */
.modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Form box */
.modal-content {
    background: white;
    padding: 20px;
    border-radius: 8px;
    position: relative;
    width: 300px;
}

/* Close button */
.close-btn {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 30px;
    cursor: pointer;
   
</style>

</head>

<body>

<div class="modal" id="loginModal">
    <div class="modal-content">

        <!-- ❌ Close Button -->
        <span class="close-btn" onclick="closeLogin()">&times;</span>

        <form method="post" action="${pageContext.request.contextPath}/login">
            <input type="text" name="username" placeholder="username" /><br><br>
            <input type="password" name="password" placeholder="password" /><br><br>
            <button type="submit">Login</button>
        </form>

    </div>
</div>


</body>
</html>