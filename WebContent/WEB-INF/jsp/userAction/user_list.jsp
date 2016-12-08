<%-- <html>
<head>
<title>辉县市机动车维修站-用户信息</title>
<style type="text/css">
a {
	text-decoration: none
}

.fanye {
	width: 90%;
	text-align: center;
	margin-top: 60px;
}

#pagination {
	color: #000;
}
</style>
<link href="${pageContext.request.contextPath }/css/header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/ceshi.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".delete").click(function(){
		var arr=$(this).attr("href").split("=");
		var a=$(this).attr("href");
		var b = a.split("name=");
		if(confirm("确定要删除" + "“ " + b[1]+ "” " +"用户吗？ ")){
			window.location.href = a + pageNum;
			
		}
			return false;
	});
})
</script> 

</head>
<body>
<iframe name="control" src="header.jsp" scrolling="no" frameborder="0" style="width:100%; height:190px;"></iframe>
	<!--main-->
	<div id="main" style="height: auto">
		<div id="message">
			<div class="p-detail">
				<p>
					当前位置&nbsp;:&nbsp;&nbsp;<a href="#">查询</a>>><a
						href="#">用户列表</a>
				</p>
			</div>
			<div id="line"></div>
			<div id="list">
				<table width="750" id="grid"  style="position:absolute;height:500px;">
					<font style="color:red;padding-left:250px;">${errorMessage }</font><br>
					<thead><a href="user_addUI">添加用户</a></thead>
					<tr>
						<th>姓名</th>
						<th>登录名</th>
						<th>联系方式</th>
						<th>修改</th>
						<th>删除</th>
					</tr>
					<s:iterator value="recordList">
						<s:if test="loginName != 'admin'">
							<tr id="${id}">
								<td>${name }</td>
								<td>${loginName }</td>
								<td>${phoneNum }</td>
								<td><a href="user_editUI?id=${id }">修改</a></td>
								<td>
									<a href="user_delete?id=${id }&name=${name}" class="delete">删除</a>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</table>
				<br>
			<div id="page">
				<p>页数：${currentPage }/${pageCount }页&nbsp; 每页显示：${pageSize }条&nbsp;
					总记录数：${recordCount-1 }条&nbsp;</p>
				<p>

					<span>[<a href="javascript:gotoPage(1)">首页</a>]
					</span> <span>[<a href="javascript:gotoPage(${pageNum }-1)">上页</a>]
					</span>

					<s:iterator begin="%{beginPageIndex}" end="%{endPageIndex}"
						var="num">
						<s:if test="#num == currentPage">
							<span style="color: red; cursor: hand;">${num }</span>
						</s:if>
						<s:else>
					&nbsp;<span style="cursor: hand;" onClick="gotoPage(${num });">${num }</span>&nbsp;
				</s:else>
					</s:iterator>
					<span>[<a href="javascript:gotoPage(${pageNum }+1)">下页</a>]
					</span> <span>[<a href="javascript:gotoPage(${pageCount })">末页</a>]
					</span>
				</p>
			</div>	
				<script type="text/javascript">
					function gotoPage(pageNum){
						if(pageNum > "${pageCount}"){
							pageNum = "${pageCount}"
						}
						if(pageNum < 1){
							pageNum = 1;
						}
						window.location.href="user_list.action?&pageNum=" + pageNum;
					}
				</script>
			</div>
			<div class="fanye">
				<div id="pagination"></div>
			</div>
		</div>
		</div>
		<!--end-->
		<!--footer-->
		<iframe name="control" src="footer.html" scrolling="no"
			frameborder="0" style="width: 100%; height: 100px;"></iframe>
</body>
</html> --%>









<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html>
<html lang="en">
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>辉县市机动车维修站-用户信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/style.css" media="screen"/>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript">
$(function(){
	$(".tablelink1").click(function(){
		var arr=$(this).attr("href").split("=");
		var a=$(this).attr("href");
		var b = a.split("name=");
		if(confirm("确定要删除" + "“ " + b[1]+ "” " +"用户吗？ ")){
			window.location.href = a + pageNum;
			
		}
			return false;
	});
})
</script> 





