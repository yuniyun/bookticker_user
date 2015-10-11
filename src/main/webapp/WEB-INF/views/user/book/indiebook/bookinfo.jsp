<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CAN·READ: Shelf</title>

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
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  
</head>
<style>
	#addMybook{
		color: #91bfe6;
	}
	#addMybook:hover{
		color: #286090;
	}
</style>

<body>
    <table class="grayDF" width="98%" style="margin: 10px 10px 10px 10px">
        <tr>
            <td style="width:120px; height: 180px;">
                <img src="/view?fileName=${card.title}&fileType=IMAGE&series=${card.series}&bookversion=${card.bookversion}&pageNo=thumbnail" style="width:100px;">
            </td>
            <td  colspan="3" width="100%" style="padding-left: 20px">
                <div class="row">
                    <div class="col-sm-6 f20 b blueF">${card.title} <span class="f12 grayMF">${card.username}</span></div>
                </div>
                <hr style="margin-top: 3px; margin-bottom: 3px">
                               
                
                <div class="row">
                    <div class="col-sm-6 f12 grayMF"><i class="fa fa-thumbs-o-up fa-2x" style="color: #91bfe6"></i> <b>추천</b> 12000+ | <b>즐겨찾기</b> ${card.sellcnt}</div>
                    <div class="col-sm-6 f12 grayMF b" style="text-align: right;">
                      <select>
                        <c:forEach items="${list}" var="ver">
                          <option value="${ver.bookno}">${ver.bookversion}</option>
                        </c:forEach>
                      </select><a href="">바로가기</a>
                   </div>
                </div>
                <div class="row"></div>
                <div class="row"></div>
            </td>
        </tr>
        <tr>
        	<td colspan="3" width="100%" style="padding-left: 0px;">
            	<div class="row">
                    <div class="col-sm-12">
                      <div style="width: 100%; border: 1px #DDD solid; min-height: 100px; padding: 5px 10px 10px 10px;">
                      	<span class="blueF">책소개></span>
                      	<p style="width:100%; resize: none;">${card.overview}</p>
                      </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <br><br>
    <table class="grayDF" width="98%" style="margin: 10px 10px 10px 10px; border-collapse:collapse;">
        <tr class="grayALBG">
            <th width="3%" style="text-align: center"></th>
            <th width="55%" style="text-align: center">소제목</th>
            <th width="18%" style="text-align: center">날짜</th>
            <th width="12%" style="text-align: center">페이지</th>
            <th width="12%" style="text-align: center">조회수</th>
        </tr>
        <c:forEach items="${list}" var="ver">
	        <tr style="border-bottom: 1pt solid #DDDDDD;">
	            <td style="text-align: center" class="redF">●</td>
	            <td style="padding-left: 10px">
	            	<a class="cursor-p" onclick="$('input[name=bookno]').attr('value', '${ver.bookno}'); $('#readForm').submit();">${ver.title}</a>
	            	
	            </td>
	            <td style="text-align: center">${ver.applydate}</td>
	            <td style="text-align: center">${ver.totalpage}</td>
	            <td style="text-align: center">1231</td>
	        </tr>
        </c:forEach>
    </table>
    <form id="postForm" action="addMybook" method="post">
    	<input type="hidden" name="bookno" value="${card.bookno}">
    </form>
    <form id="readForm" action="/user/book/read" method="post" target="_blank">
    	<input type="hidden" name="bookno" value="">
    	<input type="hidden" name="cardno" value="0">
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/usertemplate/js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/usertemplate/js/jquery.prettyPhoto.js"></script>
<script src="/resources/usertemplate/js/jquery.isotope.min.js"></script>
<script src="/resources/usertemplate/js/wow.min.js"></script>
<script src="/resources/usertemplate/js/functions.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.min.js"></script>

<!--common script for all pages-->
<!-- 이것들 있어야 light box해도 화면 안 움직임(3개) -->
<script src="/resources/usertemplate/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$('#addMybook').on('click', function(){
			$('#postForm').submit();
		});
	</script>
</body>
</html>