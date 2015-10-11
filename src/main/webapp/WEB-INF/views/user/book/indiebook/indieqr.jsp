<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
<meta charset="UTF-8">
<title>Code Register</title>

   <!-- Bootstrap -->
    <link href="/resources/usertemplate/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/usertemplate/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/usertemplate/css/animate.css">
    <link href="/resources/usertemplate/css/prettyPhoto.css" rel="stylesheet">
    <link href="/resources/usertemplate/css/generalstyle.css" rel="stylesheet"/>
    <link href="/resources/usertemplate/css/custom.css" rel="stylesheet"/>
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    <link href="/resources/lightbox-master/dist/ekko-lightbox.min.css" rel="stylesheet">
    
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    
    <script src="/resources/js/qrcode-generator/qrcode.js"></script>
    <script src="/resources/js/qrcode-generator/qrcode.min.js"></script>
</head>

<body style="overflow: hidden;">
<input id="bookno" type="hidden" value="${bookno}">


<div id="test" style="padding: 20px" align="center"></div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/usertemplate/js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.min.js"></script>

<!--common script for all pages-->
<!-- 이것들 있어야 light box해도 화면 안 움직임(3개) -->
<script src="/resources/usertemplate/js/bootstrap.min.js"></script>
<!--  -->
<script type="text/javascript">
var qrcode = new QRCode("test", {
    text: "bookno="+$("#bookno").val(),
    width: 128,
    height: 128,
    colorDark : "#999999",
    colorLight : "#ffffff",
    correctLevel : QRCode.CorrectLevel.H
});
</script>


</body>
</html>