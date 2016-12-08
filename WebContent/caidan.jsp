<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>caidan</title>
</head>
<style type="text/css">
body{margin:0 auto;padding-left:1px;overflow-x:hidden;}
html, body{height:100%; }
img{border:none;}
*{font-family:'微软雅黑';font-size:15px;color:#20634d;}
dl,dt,dd{display:block;margin-left:-3%;margin:0 0 0 -3%;}
a{text-decoration:none;}
.container{width:100%;height:100%;margin:auto;}

/*left*/
.leftsidebar_box{
    width:230px;
    height:auto !important;
    overflow:visible !important;
    height:100% !important;
    background-color:#21232c;
    padding-left:16px;
    }
.line{
    height:24px;
    width:100%;
    background-image:url(images/line_bg.png);
    background-repeat:repeat-x;
    }
.leftsidebar_box dt{
    padding-left:16%;
    padding-right:10px;
    background-repeat:no-repeat;
    background-position:10px center;
    color:#f5f5f5;
    font-size:15px;
    position:relative;
    line-height:48px;
    cursor:pointer;
    }
.leftsidebar_box dd{
    font-size:13px;
    background-color:#494c55;
    padding-left:19%;
    }
.leftsidebar_box dd a{
    color:#f5f5f5;
    line-height:38px;
    }
.leftsidebar_box dt img{
    position:absolute;
    right:34%;
    top:20px;
    }
.system_log dt{
    background-image:url(images/system.png);
    }
.custom dt{
    background-image:url(images/custom.png);
    }
.channel dt{
    background-image:url(images/channel.png);
    }
.app dt{
    background-image:url(images/app.png);
    }
.cloud dt{
    background-image:url(images/cloud.png);
    }
.syetem_management dt{
    background-image:url(images/syetem_management.png);
    }
.source dt{
    background-image:url(images/source.png); 
    }
.statistics dt{
    background-image:url(images/statistics.png);
    }
.leftsidebar_box dl dd:last-child{padding-bottom:10px;}
</style>

</head>

<body id="bg">

<div class="container">

    <div class="leftsidebar_box">
        <div class="line"></div>
        <dl class="system_log">
                <dt onClick="changeImage()">信息录入<img src="images/select_xl01.png"></dt>
                <dd class="first_dd"><a href="<%=basePath %>carInformation_put.action" target="right">车辆信息录入</a></dd>
                <dd><a href="<%=basePath %>repairInformation_input.action" target="right">维护信息录入</a></dd>
            </dl>
        
            <dl class="custom">
                <dt onClick="changeImage()">信息管理<img src="images/select_xl01.png"></dt>
                <dd class="first_dd"><a href="user_updatePasswordUI?id=${user.id}" target="right">修改密码</a></dd>
                <dd><a href="user_info?id=${user.id}" target="right">查看个人信息</a></dd>
                <s:if test="#session.user.loginName =='admin'" >
					<dd><a href="user_list" target="right">用户管理</a></dd>
				</s:if>
                
            </dl>
        
            <dl class="channel">
                <dt>查询<img src="images/left/select_xl01.png"></dt>
                <dd class="first_dd"><a href="repairInformation_query?currentPage=1" target="right">维护历史</a></dd>
                <dd><a href="car_expire?currentPage=1" target="right">到期查询</a></dd>
                <dd><a href="<%=basePath %>carInformation_seeAllCarInformation.action?currentPage=1" target="right">车辆信息查询</a></dd>
            </dl>
        
            <dl class="app">
                <dt onClick="changeImage()">使用说明<img src="images/select_xl01.png"></dt>
                <dd><a href="useintroduce.html" target="right">使用说明</a></dd>
            </dl>
            
            <dl class="cloud">
                <dt>注销登录<img src="images/select_xl01.png"></dt>
                <dd><a href="user_logout" onclick="javascript:if(confirm('确定要注销吗？')) { return true;}else{return false;};">注销登录</a></dd>
            </dl>
    </div>

</div>

<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript">
$(".leftsidebar_box dt").css({"background-color":"#21232c"});
$(".leftsidebar_box dt img").attr("src","images/select_xl01.png");
$(function(){
    $(".leftsidebar_box dd").hide();
    $(".leftsidebar_box dt").click(function(){
        $(".leftsidebar_box dt").css({"background-color":"#21232c"})
        $(this).css({"background-color": "#494c55"});
        $(this).parent().find('dd').removeClass(("menu_chioce"),6000);
        $(".leftsidebar_box dt img").attr("src","images/select_xl01.png");
        $(this).parent().find('img').attr("src","images/select_xl01.png");
        $(".menu_chioce").slideUp();
        $(this).parent().find('dd').slideToggle();
    $(this).parent().find('dd').addClass("menu_chioce");
})
})
</script>
</body>
</html>