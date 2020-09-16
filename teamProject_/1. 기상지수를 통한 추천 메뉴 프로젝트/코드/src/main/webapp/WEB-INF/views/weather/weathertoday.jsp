<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>오늘의 날씨</title>
	<%@ include file="../include/header.jsp" %>
	
	<!-- =========================== -->
		 
	<!--  style, script는 여기에 입력해주세요 -->
	 <style>
      table {
        width: 100%;
        	border: hidden;
		
      }
      td,th {
        padding: 10px;
        
      } 
      #m1 > a{
				color: #fff !important;
			}
			
		#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	
	#local_code{
		width: 120px;
		height:25px;
		margin:8px;
	    border: 0;
	    box-shadow: 2px 2px 2px 2px gray;
	    background-color: transparent;
	    background-position: center right;
	    background-size: 15px 10px;
	}
	
	
	.th1{
		color: white;
		background-color: sandyBrown;
		border-bottom: 1px solid sandyBrown;
		border-right:1px solid white;
	}
	.th2{
		border-bottom:hidden;
	}
	
	#curve_chart{
		width:100%; 
		height: auto;	  
		box-shadow:  1em 0 .4em gray, -1em 0 .4em gray;
	}
	.blue1{
	 color:#E57733;
	 font-weight:bold;
	}
	
		@media ( max-width: 480px ) {
		
			#curve_chart{
			  	width:100%; 
			  	height: auto;	  
			}
		}
				
    </style>
    
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        var list2 = new Array();
        var time= new Array("000",'100','200','300','400','500','600','700','800','900','1000','1100','1200','1300','1400','1500','1600','1700','1800','1900','2000','2100','2200','2300')
        list2.push(['time','yesterday', 'today'])
        console.log(time);
        for(var i in time){
        	console.log(i)
      	  var list1 = new Array();
        	if(i==0){
        		var temp=($("#temp_0").val())*1;
        		var temp2=($("#temp2_0").val())*1;
        	}else{        		
	      	  var temp=($("#temp_"+time[i]).val())*1;
	      	  console.log("#temp_"+time[i]);
	      	  console.log($("#temp_"+time[i]).val());
	      		var temp2=($("#temp2_"+time[i]).val())*1;
        	}     	  
	      		var k=time[i].substring(0,time[i].length-2);
      	  list1.push(k);
      	  list1.push(temp2);
      	  list1.push(temp);
      	  list2.push(list1);
        }
        
        console.log(list2);
       
        function drawChart() {
          var data = google.visualization.arrayToDataTable(list2);

          var options = {
            curveType: 'function',
            legend: { position: 'right' },
            height: 400,
            series: {
                0: { lineDashStyle: [2, 2]}
              },
              
            vAxes: {
               0: {
               	title:'기온(℃)'
               }
             },
            hAxes: {
                0: {
                	title:'시간(time)'
                }
              }
          };

          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

          chart.draw(data, options);
        }
        
        $(window).resize(function() {
            if(this.resizeTO) clearTimeout(this.resizeTO);
            this.resizeTO = setTimeout(function() {
                $(this).trigger('resizeEnd');
            }, 500);
        });

        //redraw graph when window resize is completed  
        $(window).on('resizeEnd', function() {
            drawChart();
        });
    })
      
    </script>
    
    
	<!-- =========================== -->
	
</head>
<body>
<div class="fh5co-loader"></div>
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
		 
		 <!-- =========================== -->
		 
		 <!--  내용은 여기에 입력해주세요 -->
		 <h3 id="weatherjisu">오늘의 날씨</h3>		
		<br/>
		<form name="locfrm" id="locfrm" action="weathertoday.do" method="POST">
				<select name="local_code" id="local_code" onchange="this.form.submit()">
				<c:forEach items="${list}" var="item">
					<option value="${item.local_code}"<c:if test="${item.local_code==param.local_code }">selected</c:if>>${item.local_si}</option>
				</c:forEach>
				</select>
		</form>
		<div style="overflow-x:auto;">
		<table>
			<tr>
				<th class = "th1">측정날짜</th>
				<th class = "th1">측정시간</th>
				<th class = "th1">기온</th>
				<th class = "th1">강수량</th>
				<th class = "th1">습도</th>
				<th class = "th1">풍향</th>
				<th class = "th1">풍속</th>
			</tr>
			
			<tr>
					<th class = "th2"><img src="${path}/resources/images/weather/date.png" width="100px" height="100px" /></th>
					<th class = "th2"><img src="${path}/resources/images/weather/time.png" width="100px" height="100px" /></th>
					<th class = "th2"><img src="${path}/resources/images/weather/temp.jpg" width="100px" height="100px" /></th>
					<th class = "th2"><img src="${path}/resources/images/weather/rain.jpg" width="100px" height="100px" /></th>
					<th class = "th2"><img src="${path}/resources/images/weather/humidity.jpg" width="100px" height="100px" /></th>
					<th class = "th2"><img src="${path}/resources/images/weather/wd.png" width="100px" height="100px" /></th>
					<th class = "th2"><img src="${path}/resources/images/weather/ws.png" width="100px" height="100px" /></th>	
			</tr>
			
			
			<tr>
			
				<td align="center" class="blue1">${fn:substring(vo2.WE_DATE,0,4)}/
				${fn:substring(vo2.WE_DATE,4,6)}/
				${fn:substring(vo2.WE_DATE,6,8)}</td> 	
		
				
					<c:set var="Time">${vo2.WE_TIME}</c:set>
									
					<td align="center" class="blue1">
					${fn:substring(Time,0,fn:length(Time)-2)}시
					${fn:substring(Time,fn:length(Time)-2,fn:length(Time))}분
					</td> 
					<td align="center" class="blue1">${vo2.WE_TEMPERATURE}℃</td> 
					<td align="center" class="blue1">${vo2.WE_RAIN}ml</td> 
					<td align="center" class="blue1">${vo2.WE_HUMIDITY}%</td> 
					
					
					<td align="center" class="blue1">			
					<c:if test="${vo2.WE_WIND_DIRECTION le 90}">북동풍(${vo2.WE_WIND_DIRECTION})</c:if>
					<c:if test="${(vo2.WE_WIND_DIRECTION gt 90) &&(vo2.WE_WIND_DIRECTION le 180)}">동남풍(${vo2.WE_WIND_DIRECTION})</c:if>
					<c:if test="${(vo2.WE_WIND_DIRECTION gt 180)&&(vo2.WE_WIND_DIRECTION le 270)}">남서풍(${vo2.WE_WIND_DIRECTION})</c:if>
					<c:if test="${(vo2.WE_WIND_DIRECTION gt 270)&&(vo2.WE_WIND_DIRECTION le 360)}">북서풍(${vo2.WE_WIND_DIRECTION})</c:if>
					</td>
					<td align="center" class="blue1">${vo2.WE_WIND_SPEED}m/s</td>
			</tr>
			
			
		</table>
		*풍향  :  북동(0-90) 동남(90-180) 남서(180-270) 북서(270-360)
		<hr/>
		</div>
		<h3>*오늘의 기온*</h3>
		<form>
		<c:forEach var="item" items="${list3}" varStatus="status">
		<input type="hidden" value="${item.WE_TEMPERATURE}" id="temp_${item.WE_TIME}"/>
		</c:forEach>
		
		<c:forEach var="item" items="${list4}" varStatus="status">
		<input type="hidden" value="${item.WE_TEMPERATURE}" id="temp2_${item.WE_TIME}"/>
		</c:forEach>
		</form>
		
		<div id="curve_chart" style="width:100%; height: 500px"></div>
		
		 <!-- =========================== -->
				
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

