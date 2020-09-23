<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="${path}/res/css/location.css"/>" type="text/css">
    <style type="text/css">
        a:link { color: white; text-decoration: none;}
        a:visited { color: white; text-decoration: none;}
        a:hover { color: white; text-decoration: none;}
       </style>
</head>
<body>
<%@include file="top_bar.jsp"%>
    <div id="banner_wrap">
        <div id="banner" class="image " style="background-image:url(https://c2.poing.co.kr/banner/MjAxOTAx/15474478485c3c2e28c949a.png)">
            <div class="title_wrap">
                <div class="title">
                   	주요 지역별		
                </div>
            </div>
                <div class="subtitle"></div>
        </div>
    </div>

    <div id="content_wrap">
        <div class="section">
            <div class="title">주요 지역별</div>
                <div class="body">

                    <div class="content">
                        <a href="list?location=서울/수도권" class="image lazy" >
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">서울/수도권</div>
                                    <div id = "bg"></div>                
                                    <img src="<c:url value='${path}/res/image/insadong.jpg'/>" alt="서울/수도권">
                                </div>
                            </div>
                        </a> 
                    </div>
                    
                    <div class="content">
                        <a href="list?location=부산" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475447465c3da8aa96cd2.png">
                            <div class="shading"></div> 
                            <div class="center">
                                 <div class="middle">
                                     <div class="subtitle">부산</div>  
                                     <div id = "bg"></div>                  
                                     <img src="<c:url value='${path}/res/image/keonuniv.jpg'/>" alt="부산">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?location=제주" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475445375c3da7d93a73f.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">제주</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/cheongdam.jpg'/>" alt="제주">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?location=대구" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475448665c3da92297813.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">대구</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/seouluniv.jpg'/>" alt="대구">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?location=대전/세종" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450715c3da9efb02e1.png">
                            <div class="shading"></div> 
                            <div class="center">
                                 <div class="middle">
                                     <div class="subtitle">대전/세종</div>   
                                     <div id = "bg"></div>                 
                                     <img src="<c:url value='${path}/res/image//hyehwa.jpg'/>" alt="대전/세종">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?location=광주" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475449435c3da96febbe0.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">광주</div>      
                                    <div id = "bg"></div>              
                                    <img src="<c:url value='${path}/res/image/ikseon.jpg'/>" alt="광주">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?location=전주" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450055c3da9ad3655e.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">전주</div>    
                                    <div id = "bg"></div>                
                                    <img src="<c:url value='${path}/res/image/seongsu.jpg'/>" alt="전주">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?location=울산" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446855c3da86dd7f0a.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">울산</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/yeouido.jpg'/>" alt="울산">
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