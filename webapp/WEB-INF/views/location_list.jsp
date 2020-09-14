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
                   	 인기 지역별		
                </div>
            </div>
                <div class="subtitle"></div>
        </div>
    </div>

    <div id="content_wrap">
        <div class="section">
            <div class="title">인기 지역별</div>
                <div class="body">

                    <div class="content">
                        <a href="list" class="image lazy" >
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">인사동</div>
                                    <div id = "bg"></div>                
                                    <img src="<c:url value='${path}/res/image/insadong.jpg'/>" alt="인사동">
                                </div>
                            </div>
                        </a> 
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475447465c3da8aa96cd2.png">
                            <div class="shading"></div> 
                            <div class="center">
                                 <div class="middle">
                                     <div class="subtitle">건대</div>  
                                     <div id = "bg"></div>                  
                                     <img src="<c:url value='${path}/res/image/keonuniv.jpg'/>" alt="건대">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475445375c3da7d93a73f.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">청담동</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/cheongdam.jpg'/>" alt="청담동">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475448665c3da92297813.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">샤로수길</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/seouluniv.jpg'/>" alt="샤로수길">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450715c3da9efb02e1.png">
                            <div class="shading"></div> 
                            <div class="center">
                                 <div class="middle">
                                     <div class="subtitle">대학로</div>   
                                     <div id = "bg"></div>                 
                                     <img src="<c:url value='${path}/res/image//hyehwa.jpg'/>" alt="대학로">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475449435c3da96febbe0.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">익선동</div>      
                                    <div id = "bg"></div>              
                                    <img src="<c:url value='${path}/res/image/ikseon.jpg'/>" alt="익선동">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450055c3da9ad3655e.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">성수</div>    
                                    <div id = "bg"></div>                
                                    <img src="<c:url value='${path}/res/image/seongsu.jpg'/>" alt="성수">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446855c3da86dd7f0a.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">여의도</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/yeouido.jpg'/>" alt="여의도">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446055c3da81dba890.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">광화문</div>       
                                    <div id = "bg"></div>             
                                    <img src="<c:url value='${path}/res/image/gwanghwamoon.jpg'/>" alt="광화문">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475449575c3da97d347ab.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">합정</div>        
                                    <div id = "bg"></div>            
                                    <img src="<c:url value='${path}/res/image/hapjeong.jpg'/>" alt="합정">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475447005c3da87cec20c.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">잠실</div>     
                                    <div id = "bg"></div>               
                                    <img src="<c:url value='${path}/res/image/jamsil.jpg'/>" alt="잠실">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475445895c3da80d4c49b.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">서래마을</div>     
                                    <div id = "bg"></div>               
                                    <img src="<c:url value='${path}/res/image/seorae.jpg'/>" alt="서래마을">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475444815c3da7a1c3825.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">한남동</div>  
                                    <div id = "bg"></div>                  
                                    <img src="<c:url value='${path}/res/image/hannam.png'/>" alt="한남동">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446665c3da85ab2d23.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">명동</div>      
                                    <div id = "bg"></div>              
                                    <img src="<c:url value='${path}/res/image/myungdong.jpg'/>" alt="명동">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475445525c3da7e801bb2.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">이태원</div>   
                                    <div id = "bg"></div>                 
                                    <img src="<c:url value='${path}/res/image/itaewon.jpg'/>" alt="이태원">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475447625c3da8ba4d662.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">경리단길</div>            
                                    <div id = "bg"></div>        
                                    <img src="<c:url value='${path}/res/image/kyunglidangil.jpg'/>" alt="경리단길">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446255c3da8315f56c.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">강남역</div>      
                                    <div id = "bg"></div>              
                                    <img src="<c:url value='${path}/res/image/gangnamyeok.png'/>" alt="강남역">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475448265c3da8fa997c6.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">문래</div>          
                                    <div id = "bg"></div>          
                                    <div><img src="<c:url value='${path}/res/image/munrae.jpg'/>" alt="문래"></div>
                                </div>
                            </div>
                        </a>
                    </div>
               
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475445685c3da7f8cce6d.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">압구정</div>  
                                    <div id = "bg"></div>                  
                                    <img src="<c:url value='${path}/res/image//apgujeong.jpg'/>" alt="압구정">
                                </div>
                            </div>
                        </a>
                    </div>
 
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475450405c3da9d07dcbe.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">종로</div>     
                                    <div id = "bg"></div>               
                                    <img src="<c:url value='${path}/res/image/jongro.jpg'/>" alt="종로">
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475445145c3da7c2706c4.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">홍대</div>      
                                    <div id = "bg"></div>    
                                    <img src="<c:url value='${path}/res/image/hongikuniv.jpg'/>" alt="홍대">
                                              
                                </div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="content">
                        <a href="" class="image lazy" data-src="https://c2.poing.co.kr/banner/MjAxOTAx/15475446495c3da849672d6.png">
                            <div class="shading"></div> 
                            <div class="center">
                                <div class="middle">
                                    <div class="subtitle">가로수길</div>         
                                    <div id = "bg"></div>           
                                    <img src="<c:url value='${path}/res/image/garosugil.jpg'/>" alt="가로수길">         
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