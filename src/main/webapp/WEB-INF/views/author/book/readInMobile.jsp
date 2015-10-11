<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8" />

		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<title>Read</title>
		<!-- Bootstrap -->
    <link href="/resources/usertemplate/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/usertemplate/css/font-awesome.min.css">
    <link href="/resources/usertemplate/css/style.css" rel="stylesheet"/>
    <link href="/resources/usertemplate/css/custom.css" rel="stylesheet"/>
    
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    <link href="/resources/lightbox-master/dist/ekko-lightbox.min.css" rel="stylesheet">
    <link href="/resources/usertemplate/css/wheel-menu.css" rel="stylesheet"/>
    
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<style>
.slide-left-in{
	-webkit-animation: slideLeftIn;
	-webkit-animation-duration: 1000ms;
	-webkit-animation-fill-mode: both;			
}

@-webkit-keyframes slideLeftIn{
	from{
		-webkit-transform: translateX(0%) scale(0.3);
		
		opacity: 0.1;
		z-index: 2;		
	}
	
	to{
		-webkit-transform: translateX(0%)  scale(1);		
		opacity: 1;
	}
}

.slide-left-back-in{
	-webkit-animation: slideLeftBackIn;
	-webkit-animation-duration: 1000ms;
	-webkit-animation-fill-mode: both;			
}

@-webkit-keyframes slideLeftBackIn{
	from{
		-webkit-transform: translateX(0%) scale(0.3);
		opacity: 1;
		z-index: 2;		
	}
	
	to{
		-webkit-transform: translateX(0%) scale(1);		
		opacity: 1;
	}
}



.slide-left-out{
	-webkit-animation: slideLeftOut;
	-webkit-animation-duration: 1000ms;
	-webkit-animation-fill-mode: both;		
}

@-webkit-keyframes slideLeftOut{
	0%{
		opacity: 1;
		-webkit-transform: translateX(0%) rotateY(10deg);
		z-index:1;
	}
		
	80%{
		opacity:0.5;
		-webkit-transform: translateX(-100%)  rotateY(90deg);
		z-index:1;		
	}
	
	100%{
		opacity:0;
		-webkit-transform: translateX(0%)  rotateY(0deg) scale(0.2);
		z-index:1;		
	}
	
}

.slide-left-back-out{
	-webkit-animation: slideLeftBackOut;
	-webkit-animation-duration: 1000ms;
	-webkit-animation-fill-mode: both;		
}

@-webkit-keyframes slideLeftBackOut{
	0%{
		opacity: 1;
		-webkit-transform: translateX(0%) rotateY(-10deg);
		z-index:1;
	}
		
	80%{
		opacity:0.5;
		-webkit-transform: translateX(100%)  rotateY(-90deg);
		z-index:1;		
	}
	
	100%{
		opacity:0;
		-webkit-transform: translateX(0%)  rotateY(0deg) scale(0.2);
		z-index:1;		
	}
}


.endImg{
	-webkit-transition-duration:1000ms;
	-webkit-animation: endImgFrames;
}


#gallery {
	width: 900px;
	height:600px;
	margin: 0 auto;
	margin-top: 15%;
	position: relative;
	-webkit-perspective: 600px;
	-webkit-transform-style: preserve-3d;	
}	

#gallery img{
	width: 900px;
	position: absolute;
	display: none;
}

