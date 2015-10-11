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
    <link href="/resources/usertemplate/css/generalstyle.css" rel="stylesheet"/>
    <link href="/resources/usertemplate/css/custom.css" rel="stylesheet"/>
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        
</head>
<style type="text/css">
	.border_div{ display: inline-block; border: solid 1px #ccc; font-size: 9pt; }
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
                        <a href="/user/book/shelf">
                          <h1><span>BOOKTICKER</span></h1>
                        </a>
                    </div>
                </div>
                <div class="navbar-collapse collapse">
                    <div class="menu">
                        <ul class="nav nav-tabs mainmenu" role="tablist">
                            <li role="presentation"><a href="/user/book/shelf">MY SHELF</a></li>
                            <li role="presentation"><a href="/user/book/author/bestseller">BOOKS</a></li>
                            <li role="presentation"><a class="active" href="bestseller">INDIE BOOK</a></li>
                            <li role="presentation"><a id="menu_community" onclick="goCommunity()">COMMUNITY</a></li>
                            <li role="presentation"><a id="menu_notice" onclick="goNotice()">NOTICE</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>

<div id="breadcrumb">
	<div class="container">	
		<div class="breadcrumb">	
		  <li>indie book&nbsp;&nbsp;<i class="fa fa-angle-right blackF"></i>&emsp;</li>
		  <li><a class="submenu" href="bestseller">Best</a></li>
		  <li><a class="select_submenu" href="booklist">all</a></li>
		  <li><a class="submenu" href="mybook">mybook</a></li>
		  <li><a class="submenu" href="bookmark">Like</a></li>
		</div>		
	</div>	
</div>

<form id="criteriaForm" method="get">
   <input type="hidden" name="page" value="${pageMaker.cri.page}">
   <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
   <input type="hidden" name="searchType" value="${pageMaker.cri.searchType}">
   <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
   <input type="hidden" name="categoryType" value="${pageMaker.cri.categoryType}">
</form>

<a id="moveAtag"></a>

<section id="main-slider" style="margin-top: -30px;">
    <div class="carousel slide">
        <div class="carousel-inner">
            <div class="active">
                <div class="container">
                    <div class="row slide-margin mainView" style="text-align: center">
                    	<div class="col-xs-1"></div>
                        <div class="col-xs-10">
                     	  <div style="position: relative" id="books">
							<div class="row">
							  <div class="col-xs-3">
							    <span class="grayDF"> 
									<select class="noborder" name="categoryType" style="border: hidden" onchange="javascript:criSettingSubmit(this)">
										<option value="">전체카테고리</option>
										<option value="소설/시"
										  <c:if test="${pageMaker.cri.categoryType eq '소설/시'}">selected</c:if>>소설/시</option>
										<option value="무협"
										  <c:if test="${pageMaker.cri.categoryType eq '무협'}">selected</c:if>>무협</option>
										<option value="로맨스"
										  <c:if test="${pageMaker.cri.categoryType eq '로맨스'}">selected</c:if>>로맨스</option>
										<option value="판타지"
										  <c:if test="${pageMaker.cri.categoryType eq '판타지'}">selected</c:if>>판타지</option>
										<option value="SF"
										  <c:if test="${pageMaker.cri.categoryType eq 'SF'}">selected</c:if>>SF</option>
										<option value="에세이"
										  <c:if test="${pageMaker.cri.categoryType eq '에세이'}">selected</c:if>>에세이</option>
										<option value="자기계발"
										  <c:if test="${pageMaker.cri.categoryType eq '자기계발'}">selected</c:if>>자기계발</option>
										<option value="경제경영"
										  <c:if test="${pageMaker.cri.categoryType eq '경제경영'}">selected</c:if>>경제경영</option>
										<option value="사회과학"
										  <c:if test="${pageMaker.cri.categoryType eq '사회과학'}">selected</c:if>>사회과학</option>
										<option value="인문학"
										  <c:if test="${pageMaker.cri.categoryType eq '인문학'}">selected</c:if>>인문학</option>
										<option value="역사"
										  <c:if test="${pageMaker.cri.categoryType eq '역사'}">selected</c:if>>역사</option>
										<option value="청소년"
										  <c:if test="${pageMaker.cri.categoryType eq '청소년'}">selected</c:if>>청소년</option>
										<option value="예술/대중문화"
										  <c:if test="${pageMaker.cri.categoryType eq '예술/대중문화'}">selected</c:if>>예술/대중문화</option>
										<option value="종교/역학"
										  <c:if test="${pageMaker.cri.categoryType eq '종교/역학'}">selected</c:if>>종교/역학</option>
										<option value="만화"
										  <c:if test="${pageMaker.cri.categoryType eq '만화'}">selected</c:if>>만화</option>
										<option value="어린이"
										  <c:if test="${pageMaker.cri.categoryType eq '어린이'}">selected</c:if>>어린이</option>
									</select>
								</span>
							  </div>
							  <div class="col-xs-9" style="text-align: right">
							    <form class="form-inline border_div" id="searchForm">
									<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
									<div class="form-group">
										<select class="form-control" name="searchType" style="border: hidden">
											<option value="전체"
											  <c:if test="${pageMaker.cri.searchType eq '전체'}">selected</c:if>>전체</option>
											<option value="제목"
											  <c:if test="${pageMaker.cri.searchType eq '제목'}">selected</c:if>>제목</option>
											<option value="작가"
											  <c:if test="${pageMaker.cri.searchType eq '작가'}">selected</c:if>>작가</option>
										</select>
									</div>
									<div class="input-group input-group-in">
									    <fieldset >
								<input class="blackF" type="text" id="keyword" name="keyword" style="border: 0;"
								  placeholder="<c:if test="${pageMaker.cri.keyword eq null}">전체/제목/작가</c:if>"
		                     	  value="<c:if test="${pageMaker.cri.keyword ne ''}">${pageMaker.cri.keyword}</c:if>">
								<img class="cursor-p" src="/resources/usertemplate/images/btn_search.png" alt="검색"
								  onclick="javascript:submitSearchForm()" style="width: 23px">
								
							   </fieldset>
							   
									</div><!-- /input-group-in -->
								</form>
							  </div>
							</div>
							<!-- 카테고리, 퍼페넘 -->
    <table width="100%" style="margin-top: 20px" >
      <c:forEach items="${list}" var="book" varStatus="status">
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr class="booklist-tr cursor-p" style="color: #777777; height: 50px;" align="center" onclick="javascript:lightbox(event, ${book.bookno})">
            
            <c:if test=""></c:if>
            
            <td align="center" width="5%" style="padding-left: 20px; padding-right: 10px"><span style="color: #d58512">N</span></td>
            <td align="center" width="10%">
              <img class="bookList" src="/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=thumbnail"
              	onerror="this.src='/resources/usertemplate/images/ready.png'">
            </td>
            <td align="left" style="padding-left: 20px">
                <div class="row">
                    <div class="col-xs-9">
                        <div class="row b">
                          <span class="blackF">${book.title}</span>
                       	</div>
                        <div class="row">${book.username} | ${book.bookcategory}</div>
                        <div class="row grayMF"><br>${book.overview}
                        </div>
                    </div>
                    <div class="col-xs-3 col-md-2">
                        <div class="row">${book.applydate}</div>
                        <div class="row">총 100화</div>
                        <div class="row">추천 ${book.starpoint}</div>
                        <div class="row">즐겨찾기 ${book.sellcnt}</div>
                    </div>
                </div>
            </td>
        </tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr><td colspan="4" class="grayLine"></td></tr>
      </c:forEach>  
      
     
        
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
    </table>
    <div class="row" align="right" style="margin-right: 5px">
		<span>
		  <a id="registerbook">
			<button class="btn btn-default">책 등록</button>
		  </a>
		</span>
    </div>
    </div>
    
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
          <br><br>
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

<input type="hidden" id="isToday" value="">
<input type="hidden" id="applydate" value="${book.applydate}">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/usertemplate/js/jquery-2.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/usertemplate/js/jquery.prettyPhoto.js"></script>
<script src="/resources/usertemplate/js/jquery.isotope.min.js"></script>
<script src="/resources/usertemplate/js/wow.min.js"></script>
<script src="/resources/usertemplate/js/functions.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>

<!--common script for all pages-->
<!-- 이것들 있어야 light box해도 화면 안 움직임(3개) -->
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<!--  -->


<script>
	var dateArr = $('#applydate').attr('value').split('-');
	var today = new Date();
	var endDate = new Date(dateArr[0],dateArr[1],dateArr[2]);  // 2003/07/16 00:00:00
	console.log(today);
	if (today == endDate) {
		$('#isToday').attr('value', 'true');
	} else {
		$('#isToday').attr('value', 'false');
	}
	
    function pageSettingSubmit(page){
      var key = page.name;
       $('#criteriaForm').find('input[name=page]').attr('value', key);
       $('#criteriaForm').find('input[value=""]').remove();
       $('#criteriaForm').submit();
    };
    function criSettingSubmit(criteria){
		var type = criteria.name;
		var key = criteria.value;
    	$('#criteriaForm').find('input[name='+ type +']').attr('value', key);
    	$('#criteriaForm').find('input[value=""]').remove();
    	$('#criteriaForm').find('input[name="page"]').remove();
    	$('#criteriaForm').submit();
    };
    
    $('.writeBook').on('click', function(event){
       	event.preventDefault();
        return $(this).ekkoLightbox();
    });
    
    function lightbox(event, bookno, mode){
        event.preventDefault();
        $('#moveAtag').attr('href', 'bookpreview?bookno='+bookno);
        $('#moveAtag').attr('data-title', "Book information");
         return $('#moveAtag').ekkoLightbox();
    };
    $('#registerbook').on('click', function(event){
    	event.preventDefault();
    	$(this).attr('href', 'registerbook');
        $(this).attr('data-title', "Register Book");
        return $(this).ekkoLightbox();
    });
    
    function submitSearchForm(){
    	$('#searchForm').submit();
    }

</script>


</body>
</html>