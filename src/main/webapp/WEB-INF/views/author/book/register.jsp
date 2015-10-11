<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <form action="register" method="post" enctype="multipart/form-data">
   <div style="width:100%; padding: 10px 10px 10px 10px;">
    <table width="100%" class="blackF">
        <tr>
            <th>카테고리</th>
            <td colspan="3"><select class="noborder" name="bookcategory">
            <option value="소설시">소설/시</option>
            <option value="로맨스">로맨스</option>
            <option value="무협">무협</option>
            <option value="판타지">판타지</option>
            <option value="SF">SF</option>
            <option value="에세이">에세이</option>
            <option value="자기계발">자기계발</option>
            <option value="경제경영">경제경영</option>
            <option value="사회과학">사회과학</option>
            <option value="IT/기술">IT/기술</option>
            <option value="인문학">인문학</option>
            <option value="역사">역사</option>
            <option value="청소년">청소년</option>
            <option value="예술/대중문화">예술/대중문화</option>
            <option value="종교/역학">종교/역학</option>
            <option value="만화">만화</option>
            <option value="어린이">어린이</option>
        </select></td></tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr><td colspan="4" class="grayLine"></td></tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr>
            <th width="20%">작가</th>
            <td width="30%">${name}</td>
            <th width="20%">출판사</th>
            <td width="30%"><select style="border: none" name="pubcompany">
                <option>출판사 선택</option>
                <option>가출판사</option>
                <option>나출판사</option>
                <option>다출판사</option>
                <option>라출판사</option>
                <option>마출판사</option>
                <option>바출판사</option>
                <option>한빛미디어</option>
            </select></td>
        </tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr><td colspan="4" class="grayLine"></td></tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr>
            <th>타이틀</th>
            <td colspan="3"><input type="text" name="title" style="width: 100%;"/></td>
        </tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr><td colspan="4" class="grayLine"></td></tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr>
            <th>소개문</th>
            <td colspan="3"><textarea name="overview" style="width: 100%;resize: none" rows="5"></textarea></td>
        </tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr><td colspan="4" class="grayLine"></td></tr>
        <tr><td colspan="4" class="whiteArea-10"></td></tr>
        <tr>
            <th>파일업로드</th>
            <td colspan="3" width="100%"><input type="file" name="upl" /></td>
        </tr>
        <tr>
            <th></th>
            <td colspan="3"><textarea style="width: 100%; resize: none; border: groove;" rows="5" readonly class="f10">[업로드시 유의사항]
  1. 문서 파일의 확장자는 'pdf'로 제한합니다.
  2. 작품 등록시 첫장에는 반드시 표지가 존재해야 합니다.
  3. 즉각 배포가 가능한 완성된 도서만 업로드 가능하며, 추가 수정은 업로드 이후에도 가능합니다.
  4. 음란물, 도배성문구, 광고 등 부적절한 파일을 등록시 불이익이 있을 수 있습니다.
  5. 작품은 관리자의 승인 하에 등록되며, 승인 대기 중 수정이 불가합니다.
  6. 수정,삭제는 관리자의 승인 하에 가능하며, version으로 관리됩니다.
   (단, 무분별한 수정 시 정상적으로 처리되지 않을 수 있습니다.)
  7. 기타 승인이 불가능한 사항이 있을 경우 관리자가 쪽지를 통해 이유를 전달합니다.
  8. 해당 저작물의 저작권은 작가에게 있으며, 무단 배포, 도용시 법적 처벌을 받으실 수 있습니다.</textarea></td>
        </tr>
    </table>
</div>
<div align="center">
    <table width="20%">
        <tr>
            <td><button class="btn btn-default" type="submit">등록</button></td>
            <td><button class="btn btn-default" data-dismiss="modal">취소</button></td>
        </tr>
    </table>
</div>
</form>
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
	<script src="/resources/js/common-scripts.js"></script>
	
	<script>

	function showResult(msg){
		var ul = $("#uploadUL");
		
		ul.append("<li><img src='/view?fileName=" + msg+"' style='width:100px; height:100px;'></li>");
		
	}
		
	</script>
</body>
</html>