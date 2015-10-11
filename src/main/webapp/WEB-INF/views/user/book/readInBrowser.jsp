<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Book read</title>
</head>
<link href="/resources/usertemplate/css/custom.css" rel="stylesheet" />
<link href="/resources/usertemplate/css/generalstyle.css" rel="stylesheet" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link href="/resources/usertemplate/css/bootstrap.min.css" rel="stylesheet">

<!-- 부가적인 테마 -->
<link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
<link href="/resources/lightbox-master/dist/ekko-lightbox.min.css" rel="stylesheet">
<link href="/resources/usertemplate/css/wheel-menu.css" rel="stylesheet" />

    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<style type="text/css">
@-webkit-keyframes blink {
         0%{
             opacity: 0;
         }
         25%{
             opacity: 0.5;
         }
         100%{
             opacity: 0;
         }
}
body {
   background: #cccccc;
}

#magazine {
   width: 900px;
   height: 600px;
}

#magazine div {
   width: 100%;
   height: 100%;
}

#magazine .turn-page {
   background-color: #ccc;
   background-size: 100% 100%;
}

.moveCenter {
   margin-left: 1%;
   transition: 200ms all;
}

.moveFirst {
   margin-left: -33%;
   transition: 200ms all;
}

.moveEnd {
   margin-left: 32%;
   transition: 200ms all;
}

.pallet {
   transition: 500ms all;
   position: absolute;
   top: 30px;
   right: 50px;
   z-index: 203;
   background-color: white;
   border-radius: 25px;
   opacity: 0;
}

.palletview {
   transition: 500ms all;
   position: absolute;
   top: 30px;
   right: 50px;
   z-index: 203;
   background-color: white;
   border-radius: 25px;
   opacity: 1;
}

.smallpalleticon {
   transition: 500ms all;
   width: 50px;
   opacity: 0.5;
}

.bigpalleticon {
   transition: 500ms all;
   width: 80px;
   opacity: 1;
}

.bgcolor {
   transition: 500ms all;
   width: 100%;
   height: 0%;
}

.bgcolorhide {
   transition: 500ms all;
   width: 100%;
   height: 100%;
}

.blockFigure {
   z-index: 40;
   display: block;
   position: absolute;
   width: 100%;
   height: 100%;
   font-size: 20px;
   background-color: #000;
   background-size: 100% 100%;
   opacity: 0;
}

#powerbutton {
   width: 50px;
   height: 50px;
}

.leftloc{
   top: 0px;
   left: 0px;
   transition: 1000ms all;
   opacity: 0;
    width:452px;
    height: 604px;
}
.lefttoloc{
   top: 0px;
   left: 0px;
   transition: 1000ms all;
   width: 492px;
   height: 644px
}
.rightloc{
   top: 0px;
   left: 0px;
   transition: 1000ms all;
   opacity: 0;
    width:452px;
    height: 604px;
}
.righttoloc{
   top: 0px;
   left: 0px;
   transition: 1000ms all;
   width: 492px;
   height: 644px
}
.hideDiv{
	display: none;
}
</style>