#gallery img.currentImg{
	display:block;
}
</style>		
</head>

	<body>
		<figure id="blockDisplay" class="blockFigure hide menubarActivation"></figure>
		<div style="margin-left: 10px;">
			<div class="grayMF 12f ">
				[${book.title}-${book.username}]
			</div>
			<div class="col-xs-12 wrapper">
				<div class="col-xs-2 container">
					<img id="powerbutton" class="menubarActivation mainButton small" title="책갈피" src="/resources/usertemplate/images/bookmarkColor/mark2.png"/>
					<div class="menubar icon"><img class="bookmarkColor" id="ffe4e9" src="/resources/usertemplate/images/bookmarkColor/pink.png"/></div>
					<div class="menubar icon"><img class="bookmarkColor" id="d5d9f4" src="/resources/usertemplate/images/bookmarkColor/purple.png"/></div>
					<div class="menubar icon"><img class="bookmarkColor" id="cce8ef" src="/resources/usertemplate/images/bookmarkColor/blue.png"/></div>
					<div class="menubar icon"><img class="bookmarkColor" id="ade7bc" src="/resources/usertemplate/images/bookmarkColor/green.png"/></div>
					<div class="menubar icon"><img class="bookmarkColor" id="f9eec6" src="/resources/usertemplate/images/bookmarkColor/yellow.png"/></div>
					<div class="menubar icon"><img onclick="javascript:lightbox(event, ${book.bookno})" src="/resources/usertemplate/images/bookmarkColor/list.png"/></div>
					
				</div>
			</div>
			<div class="col-xs-12 grayDF" style="text-align: right; margin-top: 10px">
		        <button style="width: 100px;height: 100px; border-radius: 50%; border:none; background-color: skyblue;" align="center">
			    	<input id="pagebox" type="text" style="width: 90px; text-align: center; border: none; background-color: skyblue; color: white;font-weight:bold; font-size: 38px;"
			            onKeyPress="if (event.keyCode==13){ movePageFunction($(this).val());event.returnValue=false}" value="1">
		        </button>
		        <span style="font-size: 34px;font-weight:bold; vertical-align: bottom;">         /
					${book.totalpage}
		        </span>
		    </div>
			<div id="gallery">
				<c:forEach items="${list}" var="page" varStatus="status">
                     <img src="/view?path=${page.imgpath}" name="${page.pageno}" id="${page.convertno}"
                       <c:if test="${status.count eq 1}">class="currentImg"</c:if>>
                </c:forEach>
			</div>

			<div style="width: 100%; margin-top: 900px;" align="center">
				<br>
	            <span class="companyInfo">
	              copyright 함박웃음 - 이지윤 이신우<br>
	                        문의 이메일 yuniyun3@naver.com
	                        
	            
	            </span><br><br>
			</div>
		</div>
		<!-- 책갈피 꽂기 위한 form -->
		<form id="bookmarkForm">
		    <input type="hidden" name="convertno" value="">
		    <input type="hidden" name="bookcomment" value="">
		    <input type="hidden" name="addmode" value="책갈피">
	    </form>
	    <input type="hidden" name="grade" value="${book.grade}">
		<c:if test="${book.grade eq '작가'}">
			<input type="hidden" name="cardno" value="${card.cardno}">
			<input type="hidden" name="isContinue" value="${isContinue}">
	    	<input type="hidden" name="continuepage" value="${card.continuepage}">
    	</c:if>
    	<a id="moveAtag"></a>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/usertemplate/js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.min.js"></script>

<!--common script for all pages-->
<!-- 이것들 있어야 light box해도 화면 안 움직임(3개) -->
<script src="/resources/usertemplate/js/bootstrap.min.js"></script>
<!--  -->
<script>

var startX, endX; 

$(document).ready(function() {
	
	$("#gallery").bind("touchstart mousedown" , function (event ){
		
		event.preventDefault();		
		
		var eventObj = checkDevice(event);
		
		startX =  eventObj.pageX;
		
		//alert(eventObj.pageX);
				
		
	});
	
	$("#gallery").bind("touchend mouseup" , function (event ){
		
		event.preventDefault();		
		
		var eventObj =  checkEndDevice(event);
		
		//alert(eventObj.pageX);
				
		endX =  eventObj.pageX;
		
		var gap = startX - endX;
		
		changeImg(gap);
		

	});
	
	$("#gallery").bind("touchmove", function(evnet ) {
		event.preventDefault();
		
		console.log("move");
				
	});
	 
});	
window.onload = function() {
	console.log($('input[name="isContinue"]').attr('value'));
	if($('input[name="isContinue"]').attr('value') == "true"){
	    var continuepage = $('input[name=continuepage]').attr('value');
	    var currPage = $(".currentImg");
	    var targetImg = $('img[name='+continuepage+']');
	    changeImageObj(currPage, targetImg, 100);
	}else{
		$('#pagebox').val($('.currentImg').attr('name'));
	}
	$('input[name="isContinue"]').attr('value', 'false');
	
	//--------------------------------------------page box setting
}

function movePageFunction(wantPage){
	var currPage = $(".currentImg");
	var targetImg = $('img[name='+wantPage+']');
	var movePage = wantPage - currPage.attr('name');
	if(targetImg.length > 0){
		if(movePage != 0) changeImageObj(currPage, targetImg, movePage);
	}else{
		alert("페이지가 존재하지 않습니다.");
	}
};

function checkDevice(event){
	if(event.pageX){
		return event;
	}	
	if(event.originalEvent.targetTouches){
		return event.originalEvent.targetTouches[0];
	}
}

