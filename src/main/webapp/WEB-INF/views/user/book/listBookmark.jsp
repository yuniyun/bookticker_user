<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <!-- Bootstrap -->
    <link href="/resources/usertemplate/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/usertemplate/css/generalstyle.css" rel="stylesheet"/>
    <link href="/resources/usertemplate/css/custom.css" rel="stylesheet"/>
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    <link href="/resources/lightbox-master/dist/ekko-lightbox.min.css" rel="stylesheet">
    
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<style>
    .bookmarker{
        text-align: center;
        border-radius: 50%;
        margin-left: 8px;
        margin-right: 8px;
        border: none;
        width:45px;
        height: 45px;
    }
    .selectBookmark{
    	border: 2px #b6b6b6 solid;
    }
    .hideBtn{
    	display: none;
    }
</style>
<body>
	<c:forEach items="${list}" var="bookmark">
		<button style="background-color: #${bookmark.bookcomment};" class="b bookmarker" name="${bookmark.bookno}"
			onclick="javascript:bookmarkerBtnClick(${bookmark.pageno}, ${bookmark.additionno})" id="${bookmark.additionno}">
			${bookmark.pageno}
		</button>
	</c:forEach>
	<div id="btnDiv" style="text-align: center; padding-top: 20px">
		<input type="button" id="removeBtn" name="bookmarkBtn" class="btn btn-default" value="삭제">
	</div>
	<form id="removeForm">
		<input type="hidden" name="additionno" value="">
		<input type="hidden" name="bookno" value="">
		<input type="hidden" name="addmode" value="책갈피">
	</form>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/usertemplate/js/jquery.isotope.min.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.min.js"></script>
<script type="text/javascript" src="/resources/usertemplate/js/turn.min.js"></script>

<!--common script for all pages-->
<!-- 이것들 있어야 light box해도 화면 안 움직임(3개) -->
<script src="/resources/usertemplate/js/bootstrap.min.js"></script>
<script>
	function bookmarkerBtnClick(wantPage, additionno){
		if($('input[name=bookmarkBtn]').attr('id')=='removeBtn'){
			$(this).attr('data-dismiss', 'modal');
			parent.movePageFunction(wantPage);
		}else{
			$('#'+additionno).toggleClass('selectBookmark');
			$('input[name=bookno]').attr('value', $('.bookmarker').attr('name'));
			var beforeAddi = $('input[name=additionno]').attr('value');
			var beforeArr = beforeAddi.split(',');
			for(var i=0; i<beforeArr.length; i++){
				if(beforeArr[i] == additionno){
					beforeArr.splice(i, 1); //i번째 요소부터 1개 배열에서 삭제
					$('input[name=additionno]').attr('value', beforeArr.toString());
					return;
				}
			}
			$('input[name=additionno]').attr('value', beforeAddi+','+additionno); //맨 앞에 , 빼야됨
		}
	};
	$('input[name=bookmarkBtn]').on('click', function(){
		var btnId = $(this);
		if($(btnId).attr('id')=='confirmBtn'){
			var beforeAddi = $('input[name=additionno]').attr('value');
			var beforeArr = beforeAddi.split(',');
			for(var i=0; i<beforeArr.length; i++){
				$('#'+beforeArr[i]).addClass('hideBtn');
			}
			$.post('removeBookmark', $('#removeForm').serialize());
			$(btnId).attr('id', 'removeBtn');
			$(btnId).attr('value', '삭제');
			$(btnId).removeClass('btn-warning');
		}else{
			$(btnId).attr('id', 'confirmBtn');
			$(btnId).attr('value', '확인');
			$(btnId).addClass('btn-warning');
		}
	});
</script>
</body>
</html>