<body draggable="false" style="overflow: hidden;" id="backG">
   <figure id="blockDisplayForBookmark"
      class="blockFigure hide bookmarkMenu"></figure>
   <figure id="blockDisplayForBG" class="blockFigure hide bgMenu"></figure>
   <div id="dragarea" class="hideDiv">
	   	<div ondrop='javascript:drop(event,$(this).attr("value"))' ondragover='allowDrop(event)' class='drag' id='dragleft' value='1'
	       style='opacity:0; position: absolute; background-color: #ffffff; z-index:200; width: 452px; height: 604px;'></div>
       <div ondrop='javascript:drop(event,$(this).attr("value"))' ondragover='allowDrop(event)' class='drag' id='dragright' value='2'
	       style='opacity:0; position: absolute; background-color: #ffffff; z-index:200; width: 452px; height: 604px;'></div>
   </div>

   <div class="row" style="margin-top: 10px;">
      <div align="left" class="col-xs-12 wrapper" style="margin-left: 10px;">
         <div class="col-xs-6" style="margin-left: 20px; margin-top: 60px;">
            <img id="powerbutton" class="bookmarkMenu mainButton small"
               title="책갈피"
               src="/resources/usertemplate/images/bookmarkColor/mark2.png" />
            <div class="menubar icon">
               <img draggable="true" ondragstart="javascript:drag(event,$(this).attr('id'))" class="bookmarkColor" id="ffe4e9"
                  src="/resources/usertemplate/images/bookmarkColor/pink.png" />
            </div>
            <div class="menubar icon">
               <img draggable="true" ondragstart="javascript:drag(event,$(this).attr('id'))" class="bookmarkColor" id="d5d9f4"
                  src="/resources/usertemplate/images/bookmarkColor/purple.png" />
            </div>
            <div class="menubar icon">
               <img draggable="true" ondragstart="javascript:drag(event,$(this).attr('id'))" class="bookmarkColor" id="cce8ef"
                  src="/resources/usertemplate/images/bookmarkColor/blue.png" />
            </div>
            <div class="menubar icon">
               <img draggable="true" ondragstart="javascript:drag(event,$(this).attr('id'))" class="bookmarkColor" id="ade7bc"
                  src="/resources/usertemplate/images/bookmarkColor/green.png" />
            </div>
            <div class="menubar icon">
               <img draggable="true" ondragstart="javascript:drag(event,$(this).attr('id'))" class="bookmarkColor" id="f9eec6"
                  src="/resources/usertemplate/images/bookmarkColor/yellow.png" />
            </div>
            <div class="menubar icon">
               <img onclick="javascript:lightbox(event, ${book.bookno})"
                  src="/resources/usertemplate/images/bookmarkColor/list.png" />
            </div>

         </div>
         <div class="col-xs-6" style="margin-top: -60px; margin-left: -10px; z-index: 100;">
            <button
               style="width: 45px; height: 45px; border-radius: 50%; border: none; background-color: skyblue; text-align: center;">
               <input id="pagebox" type="text"
                  style="width: 35px; text-align: center; border: none; background-color: skyblue; color: white; font-weight: bold;"
                  onKeyPress="if (event.keyCode==13){ movePageFunction($(this).val());event.returnValue=false}">
            </button>
            <span class="grayADF"
               style="font-size: 16px; font-weight: bold; vertical-align: bottom;">
               / <c:choose>
                  <c:when test="${book.totalpage%2 eq 1}">${book.totalpage+1}</c:when>
                  <c:otherwise>${book.totalpage}</c:otherwise>
               </c:choose>
            </span>
         </div>
      </div>

      <div style="width: 600px; top: 10px; right: 10px; height: 150px;">

         <div align="right">
            <img id="palleticon" title="background"
               src="/resources/usertemplate/images/backgroundColor/pallet.png"
               style="position: absolute; top: 20px; right: 10px; z-index: 205;"
               class="smallpalleticon bgMenu">
         </div>
         <div>
            <table id="pallet" class="pallet">
               <tr>
                  <td><img class="bgcolor" value="e5ebfa" title="ice"
                     src="/resources/usertemplate/images/backgroundColor/ice.png"></td>
                  <td><img class="bgcolor" value="f1eefb" title="raincloud"
                     src="/resources/usertemplate/images/backgroundColor/raincloud.png"></td>
                  <td><img class="bgcolor" value="d2c6fd" title="lavender"
                     src="/resources/usertemplate/images/backgroundColor/lavender.png"></td>
                  <td><img class="bgcolor" value="fdeee7" title="sugarpink"
                     src="/resources/usertemplate/images/backgroundColor/sugarpink.png"></td>
                  <td><img class="bgcolor" value="e1f1fc" title="fallsky"
                     src="/resources/usertemplate/images/backgroundColor/fallsky.png"></td>
                  <td><img class="bgcolor" value="b8dffa" title="candyblue"
                     src="/resources/usertemplate/images/backgroundColor/candyblue.png"></td>
                  <td><img class="bgcolor" value="dadada" title="dust"
                     src="/resources/usertemplate/images/backgroundColor/dust.png"></td>
                  <td><img class="bgcolor" value="8e8e8e" title="asphalt"
                     src="/resources/usertemplate/images/backgroundColor/asphalt.png"></td>
                  <td></td>
               </tr>
               <tr>
                  <td><img class="bgcolor" value="cccccc" title="default"
                     src="/resources/usertemplate/images/backgroundColor/yuniyun.png"></td>
                  <td><img class="bgcolor" value="ffdede"
                     title="strawberrymilk"
                     src="/resources/usertemplate/images/backgroundColor/strawberrymilk.png"></td>
                  <td><img class="bgcolor" value="ffc0c0" title="ham"
                     src="/resources/usertemplate/images/backgroundColor/ham.png"></td>
                  <td><img class="bgcolor" value="ffdab5" title="grapefruitade"
                     src="/resources/usertemplate/images/backgroundColor/grapefruitade.png">
                  </td>
                  <td><img class="bgcolor" value="ffce9f" title="delmonte"
                     src="/resources/usertemplate/images/backgroundColor/delmonte.png"></td>
                  <td><img class="bgcolor" value="fcffa9" title="honeylemon"
                     src="/resources/usertemplate/images/backgroundColor/honeylemon.png"></td>
                  <td><img class="bgcolor" value="faff6d" title="banana"
                     src="/resources/usertemplate/images/backgroundColor/banana.png"></td>
                  <td><img class="bgcolor" value="dcf4d9" title="eastsea"
                     src="/resources/usertemplate/images/backgroundColor/eastsea.png"></td>
                  <td><img class="bgcolor" value="ace5a4" title="forestgreen"
                     src="/resources/usertemplate/images/backgroundColor/forestgreen.png"></td>
               </tr>
            </table>
         </div>
      </div>
   </div>



   <div class="row" align="center"
      style="margin-top: -330px; z-index: 10;">
      <div class="col-xs-12">
         <div class="moveFirst" id="magazine">
            <c:forEach items="${list}" var="page" varStatus="status">
               <c:if test="${status.count eq book.totalpage}">
                  <c:if test="${book.totalpage%2 eq 1}">
                     <div>
                        <img src="/view?path=C:\UNIORACLE\3r_card\UTIL\lastPage.png"
                           onclick="javascript:nextp()"
                           style="width: 452px; height: 604px">
                     </div>
                  </c:if>
               </c:if>
               <div>
                  <img src="/view?path=${page.imgpath}" id="${page.convertno}"
                     name="${status.count}"
                     <c:choose>
                     <c:when test="${status.count%2 eq 1}">onclick="javascript:nextp()" class="odd"</c:when>
                     <c:otherwise>onclick="javascript:prevp()" class="even"</c:otherwise>
                  </c:choose>
                     style="width: 452px; height: 604px">
               </div>

            </c:forEach>

         </div>
      </div>
      <div style="width: 100%; margin-top: 700px;" align="center">
         <br> <span class="companyInfo"> copyright 함박웃음 - 이지윤 이신우<br>
            문의 이메일 yuniyun3@naver.com

         </span><br> <br>
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

   <input type="hidden" name="totalpage"
      <c:choose>
         <c:when test="${book.totalpage%2 eq 1}">value="${book.totalpage+1}"</c:when>
         <c:otherwise>value="${book.totalpage}"</c:otherwise>
      </c:choose>>
   <input type="hidden" id="currPage" value="">
   <a id="moveAtag"></a>


   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="/resources/usertemplate/js/jquery-2.1.1.min.js"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>
   <script src="/resources/lightbox-master/dist/ekko-lightbox.min.js"></script>

   <!--common script for all pages-->
   <script src="/resources/usertemplate/js/bootstrap.min.js"></script>
   <script type="text/javascript"
      src="/resources/usertemplate/js/turn.min.js"></script>

   <script type="text/javascript">

    $(window).ready(function () {
        $('#magazine').turn({
            display: 'double',
            acceleration: true,
            gradients: !$.isTouch,
            elevation: 50,
            when: {
                turned: function (e, page) {
                    console.log('Current view: ', $(this).turn('view'));
                }
            }
        });

    });
    $("#magazine").bind("first", function(event) {
    	$('#magazine').removeClass("moveEnd");
    	$('#magazine').removeClass("moveCenter");
    	$('#magazine').addClass("moveFirst");
    });
    $("#magazine").bind("last", function(event) {
    	$('#magazine').removeClass("moveCenter");
    	$('#magazine').removeClass("moveFirst");
    	$('#magazine').addClass("moveEnd");
    });
    $(window).bind('keydown', function (e) {
       	if (e.keyCode == 37) prevp();
        else if (e.keyCode == 39) nextp();
    });
    function nextp() {
    	if ($('#magazine').turn('view')[1] == 1) {
            $('#magazine').removeClass("moveFirst");
            $('#magazine').addClass("moveCenter");
        }
        $('#magazine').turn('next');
        $('#pagebox').val($('#magazine').turn('view')[0]);
        updateContinueFunction();
    }
    function prevp() {
    	var endpage = $('input[name=totalpage]').attr('value');
    	if ($('#magazine').turn('view')[0] == endpage) {
            $('#magazine').addClass("moveCenter");
            $('#magazine').removeClass("moveEnd");
        }
    	$('#magazine').turn('previous');
    	$('#pagebox').val($('#magazine').turn('view')[0]);
        if($('#magazine').turn('view')[1] == 1) {
        	$('#pagebox').val($('#magazine').turn('view')[1]);
        }
        
        updateContinueFunction();
    }
    window.onload = function () {
        if ($('input[name="isContinue"]').attr('value') == "true") {
            var continuepage = $('input[name="continuepage"]').attr('value');
            console.log(continuepage);
            for (var i = 0; i < Math.floor(continuepage / 2); i++) {
               nextp();
            }
            $('#pagebox').val($('#magazine').turn('view')[0]);
        }
        $('input[name="isContinue"]').attr('value', 'false');
        
        if ($('#magazine').turn('view')[0] == 0) {
            $('#pagebox').val(1);
        } else {
            $('#pagebox').val($('#magazine').turn('view')[0]);
        }
    }
    
    function updateContinueFunction(){
        if($('input[name="isContinue"]').attr('value') == "false" && $('input[name="grade"]').attr('value') == "작가"){
          $.post('updateContinue',{
               cardno: $('input[name=cardno]').attr('value'),
               continuepage: $('#magazine').turn('view')[0]
           });
       }
     }
    
    function movePageFunction(inputpage) {
    	var page = inputpage;
        var firstpage = 1;
        var endpage = $('input[name=totalpage]').attr('value');
        var nowpage = $('#magazine').turn('view')[0] == 0 ? $('#magazine').turn('view')[1] : $('#magazine').turn('view')[0];
        
       	if(parseInt(firstpage) > parseInt(page)) {
       		page = firstpage;
       	}else if(parseInt(endpage) < parseInt(page)) {
       		console.log('page'+page+'endpage'+endpage)
       		page = endpage;
       	}
       	
       	if ($('#magazine').turn('view')[1] == 1) {
            $('#magazine').removeClass("moveFirst");
            $('#magazine').addClass("moveCenter");
        }else if ($('#magazine').turn('view')[0] == endpage) {
            $('#magazine').addClass("moveCenter");
            $('#magazine').removeClass("moveEnd");
        }
        $('#magazine').turn('page', page);
        $('#pagebox').val(page);
        updateContinueFunction();

    }
    
    $('.bgcolor').on('click', function () {
        if ($(this).attr('title') == 'default') {
            $("body").css("background", "linear-gradient(to bottom,#cccccc 0%, #cccccc 100%) repeat-x center center fixed");
        } else {
            var color = $(this).attr('value');
            $("body").css("background", "linear-gradient(to bottom,#" + color + " 0%, white 100%) repeat-x center center fixed");
        }
    });

    $('.bgMenu').on('click', function () {
        $('#palleticon').toggleClass('bigpalleticon');
        $('#pallet').toggleClass('palletview');
        $('.bgcolor').toggleClass('bgcolorhide');
        $('#blockDisplayForBG').toggleClass('hide');
    });

    
  //-------------------------------------wheel menu start
    function removeAnimation(obj, idxValue){ //아직 적용안함
       return function(){
          obj.removeClass("m"+idxValue+"-out");
          console.log("m"+idxValue+"-out");
       };
    }
  	var flag = 1;
    $('.bookmarkMenu').on('click', function(){
       bookmarkMenuActivation();
       var nowleftpage = $('#magazine').turn('view')[0];
       var nowrightpage = $('#magazine').turn('view')[1];
       
       if(flag == 1){ //처음클릭
    	   var leftl=$('img[name='+nowleftpage+']').offset().left;
           var leftt=$('img[name='+nowleftpage+']').offset().top;
              
           var rightl=$('img[name='+nowrightpage+']').offset().left;
           var rightt=$('img[name='+nowrightpage+']').offset().top;
           
           document.getElementById('dragleft').style.left = leftl + 'px';
           document.getElementById('dragleft').style.top = leftt + 'px';
           
           document.getElementById('dragright').style.left = rightl + 'px';
           document.getElementById('dragright').style.top = rightt + 'px';
           /////////////////////////////////////////////////////////////////////
           flag = 0;
       }else{
    	   flag = 1;
       }
       $('#dragarea').toggleClass('hideDiv');
    });
    function bookmarkMenuActivation(){
       $("#powerbutton").toggleClass('small');
       $("#powerbutton").toggleClass('big');
       
       var idx = 1;
       
       $(".icon").each(function(){
          $(this).toggleClass('m'+idx++);
       });
       $('#blockDisplayForBookmark').toggleClass('hide');
    };
    //-------------------------------------wheel menu end

    function lightbox(event, bookno){
        event.preventDefault();
        bookmarkMenuActivation(); flag = 1;
        $('#dragarea').toggleClass('hideDiv');
        var addmode = $('input[name=addmode]').attr('value');
        $('#moveAtag').attr('href', 'listBookmark?bookno='+bookno+'&addmode='+addmode);
        $('#moveAtag').attr('data-title', "Bookmark List");
        return $('#moveAtag').ekkoLightbox();
    };
    
    function drag(ev,color){
    	if(ev.srcElement.className=="bookmarkColor"){
	       ev.dataTransfer.setData("color", color);
	       $('input[name=bookcomment]').attr('value', color);
    	}
    }
    
    function drop(event,area){
       event.preventDefault();
       var color = event.dataTransfer.getData("color");
       if(color != '' && color != null){
	        var nowleftpage = $('#magazine').turn('view')[0];
	        var nowrightpage = $('#magazine').turn('view')[1];
	        var leftl=$('img[name='+nowleftpage+']').offset().left;
	        var leftt=$('img[name='+nowleftpage+']').offset().top;
	           
	        var rightl=$('img[name='+nowrightpage+']').offset().left;
	        var rightt=$('img[name='+nowrightpage+']').offset().top;
	        
	       if(area == 1){
	    	  $('input[name=convertno]').attr('value',  $('img[name='+nowleftpage+']').attr('id'));
	          document.getElementById('dragleft').style.width="492px";
	          document.getElementById('dragleft').style.height="644px";
	          document.getElementById('dragleft').style.top=(leftt-20)+"px";
	          document.getElementById('dragleft').style.left=(leftl-20)+"px";
	          document.getElementById('dragleft').style.backgroundColor="#"+color;
	
	          document.getElementById('dragleft').style.animationDuration="1000ms";
	          document.getElementById('dragleft').style.animationName="blink";
	          document.getElementById('dragleft').style.transition="1000ms all";
	           setTimeout(
	                  function(){
	                      document.getElementById('dragleft').style.height="604px";
	                      document.getElementById('dragleft').style.width="452px";
	                      document.getElementById('dragleft').style.top=leftt+"px";
	                      document.getElementById('dragleft').style.left=leftl+"px";
	                      document.getElementById('dragleft').style.animationDuration="";
	                      document.getElementById('dragleft').style.animationName="";
	                      document.getElementById('dragleft').style.transition="1000ms all";
	                      document.getElementById('dragleft').style.backgroundColor="#ffffff";
	                      $('#dragarea').toggleClass('hideDiv');
	                  },1000   
	               );
	       }else if(area == 2){
	    	  $('input[name=convertno]').attr('value',  $('img[name='+nowrightpage+']').attr('id'));
	          document.getElementById('dragright').style.height="644px";
	          document.getElementById('dragright').style.width="492px";
	          document.getElementById('dragright').style.top=(rightt-20)+"px";
	          document.getElementById('dragright').style.left=(rightl-20)+"px";
	          document.getElementById('dragright').style.backgroundColor="#"+color;
	          document.getElementById('dragright').style.animationDuration="1000ms";
	          document.getElementById('dragright').style.animationName="blink";
	          document.getElementById('dragright').style.transition="1000ms all";
	           setTimeout(
	                  function(){
	                      document.getElementById('dragright').style.height="604px";
	                      document.getElementById('dragright').style.width="452px";
	                      document.getElementById('dragright').style.top=rightt+"px";
	                      document.getElementById('dragright').style.left=rightl+"px";
	                      document.getElementById('dragright').style.animationDuration="";
	                      document.getElementById('dragright').style.animationName="";
	                      document.getElementById('dragright').style.transition="1000ms all";
	                      document.getElementById('dragright').style.backgroundColor="#ffffff";
	                      $('#dragarea').toggleClass('hideDiv');
	                  },1000
	               );
	       }
	      $.post('registerBookmark', $('#bookmarkForm').serialize());
	      bookmarkMenuActivation(); flag = 1;
	      
       }
       event.dataTransfer.clearData("color");
    };
    function allowDrop(ev) {
        ev.preventDefault();
    };
</script>

</body>

</html>