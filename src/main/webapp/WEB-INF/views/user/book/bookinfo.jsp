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
<body>
<div style="padding: 20px 20px 20px 20px">
    <div class="row">
        <div class="col-xs-4 col-md-4">
            <img src="/view?fileName=${card.title}&fileType=IMAGE&series=${card.series}&bookversion=${card.bookversion}&pageNo=thumbnail" style="width: 100%; height: 100%">
        </div>
        <div class="col-xs-8 col-md-8 grayADF f12">
            <div class="row">
                <br>
                <div class="col-xs-9">${card.title}</div>
                <div class="col-xs-3" align="left">
                  <c:choose>
                    <c:when test="${card.likestate eq 'O'}">
                      <figure class="like" name="likeFigure" title="즐겨찾기 해제"></figure>
                    </c:when>
                    <c:otherwise>
                      <figure class="nolike" name="likeFigure" title="즐겨찾기 추가"></figure>
                    </c:otherwise>
                  </c:choose>
                </div>
            </div>
            <div class="row col-xs-12"><span class="grayMF">지은이/출판사</span> ${card.username}/${card.pubcompany}</div>
            <div class="row col-xs-12"><span class="grayMF">카테고리</span> ${card.bookcategory}</div>
            <div class="row col-xs-12"><span class="grayMF">등록한날</span> <span class="blackF">${card.userregdate}</span></div>
            <div class="row">
                <div class="col-xs-11" align="right" >
                   <span class="grayADF">
	                  <c:choose>
	                    <c:when test="${card.continuepage == null}">0</c:when>
	                    <c:otherwise>${card.continuepage}</c:otherwise>
	                  </c:choose> / ${card.totalpage}
                   </span>
                </div>
            </div>
            <div class="row" align="center">
              <br>
              <button class="btn btn-read" onclick="$('#readForm').submit();">처음부터읽기</button>
              <button class="btn btn-read" onclick="$('input[name=isContinue]').attr('value', true);$('#readForm').submit();$('input[name=isContinue]').attr('value', false);">이어읽기</button>
              
            </div>
        </div>
    </div>
    <br>
    <div class="row" align="center">
        <textarea class="blackF" style="width:95%; resize: none; border-right: hidden; border-left: hidden;" rows="5" readonly>${card.overview}</textarea>
    </div>
    <div class="row" align="right" style="padding-right: 20px">
        <a class="readReview" href="/user/book/review?bookno=${card.bookno}" title="등록 완료시 평균 평점 출력해줌" style="text-decoration: underline;" data-title="Review">평점 등록</a>
    </div>
    <div class="row" align="center">
        <button class="btn btn-default" data-dismiss="modal">닫기</button>
    </div>
</div>

<form id="bookmarkForm" action="">
	<input type="hidden" name="cardno" value="${card.cardno}">
	<input type="hidden" name="bookmark" value="">
</form>
<form id="readForm" action="/user/book/read" method="post" target="_blank">
   	<input type="hidden" name="bookno" value="${card.bookno}">
   	<input type="hidden" name="cardno" value="${card.cardno}">
   	<input type="hidden" name="isContinue" value="">
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
	$('figure[name=likeFigure]').on('click', function(){
		var toggleName = $(this).attr('class');
		if(toggleName == 'like'){
			$('input[name=bookmark]').attr('value', 'false');
			$(this).removeClass('like');
			$(this).addClass('nolike');		
		}else{
			$('input[name=bookmark]').attr('value', 'true');
			$(this).removeClass('nolike');
			$(this).addClass('like');		
		}
		var formdata = $('#bookmarkForm').serialize();
	    $.ajax({
           url : 'bookmark',
           type : 'POST',
           data : formdata,
           success : function() {
             location.reload();
           }
	    });
	});
	
	$('.readReview').on('click', function(event){
       event.preventDefault();
       $(this).attr('data-dismiss', 'modal');
        return $(this).ekkoLightbox();
    });
</script>

</body>
</html>