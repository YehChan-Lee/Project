<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>#해쉬태그 - 밥풀</title>
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
        <div id="banner" class="image " style="background-image:url(https://c2.poing.co.kr/banner/MjAxOTAx/15474478485c3c2e28c949a.png)">
            <div class="title_wrap">
                <div class="title">
                   	해시태그	
                </div>
            </div>
                <div class="subtitle"></div>
        </div>
    </div>

    <div id="content_wrap">
        <div class="section">
            <div class="title">해시태그</div>
                <div class="body">

                    <div class="content">
                        <a href="list?page=1&string_search=%23매운" class="image lazy" >
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">#매운</div>
                                    <div id = "bg"></div>                
                                    <img src="<c:url value='${path}/res/image/hashTag/1.jpg'/>" alt="#매운">
                                </div>
                            </div>
                        </a> 
                    </div>
                    
                    <div class="content">
                        <a href="list?page=1&string_search=%23브런치" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475447465c3da8aa96cd2.png">
                            <div class="shading"></div> 
                            <div class="center">
                                 <div class="middle">
                                     <div class="subtitle">#브런치</div>  
                                     <div id = "bg"></div>                  
                                     <img src="<c:url value='${path}/res/image/hashTag/2.jpg'/>" alt="#브런치">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?page=1&string_search=%23혼밥" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475445375c3da7d93a73f.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">#혼밥</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/hashTag/3.png'/>" alt="#혼밥">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?page=1&string_search=%23맛집" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475448665c3da92297813.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">#맛집</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/hashTag/4.jpg'/>" alt="#맛집">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?page=1&string_search=%23일상" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450715c3da9efb02e1.png">
                            <div class="shading"></div> 
                            <div class="center">
                                 <div class="middle">
                                     <div class="subtitle">#일상</div>   
                                     <div id = "bg"></div>                 
                                     <img src="<c:url value='${path}/res/image/hashTag/5.jpg'/>" alt="#일상">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?page=1&string_search=%23맛스타그램" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475449435c3da96febbe0.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">#맛스타그램</div>      
                                    <div id = "bg"></div>              
                                    <img src="<c:url value='${path}/res/image/hashTag/6.jpg'/>" alt="#맛스타그램">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?page=1&string_search=%23소통" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450055c3da9ad3655e.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">#소통</div>    
                                    <div id = "bg"></div>                
                                    <img src="<c:url value='${path}/res/image/seongsu.jpg'/>" alt="#소통">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="list?page=1&string_search=%23먹방" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446855c3da86dd7f0a.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">#먹방</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/hashTag/8.jpg'/>" alt="#먹방">
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="content">
                        <a href="list?page=1&string_search=%23셀카" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446855c3da86dd7f0a.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">#셀카</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/hashTag/9.jpg'/>" alt="#셀카">
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