function checkEndDevice(event){
	
	if(event.pageX){
		return event;
	}	
	if(event.originalEvent.changedTouches){
		return event.originalEvent.changedTouches[0];
	}	
}

function changeImg(gap){
	
	var imgs = $("#gallery img");
	var imgObj = imgs.siblings(".currentImg");
	
	var targetImg ;
	if(gap > 0){
		targetImg = imgObj.next();
	}else{
		targetImg = imgObj.prev();
	}
	
	if(targetImg.length > 0){
		changeImageObj(imgObj, targetImg, gap);
	}else{
		alert("페이지가 존재하지 않습니다.");
	}
	
	
}

function changeImageObj(beforeImg, targetImg, gap){
/*
	targetImg.addClass("currentImg");
	beforeImg.removeClass("currentImg");*/
	
	var effectName ="";
	
	if(gap > 0){
		effectName = "slide-left";
	}else{
		effectName = "slide-left-back";
	}

	beforeImg.addClass(effectName +"-out");
	targetImg.addClass("currentImg "+ effectName +"-in");
	targetImg.one("webkitAnimationEnd", function(event ) {
		beforeImg.removeClass("currentImg "+effectName+"-out");
		targetImg.removeClass(effectName+"-in");
	});
	
	
	if($('input[name="isContinue"]').attr('value') == "false" && $('input[name="grade"]').attr('value') == "작가"){
		$.post('updateContinue',{
	        cardno: $('input[name=cardno]').attr('value'),
	        continuepage: targetImg.attr('name')
	    });
		console.log(targetImg.attr('name'));
	}
	$('#pagebox').val(targetImg.attr('name'));
}

//-------------------------------------wheel menu start


$(".bookmarkColor").on('click', function() {
	var color = $(this).attr('id');
	$('input[name=bookcomment]').attr('value', color);
		
	$.post('registerBookmark', $('#bookmarkForm').serialize());
});

function removeAnimation(obj, idxValue){ //아직 적용안함
	return function(){
		obj.removeClass("m"+idxValue+"-out");
		console.log("m"+idxValue+"-out");
	};
}

$('.menubarActivation').on('click', function(){
	menubarActivation();
});

function menubarActivation(){
	var imgs = $("#gallery img");
	var imgObj = imgs.siblings(".currentImg");
	
	$('input[name=convertno]').attr('value', imgObj.attr('id'));
	
	$("#powerbutton").toggleClass('small');
	$("#powerbutton").toggleClass('big');
		
	var idx = 1;
	
	$(".icon").each(function(){
		$(this).toggleClass('m'+idx++);
	});
	$('#blockDisplay').toggleClass('hide');
	$('body').toggleClass('stop-scrolling');
};
//-------------------------------------wheel menu end

function lightbox(event, bookno){
    event.preventDefault();
    menubarActivation();
    var addmode = $('input[name=addmode]').attr('value');
    $('#moveAtag').attr('href', 'listBookmark?bookno='+bookno+'&addmode='+addmode);
    $('#moveAtag').attr('data-title', "Bookmark List");
    return $('#moveAtag').ekkoLightbox();
};

//------------------------------------- device orientation
var count = 1;
init();

function init() {
  if (window.DeviceOrientationEvent) {
    // Listen for the deviceorientation event and handle the raw data
    window.addEventListener('deviceorientation', function orientationFunction(eventData) {
      // gamma is the left-to-right tilt in degrees, where right is positive
      var tiltLR = eventData.gamma;
      
      // call our orientation event handler
      if(Math.round(tiltLR) > 45 || Math.round(tiltLR) < -45){
    	  
    	  if(count == 1){
    	  window.removeEventListener('deviceorientation');
    	  deviceOrientationHandler(tiltLR);
    	  count = 0;
    	  }
      }
      }, false);
  } else {
  }
}
function deviceOrientationHandler(tiltLR) {
  var imgObj = $(".currentImg");
  var targetImg ;
  if(Math.round(tiltLR) > 45 ){
	  targetImg = imgObj.next();
  }else if(Math.round(tiltLR) < -45){
	  targetImg = imgObj.prev();
  }
  if(targetImg.length > 0){
	  changeImageObj(imgObj, targetImg, Math.round(tiltLR));
  }else{
		alert("페이지가 존재하지 않습니다.");
  }
  setTimeout(
      function(){
      	count = 1;
      	init();
      },1000
   );
  
  // Apply the transform to the image
};

//-------------------------------------
    
</script>		
</body>
</html>
