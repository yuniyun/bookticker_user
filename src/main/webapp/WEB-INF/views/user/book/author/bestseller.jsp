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
    <link href="/resources/lightbox-master/dist/ekko-lightbox.min.css" rel="stylesheet">
    
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>

</head>
<body>
	<header> <nav class="navbar navbar-default navbar-fixed-top"
		role="navigation">
	<div class="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse.collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="navbar-brand">
					<a href="shelf">
					    <h1><span>BOOKTICKER</span></h1>
					</a>
				</div>
			</div>
			<div class="navbar-collapse collapse">
				<div class="menu">
					<ul class="nav nav-tabs mainmenu" role="tablist">
						<li role="presentation"><a href="/user/book/shelf">MY SHELF</a></li>
						<li role="presentation"><a href="bestseller" class="active">BOOKS</a></li>
						<li role="presentation"><a href="/user/book/indiebook/bestseller">INDIE BOOK</a></li>
						<li role="presentation"><a id="menu_community"
							onclick="goCommunity()">COMMUNITY</a></li>
						<li role="presentation"><a id="menu_notice"
							onclick="goNotice()">NOTICE</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</nav> </header>
	
	<div id="breadcrumb">
		<div class="container">	
			<div class="breadcrumb">	
			  <li>Books&nbsp;&nbsp;<i class="fa fa-angle-right blackF"></i>&emsp;</li>
			  <li><a class="select_submenu" href="bestseller">Bestseller</a></li>
			  <li><a class="submenu" href="booklist">all</a></li>
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
					<div class="row slide-margin mainView">
						<div class="col-xs-1"></div>
						<div class="col-xs-10">
						  <div style="position: relative" id="books">
							<div class="row">
							  <div class="col-xs-12" style="text-align: right">
							    <select class="noborder grayMF" name="perPageNum" onchange="javascript:criSettingSubmit(this)">
									<option value="10" <c:if test="${pageMaker.cri.perPageNum eq '10'}">selected</c:if>>Top10</option>
									<option value="30" <c:if test="${pageMaker.cri.perPageNum eq '30'}">selected</c:if>>Top30</option>
									<option value="100" <c:if test="${pageMaker.cri.perPageNum eq '100'}">selected</c:if>>Top100</option>
								  </select>
								<span class="grayMF" style="text-align: right"> 
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
							</div>
							<!-- 카테고리, 퍼페넘 -->
							<div>
							<br><br>
								<table width="100%" style="color: black">
									<tr>
										<th width="8%" style="text-align: center"></th>
										<th width="8%" style="text-align: center"></th>
										<th style="text-align: center">책이름</th>
										<th width="8%" style="text-align: center">카테고리</th>
										<th width="8%" style="text-align: center">평점</th>
										<th width="8%" style="text-align: center">판매량</th>
									</tr>
									<tr>
										<td colspan="6" class="whiteArea-10"></td>
									</tr>
									<tr>
										<td colspan="6" class="grayLine"></td>
									</tr>
									<tr>
										<td colspan="6" class="whiteArea-20"></td>
									</tr>
									<c:forEach items="${list}" var="book" varStatus="status">
										<tr class="booklist-tr cursor-p" onclick="javascript:lightbox(event, ${book.bookno})">
											<td align="center">
										      <c:choose>
											    <c:when test="${status.count eq 1}">
											      <img src="/resources/usertemplate/images/best1seller.png" class="crownsize">
											    </c:when>
											    <c:when test="${status.count eq 2}">
											      <span class="f24 b" style="color: #c4c4c4">2</span>
											    </c:when>
											    <c:when test="${status.count eq 3}">
											      <span class="f24 b" style="color: #a94442">3</span>
											    </c:when>
											    <c:otherwise>
												   <span class="f20 blackF">${status.count}</span>
												</c:otherwise>
											  </c:choose>
											</td>
											<td align="center">
											<img class="bookList" alt="${book.title}" src="/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=thumbnail">
											
											</td>
											<td class="bookSimpleInfo">
											  <span class="f16">${book.title}</span><br>
											<span class="f12 grayMF">${book.username}</span></td>
											<td align="center">${book.bookcategory}</td>
											<td align="center">${book.starpoint}</td>
											<td align="center">${book.sellcnt}</td>
										</tr>
										<tr>
											<td colspan="6" class="whiteArea-20"></td>
										</tr>
									</c:forEach>
									
								</table>
							</div>
							<!-- 내용임 -->


						</div>
					</div>
				</div>

			</div>
			<!--/.item-->
		</div>
</div></div>
		<div style="width: 100%;" align="center">
			<br>
            <span class="companyInfo">
              copyright 함박웃음 - 이지윤 이신우<br>
                        문의 이메일 yuniyun3@naver.com
            
            </span><br><br>
		</div>
		<!--/.carousel-inner-->
	</div>
	<!--/.carousel--> </section>
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



	<script type="text/javascript">
		function pageSettingSubmit(page) {
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
	    function lightbox(event, bookno){
	        event.preventDefault();
	        $('#moveAtag').attr('href', 'bookpreview?bookno='+bookno);
	        $('#moveAtag').attr('data-title', "Book information");
	         return $('#moveAtag').ekkoLightbox();
	    };
	</script>


</body>
</html>