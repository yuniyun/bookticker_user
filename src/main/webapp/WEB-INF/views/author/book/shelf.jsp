<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BOOKTICKER: Shelf</title>

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
<style>
#books div div div div img {
    margin-top: 40px;
    width: 90px;
    height: 120px;
}

#books div div div div img:hover {
    width: 120px;
    height: 160px;
    margin-top: 0px;
    transition: 100ms all;
}
.bookOnShelf {
	height: 185px;
    float: left;
    z-index: 10;
    padding-bottom: 25px;
}

</style>
<body>
<header>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target=".navbar-collapse.collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-brand">
                        <a href="shelf"><h1><span>BOOKTICKER</span></h1></a>
                    </div>
                </div>
                <div class="navbar-collapse collapse">
                    <div class="menu">
                        <ul class="nav nav-tabs mainmenu" role="tablist">
                            <li role="presentation"><a href="shelf" class="active">MY SHELF</a></li>
                            <li role="presentation"><a href="author/bestseller">BOOKS</a></li>
                            <li role="presentation"><a id="menu_community" onclick="goCommunity()">COMMUNITY</a></li>
                            <li role="presentation"><a id="menu_notice" onclick="goNotice()">NOTICE</a></li>
                            
                        </ul>
                    </div>
                    <div class="col-xs-12" style="margin-top: -80px; margin-left: 130px; text-align: right">
                            <form action="/logout" method="post">
                               <button class="btn" type="submit">Logout</button>
                   </form></div>
                    
                 
                </div>
            </div>
        </div>
    </nav>
</header>

<div id="breadcrumb">
   <div class="container">   
      <div class="breadcrumb">                     
         <li>home&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&emsp;</li>
         <li><span class="submenuG" id="submenu_all" onclick="javascript:criSettingSubmit(this)">all</span></li>
         <li><span class="submenuG" id="isContinue" lang="true" onclick="javascript:criSettingSubmit(this)">continue</span></li>
         <li><span class="submenuG" id="isBookMark" lang="true" onclick="javascript:criSettingSubmit(this)">bookmark</span></li>
         <li><a class="submenuG bookRead" data-title="Register Book" data-remote="register">register</a></li>
      </div>      
   </div>   
</div>
<!--logo end-->
<form id="criteriaForm" method="get">
    <input type="hidden" name="page" value="${pageMaker.cri.page}">
    <input type="hidden" name="searchType" value="${pageMaker.cri.searchType}">
    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
</form>

<section id="main-slider" style="margin-top: -30px;">
  <div class="carousel slide">
   <div class="carousel-inner">
    <div class="active">
     <div class="container">
      <div class="row slide-margin mainView" style="text-align: center">
       <div class="col-md-1 col-xs-0"></div>
       <div class="col-md-10 col-xs-12">

    <div style="position: relative" id="books">
          
            <div class="row" style="margin-top: 20px">
                <div class="col-md-0 col-xs-2"></div>
                <div class="col-md-8 col-xs-12">
                    <div class="col-xs-12 bookOnShelf"
                         style="float: left; background-image: url(/resources/usertemplate/images/shelf.png); background-size: 100% 100%; position: relative">
                        <c:forEach items="${list1}" var="book" varStatus="status">
                            <div class="col-xs-3" align="center">
                              <a class="bookRead" id="${book.bookno}" href="" data-title="Book information" data-remote="bookinfo?bookno=${book.bookno}">
                                <c:choose>
					                <c:when test="${book.convertstate eq '변환됨'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${status.count-1}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;"  title="${book.title}" src="/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=thumbnail">
						            </c:when>
						            <c:when test="${book.convertstate eq '변환대기'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${status.count-1}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;" title="${book.title}" src="/resources/usertemplate/images/ready.png">
						            </c:when>
						            <c:when test="${book.convertstate eq '변환안됨'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${status.count-1}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;" title="${book.title}" src="/resources/usertemplate/images/forbid.png">
						            </c:when>
					            </c:choose>
                              </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-xs-12 bookOnShelf"
                         style="float: left; background-image: url(/resources/usertemplate/images/shelf.png); background-size: 100% 100%; position: relative">
                        <c:forEach items="${list2}" var="book" varStatus="status">
                            <div class="col-xs-3">
                              <a class="bookRead" id="${book.bookno}" href="" data-title="Book information" data-remote="bookinfo?bookno=${book.bookno}">
                                <c:choose>
					                <c:when test="${book.convertstate eq '변환됨'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${3+status.count}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;"  title="${book.title}" src="/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=thumbnail">
						            </c:when>
						            <c:when test="${book.convertstate eq '변환대기'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${3+status.count}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;" title="${book.title}" src="/resources/usertemplate/images/ready.png">
						            </c:when>
						            <c:when test="${book.convertstate eq '변환안됨'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${3+status.count}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;" title="${book.title}" src="/resources/usertemplate/images/forbid.png">
						            </c:when>
					            </c:choose>
                              </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-xs-12 bookOnShelf"
                         style="float: left; background-image: url(/resources/usertemplate/images/shelf.png); background-size: 100% 100%; position: relative">
                        <c:forEach items="${list3}" var="book" varStatus="status">
                            <div class="col-xs-3">
                              <a class="bookRead" id="${book.bookno}" href="" data-title="Book information"  data-remote="bookinfo?bookno=${book.bookno}">
                                <c:choose>
					                <c:when test="${book.convertstate eq '변환됨'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${7+status.count}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;"  title="${book.title}" src="/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=thumbnail">
						            </c:when>
						            <c:when test="${book.convertstate eq '변환대기'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${7+status.count}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;" title="${book.title}" src="/resources/usertemplate/images/ready.png">
						            </c:when>
						            <c:when test="${book.convertstate eq '변환안됨'}">
						                <img onmouseout="javascript:downf($(this).attr('id'))" onmouseover="javascript:overf($(this).attr('id'))" id="bookss${7+status.count}" class="books" style="z-index: 101; position: absolute; margin-left:-45px;margin-top:40px; width: 90px; height: 120px;" title="${book.title}" src="/resources/usertemplate/images/forbid.png">
						            </c:when>
					            </c:choose>
                              </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-xs-3"></div>
            </div>
        </div>


        <br><br>

        <!-- paging -->
        <div align="center" class="shelfPagingBttn">
          <br>
          <c:if test="${pageMaker.prev}">
             <a class="paging" name="${pageMaker.startPage-1}" title="${pageMaker.startPage-1}" style="color: #ce8483" onclick="javascript:pageSettingSubmit(this)">&lt;</a>&emsp;
          </c:if>   
          <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <c:choose>
              <c:when test="${pageMaker.cri.page eq i}">
                <a name="${i}" onclick="javascript:pageSettingSubmit(this)">
                 <button class="pagebttn_select">${i}</button>
                </a>&emsp;
              </c:when>
              <c:otherwise>
                <a name="${i}" onclick="javascript:pageSettingSubmit(this)">
                 <button class="pagebttn">${i}</button>
                </a>&emsp;
              </c:otherwise>
            </c:choose>
          </c:forEach>
          <c:if test="${pageMaker.next}">
             <a class="paging" name="${pageMaker.endPage+1}"  title="${pageMaker.endPage+1}" onclick="javascript:pageSettingSubmit(this)">&gt;</a>&nbsp;
          </c:if>
       </div>
    </div>
