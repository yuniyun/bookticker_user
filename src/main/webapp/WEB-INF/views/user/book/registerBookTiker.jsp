<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <style type="text/css">
        .scanner-laser {
            position: absolute;
            margin: 40px;
            height: 30px;
            width: 30px;
        }

        .laser-leftTop {
            top: 0;
            left: 0;
            border-top: solid #ea553a 5px;
            border-left: solid #ea553a 5px;
        }

        .laser-leftBottom {
            bottom: 0;
            left: 0;
            border-bottom: solid #ea553a 5px;
            border-left: solid #ea553a 5px;
        }

        .laser-rightTop {
            top: 0;
            right: 0;
            border-top: solid #ea553a 5px;
            border-right: solid #ea553a 5px;
        }

        .laser-rightBottom {
            bottom: 0;
            right: 0;
            border-bottom: solid #ea553a 5px;
            border-right: solid #ea553a 5px;
        }
        .cameracover{
            width: 320px;
            height: 240px;
        }
        .opencover{
            transition: 3000ms all;
            width: 320px;
            height: 0px;
        }
    </style>
</head>
<body>
<div class="row" align="center" style="z-index: 21; height: 250px">
    <div id="cameraarea" class="cameracover" style="background: url('/resources/usertemplate/images/booktikerCover.png'); background-size: 100%">
    </div>
</div>
<div class="row" align="center" style="z-index: 20;">

</div>
<!-- <form id="booktiker" action="" method="post">
	<input type="hidden" name="cardkey">
</form> -->
</body>
<script type="text/javascript" src="/resources/usertemplate/js/qrcodelib.js"></script>
<script type="text/javascript" src="/resources/usertemplate/js/WebCodeCam.js"></script>
<script type="text/javascript">


    setTimeout(function(){
        var camera = '';
        camera += '<div style="position: relative;display: inline-block; margin-left: 0px">';
        camera += '<canvas id="qr-canvas" width="320" height="240" style="transform: rotateY(180deg);"></canvas>';
        camera += '<div class="scanner-laser laser-rightBottom" style="opacity: 0.5;"></div>';
        camera += '<div class="scanner-laser laser-rightTop" style="opacity: 0.5;"></div>';
        camera += '<div class="scanner-laser laser-leftBottom" style="opacity: 0.5;"></div>';
        camera += '<div class="scanner-laser laser-leftTop" style="opacity: 0.5;"></div></div>';

        $('#cameraarea').html(camera);

        $('#qr-canvas').WebCodeCam({
            ReadQRCode: true, // false or true
            ReadBarcode: true, // false or true
            width: 320,
            height: 240,
            videoSource: {
                id: true,      //default Videosource
                maxWidth: 320, //max Videosource resolution width
                maxHeight: 240 //max Videosource resolution height
            },
            flipVertical: false,  // false or true
            flipHorizontal: false,  // false or true
            zoom: -1, // if zoom = -1, auto zoom for optimal resolution else int
            beep: "WebCodeCam/js/beep.mp3", // string, audio file location
            autoBrightnessValue: false, // functional when value autoBrightnessValue is int
            brightness: 0, // int
            grayScale: false, // false or true
            contrast: 0, // int
            threshold: 0, // int
            sharpness: [], //or matrix, example for sharpness ->  [0, -1, 0, -1, 5, -1, 0, -1, 0]
            resultFunction: function(resText, lastImageSrc) {
            	$.post('registerBookTiker', { cardkey: resText }, function(msg){
            		if(msg == 'success'){
            			alert("정상적으로 처리되었습니다. \n 책장으로 이동합니다.");
            			self.location = "/user/book/shelf";
            		}else alert(msg);
            	});
            },
            getUserMediaError: function() {
                example:
                        alert('Sorry, the browser you are using doesn\'t support getUserMedia');
                        //카메라 사용못할때
            },
            cameraError: function(error) {
                example:
                        var p, message = 'Error detected with the following parameters:\n';
                for (p in error) {
                    message += p + ': ' + error[p] + '\n';
                }
                alert(message);

            }
        })
        ;

        $('#qr-canvas').WebCodeCam();
        $('.cameracover').addClass('opencover');
    },3000);


</script>
</html>