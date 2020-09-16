<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>체감 온도  &#62; 생활기상지수  &#62; 도움말</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="freehtml5.co" />
	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">
	<!-- Animate.css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<c:url value="/resources/css/icomoon.css"/>">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
	<!-- Theme style  -->
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
	<!-- Modernizr JS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
	});
	</script>
	<style>
	.table_HELP {
	    width: 98%;
	    text-align: center;
	    margin-left: 1px;
	}
	
	.h3_orange_T20_first {
	    font-size: 100%;
	    padding: 10px 0 10px 25px;
	    line-height: 1.4em;
	    margin: 0;
	}
	.blue {
	    background: #03c;
	    color: #fff;
	}
	.yellow {
	    background: #fc0;
	}
	.orange {
	    background: #f60;
	    color: #fff;
	}
	.red {
	    background: #c00;
	    color: #fff;
	}
	.table_HELP thead th {
	    padding: 5px 5px 4px 5px;
	    border: 1px solid #c8c8c8;
	    background: #f7f6f6;
	    color: #0958a5;
	}
	.table_HELP tbody td {
	    padding: 5px 5px 4px 5px;
	    border: 1px solid #c8c8c8;
	    text-align: center;
	}
	</style>
</head>
<body style="overflow:hidden;background:none;padding-top:10px;">
<div id="pop_bg">
<h3 class="h3_orange_T20_first"><img src="<c:url value="/resources/images/detail/h3_text_1_22.gif"/>" alt="체감온도 산출표" /></h3>
 <table class="table_HELP" summary="체감온도 산출표를 습도와 기온별로 나타낸 표입니다">
  <colgroup>
  <col width="*%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  <col width="8%" />
  </colgroup>
  <thead>
  <tr>
    <th class="brn" scope="col" ><img src="<c:url value="/resources/images/detail/img_c_ms_bg.gif"/>" alt="기온(℃) 풍속(m/sec)" /></th>
    <th scope="col">0</th>
    <th scope="col">-5</th>
    <th scope="col">-10</th>
    <th scope="col">-15</th>
    <th scope="col">-20</th>
    <th scope="col">-25</th>
    <th scope="col">-30</th>
    <th scope="col">-35</th>
    <th scope="col">-40</th>
    <th scope="col">-45</th>
    <th scope="col">-50</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td  scope="row">1.4</td>
    <td  class="blue">-2</td>
    <td  class="blue">-7</td>
    <td  class="yellow" >-13</td>
    <td  class="yellow">-19</td>
    <td  class="yellow">-24</td>
    <td  class="orange">-30</td>
    <td  class="orange">-36</td>
    <td  class="orange" > -41</td>
    <td  class="red">-47</td>
    <td  class="red">-53</td>
    <td  class="red">-58</td>
  </tr>
  <tr>
    <td  scope="row">2.8</td>
    <td  class="blue">-3</td>
    <td  class="blue">-9</td>
    <td  class="yellow">-15</td>
    <td  class="yellow" >-21</td>
    <td  class="orange">-27</td>
    <td  class="orange">-33</td>
    <td  class="orange">-39</td>
    <td  class="orange">-45</td>
    <td  class="red">-51</td>
    <td  class="red" >-57</td>
    <td  class="red" >-63</td>
  </tr>
  <tr>
    <td  scope="row">4.2</td>
    <td  class="blue">-4</td>
    <td  class="yellow">-11</td>
    <td  class="yellow" >-17</td>
    <td  class="yellow" >-23</td>
    <td  class="orange" >-29</td>
    <td  class="orange" >-35</td>
    <td  class="orange" >-41</td>
    <td  class="red" >-48</td>
    <td  class="red" >-54</td>
    <td  class="red" >-60</td>
    <td  class="red">-66</td>
  </tr>
  <tr>
    <td  scope="row">5.6</td>
    <td  class="blue">-5</td>
    <td  class="yellow">-12</td>
    <td  class="yellow">-18</td>
    <td  class="yellow">-24</td>
    <td  class="orange">-31</td>
    <td  class="orange">-37</td>
    <td  class="orange" >-43</td>
    <td  class="red">-49</td>
    <td  class="red">-56</td>
    <td  class="red">-62</td>
    <td  class="red">-68</td>
  </tr>
  <tr>
    <td  scope="row">6.9</td>
    <td  class="blue">-6</td>
    <td  class="yellow">-12</td>
    <td  class="yellow">-19</td>
    <td  class="yellow" >-25</td>
    <td  class="orange">-32</td>
    <td  class="orange">-38</td>
    <td  class="orange" >-45</td>
    <td  class="red" >-51</td>
    <td  class="red" >-57</td>
    <td  class="red">-64</td>
    <td  class="red">-70</td>
  </tr>
  <tr>
    <td  scope="row">8.3</td>
    <td  class="blue">-6</td>
    <td  class="yellow">-13</td>
    <td  class="yellow">-20</td>
    <td  class="orange">-26</td>
    <td  class="orange" >-33</td>
    <td  class="orange" >-39</td>
    <td  class="red">-46</td>
    <td  class="red">-52</td>
    <td  class="red">-59</td>
    <td  class="red" >-65</td>
    <td  class="red" >-72</td>
  </tr>
  <tr>
    <td  scope="row">9.7</td>
    <td  class="blue">-7</td>
    <td  class="yellow">-14</td>
    <td  class="yellow">-20</td>
    <td  class="orange">-27</td>
    <td  class="orange" >-33</td>
    <td  class="orange">-40</td>
    <td  class="red">-47</td>
    <td  class="red" >-53</td>
    <td  class="red">-60</td>
    <td class="red" >-66</td>
    <td class="red" >-73</td>
  </tr>
  <tr>
    <td  scope="row">11.1</td>
    <td  class="blue">-7</td>
    <td  class="yellow" >-14</td>
    <td  class="yellow">-21</td>
    <td  class="orange">-27</td>
    <td  class="orange">-34</td>
    <td  class="orange">-41</td>
    <td  class="red">-48</td>
    <td  class="red">-54</td>
    <td  class="red" >-61</td>
    <td  class="red">-68</td>
    <td  class="red">-74</td>
  </tr>
  <tr>
    <td  scope="row">12.5</td>
    <td  class="blue" >-8</td>
    <td  class="yellow">-15</td>
    <td  class="yellow">-21</td>
    <td  class="orange">-28</td>
    <td  class="orange" >-35</td>
    <td  class="orange">-42</td>
    <td  class="red">-48</td>
    <td  class="red">-55</td>
    <td  class="red">-62</td>
    <td  class="red" >-69</td>
    <td  class="red">-75</td>
  </tr>
  <tr>
    <td  scope="row">13.9</td>
    <td class="blue" >-8</td>
    <td  class="yellow">-15</td>
    <td  class="yellow">-22</td>
    <td  class="orange" >-29</td>
    <td  class="orange">-35</td>
    <td  class="orange" >-42</td>
    <td  class="red">-49</td>
    <td  class="red">-56</td>
    <td  class="red">-63</td>
    <td  class="red">-70</td>
    <td  class="red">-76</td>
  </tr>
  <tr>
    <td  scope="row">15.3</td>
    <td class="blue" >-8</td>
    <td class="yellow" >-15</td>
    <td class="yellow" >-22</td>
    <td class="orange">-29</td>
    <td class="orange">-36</td>
    <td class="orange" >-43</td>
    <td class="red" >-50</td>
    <td class="red">-57</td>
    <td class="red">-63</td>
    <td class="red" >-70</td>
    <td class="red">-77</td>
  </tr>
  <tr>
    <td  scope="row">16.7</td>
    <td class="blue" >-9</td>
    <td class="yellow">-16</td>
    <td class="yellow">-23</td>
    <td class="orange">-30</td>
    <td class="orange">-36</td>
    <td class="orange">-43</td>
    <td class="red">-50</td>
    <td class="red">-57</td>
    <td class="red">-64</td>
    <td class="red">-71</td>
    <td class="red" >-78</td>
  </tr>
  </tbody>
</table>


        <br />
        <table width="360"  border="0" cellspacing="8" cellpadding="0"  >
          <tr>
            <td width="30" class="blue" ></td>
            <td >&nbsp;관심</td>
            <td width="30" class="yellow" ></td>
            <td>&nbsp;주의</td>
            <td width="30" class="orange" ></td>
            <td>&nbsp;경고</td>
            <td width="30" class="red" ></td>
            <td>&nbsp;위험</td>
          </tr>

        </table>
<br />
</div>
<div id="pop_foot"><p><a href="javascript:top.window.close()"><img src="<c:url value="/resources/images/detail/btn_close.gif"/>" alt="창닫기"></a></p></div>
</body>

</html>