</div>

                    </div>
                </div>

            </div>
            <!--/.item-->
        </div>

        <div style="width: 100%;" align="center">
           <br>
            <span class="companyInfo">
              copyright 함박웃음 - 이지윤 이신우<br>
                        문의 이메일 yuniyun3@naver.com
            
            </span><br><br>
        </div>
        <!--/.carousel-inner-->
    </div>
    <!--/.carousel-->
</section>
<!--/#main-slider-->


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


<script>

   if($('#criteriaForm').find('input[name=isBookMark]').attr('value') == 'true'){
      
      $('#isBookMark').addClass('select_submenuG');
   }else if($('#criteriaForm').find('input[name=isContinue]').attr('value') == 'true'){
      $('#isContinue').addClass('select_submenuG');
   }else{
      $('#submenu_all').addClass('select_submenuG');
   }
   
    function pageSettingSubmit(page){
      var key = page.name;
       $('#criteriaForm').find('input[name=page]').attr('value', key);
       $('#criteriaForm').find('input[value=""]').remove();
       $('#criteriaForm').submit();
    };
    
    function criSettingSubmit(criteria){
      var type = criteria.id;
      var key = criteria.lang;
      $('input[type="hidden"]:not([name='+ type +'], [name="userid"])').remove();
       $('#criteriaForm').find('input[name='+ type +']').attr('value', key);
       $('#criteriaForm').submit();
    };
    
   $('.bookRead').on('click', function(event){
       event.preventDefault();
        return $(this).ekkoLightbox();
    });
    
    $('#continueRead').on('click', function(){
       
    });
   
    var windowsize = document.body.offsetWidth*1;
    var overf;
    var downf;
    if(windowsize > (500*1)){
       overf = function overimg(cnt){
             document.getElementById(cnt).style.width = '120px';
             document.getElementById(cnt).style.height = '160px';
             document.getElementById(cnt).style.marginTop = '0px';
             document.getElementById(cnt).style.marginLeft = '-60px';
             document.getElementById(cnt).style.zIndex = '111';
             document.getElementById(cnt).style.transition = '100ms all';
       };
       downf = function downimg(cnt){
          document.getElementById(cnt).style.width = '90px';
          document.getElementById(cnt).style.height = '120px';
          document.getElementById(cnt).style.marginTop = '40px';
         document.getElementById(cnt).style.marginLeft = '-45px';
         document.getElementById(cnt).style.zIndex = '101';
          document.getElementById(cnt).style.transition = '100ms all';
       };
   }else{
      for(var i = 0; i<12; i++){
         $('.books')[i].style.width = '60px';
         $('.books')[i].style.height = '80px';
         $('.books')[i].style.marginTop = '80px';
         $('.books')[i].style.marginLeft = '-30px';
         $('.books')[i].style.zIndex = '101';
      }
       overf = function overimg(cnt){
          document.getElementById(cnt).style.width = '90px';
          document.getElementById(cnt).style.height = '120px';
          document.getElementById(cnt).style.marginTop = '40px';
         document.getElementById(cnt).style.marginLeft = '-45px';
         document.getElementById(cnt).style.zIndex = '111';
          document.getElementById(cnt).style.transition = '100ms all';
       };
       downf = function downimg(cnt){
          document.getElementById(cnt).style.width = '60px';
          document.getElementById(cnt).style.height = '80px';
          document.getElementById(cnt).style.marginTop = '80px';
         document.getElementById(cnt).style.marginLeft = '-30px';
         document.getElementById(cnt).style.zIndex = '101';
          document.getElementById(cnt).style.transition = '100ms all';
       };
    }
</script>


</body>
</html>