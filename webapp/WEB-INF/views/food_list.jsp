<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주요 음식별 - 밥풀</title>
    <link rel="stylesheet" href="<c:url value="${path}/res/css/copy_location.css"/>" type="text/css">
    <style type="text/css">
        a:link { color: white; text-decoration: none;}
        a:visited { color: white; text-decoration: none;}
        a:hover { color: white; text-decoration: none;}
       </style>
</head>
<body>
<%@include file="top_bar.jsp"%>
    <div id="banner_wrap">
        <div id="banner" class="image " style="background-image:url(https://c2.poing.co.kr/banner/MjAxOTAx/15474478385c3c2e1eea758.png)">
            <div class="title_wrap">
                <div class="title">
                   	 음식 종류별		
                </div>
            </div>
                <div class="subtitle"></div>
        </div>
    </div>

    <div id="content_wrap">
        <div class="section">
            <div class="title">음식 종류별</div>
                <div class="body">

                    <div class="content">
                        <a href="list?food_type=한식&page=1" class="image lazy" >
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">한식</div>
                                    <div id = "bg"></div>                
                                    <img src="<c:url value='${path}/res/image/korean.jpg'/>" alt="한식">
                                </div>
                            </div>
                        </a> 
                    </div>
                    
                    <div class="content">
                        <a href="list?food_type=일식&page=1" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475447465c3da8aa96cd2.png">
                            <div class="shading"></div> 
                            <div class="center">
                                 <div class="middle">
                                     <div class="subtitle">일식</div>  
                                     <div id = "bg"></div>                  
                                     <img src="<c:url value='${path}/res/image/japanese.jpg'/>" alt="일식">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?food_type=중식&page=1" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475445375c3da7d93a73f.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">중식</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/chinese.jpg'/>" alt="중식">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?food_type=양식&page=1" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475448665c3da92297813.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">양식</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/western.jpg'/>" alt="양식">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?food_type=아시아식&page=1" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450715c3da9efb02e1.png">
                            <div class="shading"></div> 
                            <div class="center">
                                 <div class="middle">
                                     <div class="subtitle">아시아식</div>   
                                     <div id = "bg"></div>                 
                                     <img src="<c:url value='${path}/res/image//southeastasia.jpg'/>" alt="아시아식">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    
                    
                    <div class="content">
                        <a href="list?food_type=구이&page=1" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450055c3da9ad3655e.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">구이</div>    
                                    <div id = "bg"></div>                
                                    <img src="<c:url value='${path}/res/image/meat.jpg'/>" alt="고깃집">
                                </div>
                            </div>
                        </a>
                    </div>   
                    
                    <div class="content">
                        <a href="list?food_type=술집&page=1" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446055c3da81dba890.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">술집</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/bar.jpg'/>" alt="술집">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?food_type=카페/베이커리&page=1" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475449575c3da97d347ab.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">카페/베이커리</div>        
                                    <div id = "bg"></div>            
                                    <img src="<c:url value='${path}/res/image/cafe.jpg'/>" alt="카페/베이커리">
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
</body>
</html>