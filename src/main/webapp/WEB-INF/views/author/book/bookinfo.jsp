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
    <link href="/resources/usertemplate/css/style.css" rel="stylesheet"/>
    <link href="/resources/usertemplate/css/custom.css" rel="stylesheet"/>
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    <link href="/resources/lightbox-master/dist/ekko-lightbox.min.css" rel="stylesheet">
    
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  
</head>
<body>
<div style="padding: 20px 20px 20px 20px">
    <div class="row">
        <div class="col-xs-4 col-md-4">
        	<c:choose>
                <c:when test="${book.convertstate eq '변환됨'}">
	                <img src="/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=thumbnail" style="width:100%;">
	            </c:when>
	            <c:when test="${book.convertstate eq '변환대기'}">
	                <img src="/resources/usertemplate/images/ready.png" style="width:100%;">
	            </c:when>
	            <c:when test="${book.convertstate eq '변환안됨'}">
	                <img src="/resources/usertemplate/images/forbid.png" style="width:100%;">
	            </c:when>
            </c:choose>
        </div>
        <div class="col-xs-8 col-md-8 grayADF f12">
            <div class="row">
                <br>
                <div class="col-xs-9 f16 b">${book.title}</div>
            </div>
            <div class="row col-xs-12"><span class="grayMF">지은이/출판사</span> ${book.username}/${book.pubcompany}</div>
            <div class="row col-xs-12"><span class="grayMF">카테고리</span> ${book.bookcategory}</div>
            <div class="row col-xs-12"><span class="grayMF">총 페이지</span> ${book.totalpage}</div>
            <div class="row col-xs-12"><span class="grayMF">판매량</span> ${book.sellcnt}</div>
            <div class="row col-xs-12"><span class="grayMF">평점/신고</span> ${book.starpoint}/
            	<c:choose>
				    <c:when test="${book.reportcnt > 0}">
				      <a class="reportView currBookno" style="color: red; font-size: 14px" name="${book.bookno}" data-title="Report Read" data-toggle="lightbox">
						<strong>${book.reportcnt}</strong></a>
				    </c:when>
				    <c:otherwise>${book.reportcnt}</c:otherwise>
				</c:choose>
            </div>
            <div class="row col-xs-12"><span class="grayMF">등록한날</span> <span class="blackF">${book.applydate}</span></div>
            <div class="row" align="right">
            	<div class="col-xs-11" align="right" >
                   <button class="btn btn-read" onclick="$('#readForm').submit();">책보기</button>
                </div>
              <br>
              
            </div>
        </div>
    </div>
    <br>
    <div class="row" align="center">
        <textarea class="blackF" style="width:95%; resize: none; border-right: hidden; border-left: hidden;" rows="5" readonly>${book.overview}</textarea>
    </div>
    <div class="row" align="right" style="padding-right: 20px">
        <a class="readReview" href="/user/book/review?bookno=${book.bookno}" title="등록 완료시 평균 평점 출력해줌" style="text-decoration: underline;" data-title="Review">평점 보기</a>
    </div>
    <div class="row" align="center">
        <button class="btn btn-default" data-dismiss="modal">닫기</button>
    </div>
</div>

<form id="readForm" action="/author/book/read" method="post" target="_blank">
   	<input type="hidden" name="bookno" value="${book.bookno}">
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
	<!--  -->

<script type="text/javascript">
	
	$('.readReview').on('click', function(event){
       event.preventDefault();
       $(this).attr('data-dismiss', 'modal');
        return $(this).ekkoLightbox();
    });
</script>

</body>
</html>