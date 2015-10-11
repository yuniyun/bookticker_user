<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!doctype html>
<html lang="en"> 
<head>
  <meta charset="UTF-8">
  <title></title>
  
  <style type="text/css">
    
  </style>

</head>
<body>
  <div class="main">
      <h2>Device Orientation</h2>
      <table>
        <tr>
          <td>Event Supported</td>
          <td id="doEvent"></td>
        </tr>
        <tr>
          <td>Tilt Left/Right [gamma]</td>
          <td id="doTiltLR"></td>
        </tr>
      </table>
  </div>
  
  <div class="container" style="-webkit-perspective: 300; perspective: 300;">
    <img src="html5_logo.png" id="imgLogo" class="logo">
  </div>
  
  <script type="text/javascript">
    init();
    var count = 0;
    
    function init() {
      if (window.DeviceOrientationEvent) {
        document.getElementById("doEvent").innerHTML = "DeviceOrientation";
        // Listen for the deviceorientation event and handle the raw data
        window.addEventListener('deviceorientation', function(eventData) {
          // gamma is the left-to-right tilt in degrees, where right is positive
          var tiltLR = eventData.gamma;
          
          // call our orientation event handler
          deviceOrientationHandler(tiltLR);
          }, false);
      } else {
        document.getElementById("doEvent").innerHTML = "Not supported on your device or browser.  Sorry."
      }
    }
  
    function deviceOrientationHandler(tiltLR) {
      document.getElementById("doTiltLR").innerHTML = Math.round(tiltLR);
      
      // Apply the transform to the image
    }
    
    
    // Some other fun rotations to try...
    //var rotation = "rotate3d(0,1,0, "+ (tiltLR*-1)+"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
    //var rotation = "rotate("+ tiltLR +"deg) rotate3d(0,1,0, "+ (tiltLR*-1)+"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
  </script>
  
  

</body>
</html>