<style>
*{margin:0px; padding:0px;}
body{margin:0 auto; font-size:12px; color:#666; font-family:"微软雅黑", Simsun;}
li{list-style:none;}
img{border:none;}
a, a:visited{text-decoration:none;}
.tong{ background:url(../images/images/sy-toubjing_03.gif) repeat-x 0px -11px; width:100%; height:40px;}
.wrap{ width:auto; max-width:620px; margin:0 auto;}
.center{ width:103%; margin:0 auto;}
/***************分页******************/
.fenye{ float:left; margin-top:10px;}
.fenye ul{ float:left; margin-left:32px; }
.fenye ul li{ float:left; margin-left:5px;padding: 4px 6px; border:1px solid #ccc;  font-weight:bold; cursor:pointer; color:#999;}
.fenye ul li a{ color:#999;}
.fenye ul li.xifenye{ width:60px; text-align:center; float:left; position:relative;cursor: pointer;}
.fenye ul li .xab{ float:left; position:absolute; width:50px; border:1px solid #ccc; height:100px; overflow-y: auto;overflow-x: hidden;top:-125px; background-color: #fff; display:inline;left:-1px; width:50px;}
.fenye ul li .xab ul{ margin-left:0; padding-bottom:0;}
.fenye ul li .xab ul li{ border:0; padding:4px 0px; color:#999; width:34px; margin-left:0px; text-align:center;}
.main{margin-top:50px;}
</style>




</head>
<body background="images/dotted.png">
    <div class="navbar navbar-default navbar-fixed-top" id="navbar">
        <!--<div class="navbar-container" id="navbar-container">-->
        <!--<div class="navbar-header">-->
        <div class="row">
            <div class="col-xs-4 col-xs-offset-1 col-sm-3 col-md-2 col-lg-2" style="height:100%;margin-left:1%;margin-top:-8px;">
            	<a href="user_addUI" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">添加用户</a>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-6 col-md-offset-3 col-lg-5 col-lg-offset-4" style="margin-top:-8px;">
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">当前位置&nbsp;:&nbsp;信息管理&nbsp;>>&nbsp; 用户管理</a>
                <a href="#" class="navbar-brand" style="font-family:微软雅黑;font-size:12px;">欢迎　${user.name }　登录本系统!</a>
            </div>
        </div>
    </div>
<div id=top-bar>
    <div id=topbar-inner>
    </div>
</div>
<div class="main">
        <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12" style="margin-left:-15;margin-right:-15;">
            <div class="table-responsive">
				<font style="color:red;">${errorMessage }</font><br>
                <table class="table table-striped table-bordered table-hover" style="font-size:12px;">
                    <thead>
                        <tr class="active" >
                            <th>姓名</th>
                            <th>登录名</th>
                            <th>联系方式</th>
                            <th>修改</th>
                            <th>删除</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    	<s:iterator value="recordList">
						<s:if test="loginName != 'admin'">
							<tr id="${id}">
								<td>${name }</td>
								<td>${loginName }</td>
								<td>${phoneNum }</td>
								<td><a href="user_editUI?id=${id }" style="margin-right:10%;"><img src="images/bian.png">&nbsp;&nbsp;修改</a></td>								
								<td>
									<a href="user_delete?id=${id }&name=${name}" class="tablelink1"><img src="images/shan.png">&nbsp;&nbsp;删除</a>
								</td>
							</tr>
						</s:if>
					</s:iterator>
					
					
                      
                    </tbody>
                </table>
            </div>
        </div>
        </div>    
    
        <div class="wrap" style="float:center;">
            <div class="fenye">
                <ul>
                    <li id="diyi">每页显示${pageSize }条，总记录数${recordCount-1 }条</li>
                    <li id="first"><a href="javascript:gotoPage(1)">首页</a></li>
                    <li id="top" onclick="topclick()"><a href="javascript:gotoPage(${pageNum }-1)">上一页</</a></li>
                    <li class="xifenye" id="xifenye">
                        <a id="xiye">${currentPage }</a>/<a id="mo">${pageCount }</a>
                        <div class="xab" id="xab" style="display:none">
                            <ul id="uljia">
                                
                            </ul>
                        </div>
                    </li>
                    <li id="down" onclick="downclick()"><a href="javascript:gotoPage(${pageNum }+1)">下一页</</a></li>
                    <li id="last"><a href="javascript:gotoPage(${pageCount })">尾页</a></li>
                </ul>
            
            </div>
        </div>
</div>    
</div>
<form id="pageForm" action="user_list" method="post">
	<input id="selPag" name="pageNum" type="hidden" />
</form>
		
<script type="text/javascript" src="js/jquery.paginate.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<script type="text/javascript">
	function gotoPage(pageNum){
		if(pageNum > "${pageCount}"){
			pageNum = "${pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}
		
		window.location.href="user_list.action?&pageNum=" + pageNum;
	}					
</script>		
</body>
</html>







