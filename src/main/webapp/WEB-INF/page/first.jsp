<%--<!DOCTYPE html>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
    <%--<title>在线体验</title>--%>
    <%--&lt;%&ndash;<link rel="stylesheet" type="text/css" href="static/css/showvideo.css">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<link rel="stylesheet" href="style.css">&ndash;%&gt;--%>
    <%--<style type="text/css">--%>
        <%--#result{--%>
            <%--width:80px;--%>
            <%--height:80px;--%>
        <%--}--%>
    <%--</style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<!-- 功能演示-->--%>
<%--<div class="demo-content"> <!-- 功能演示整体div -->--%>
    <%--<div class="uploadvideo">  <!-- 表单div -->--%>
        <%--<input type="file" id="v_file" onchange="play()"  name="myfiles"/>--%>
        <%--<label  for="v_file"  class="button button-glow button-rounded button-action button1">添加本地视频</label>--%>
        <%--<button type="submit" class="button button-glow button-rounded button-action  button3" onclick="ajaxFileUpload()">上传</button>--%>
    <%--</div>--%>
    <%--<div id="sign"></div>--%>
    <%--<div class="showUI">  <!-- 预览视频和结果 -->--%>
        <%--<div class="videoUI">  <!-- 播放器div -->--%>
            <%--<video src="static/video/2.mp4" id="video_id" controls="controls"></video>--%>
        <%--</div>--%>
        <%--<div class="result">--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<script src="static/js/jquery-3.2.1.min.js"></script>--%>
<%--<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>--%>

<%--<script>--%>
    <%--function play(){--%>
        <%--var file = document.getElementById('v_file').files[0];--%>
        <%--var url = URL.createObjectURL(file);--%>
        <%--console.log(url);--%>
        <%--document.getElementById("video_id").src = url;--%>
    <%--}--%>

    <%--function ajaxFileUpload(){--%>
        <%--//开始上传文件时显示一个图片,文件上传完成将图片隐藏--%>
        <%--//$("#loading").ajaxStart(function(){$(this).show();}).ajaxComplete(function(){$(this).hide();});--%>
        <%--//执行上传文件操作的函数--%>
        <%--$.ajaxFileUpload({--%>
            <%--//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)--%>
            <%--// url:'./test/fileUpload?uname=玄玉',--%>
            <%--url:'/upLoadFile.do',--%>
            <%--secureuri:false,                           //是否启用安全提交,默认为false--%>
            <%--fileElementId:'v_file',               //文件选择框的id属性--%>
            <%--dataType:'text',                           //服务器返回的格式,可以是json或xml等--%>

            <%--headers:{--%>
                <%--speciLan:"ch",--%>
                <%--devicetype:"web",--%>
                <%--userKey:1234--%>
            <%--},--%>

            <%--success:function(data, status){            //服务器响应成功时的处理函数--%>
                <%--data = data.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀--%>
                <%--data = data.replace(/<PRE.*?>/g, '');--%>
                <%--data = data.replace("<PRE>", '');--%>
                <%--data = data.replace("</PRE>", '');--%>
                <%--data = data.replace("<pre>", '');--%>
                <%--data = data.replace("</pre>", '');     //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]--%>
                <%--if(data.substring(0, 1) == 0){         //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)--%>
                    <%--// $("img[id='uploadImage']").attr("src", data.substring(2));--%>
                    <%--$('#sign').html("视频上传成功，请等待识别<br/>");--%>
                    <%--var msg=jQuery.parseJSON(msg);--%>
                    <%--alert(msg);--%>
                    <%--document.getElementById("result").innerHTML="msg";--%>
                <%--}else{--%>
                    <%--$('#sign').html('视频上传失败，请重试！！');--%>
                <%--}--%>
            <%--},--%>
            <%--error:function(data, status, e){ //服务器响应失败时的处理函数--%>
                <%--// language=JQuery-CSS--%>
                <%--$('#sign').html('视频上传失败，请重试！！');--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>

<%--</script>--%>

<%--</body>--%>
<%--</html>--%>
<%--<html>--%>
<%--<body>--%>
<%--<h2>hello world！</h2>--%>
<%--</body>--%>
<%--</html>--%>

<%--<!DOCTYPE html>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java"  %>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="./upLoadFile.do" method="post" enctype="multipart/form-data">--%>
    <%--Choose File:<input type="file" name="file"/>--%>
    <%--<input type="submit" value="提交"/>--%>
<%--<%=request.getAttribute("result")%>--%>
<%--</body>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'first.jsp' starting page</title>

    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
//        $.post("http://localhost:8080/springdemo3/upLoadFile.do",function(data){
//            if (data.status=="success"){
//                alert(data.word);
//                alert("123");

//            },"json"
//            a = JSON.parseObject(data, String.class);
//            alert(""+data);
            <%--$("#btn").click(function(){--%>
                <%--$.ajax({--%>
                    <%--url:"<%=path%>/upLoadFile.do",--%>
                    <%--$.get()--%>
                    <%--success:function(data){ //data指的是从server打印到浏览器的数据--%>
<%--//                        jsonString jsonObject--%>
<%--//                        {"001":{"age":122,"name":"顺利就业"}}--%>
                        <%--var result= eval("("+data+")");--%>
                        <%--$.each(result,function(i,dom){--%>
                            <%--alert(dom.result+"\n");--%>
                        <%--});--%>
                        <%--//  alert(result["001"]["age"]);--%>
                    <%--}--%>
                <%--});--%>
//            });
//        });


    </script>
</head>
<body>
<input type="button" value="ajax" id="btn"/>
<div id="result"></div>
</body>


<head>

    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
</head>

<body>
<form id='uf' action='./upLoadFile.do' method="post" enctype="multipart/form-data">
    Choose File:<input type="file" name="file"/>
    <input type="submit" value="提交"/>
    <input type="button" value="上传" onclick="upload()"/>
    <script type="text/javascript">
    $("#uf").on("submit", function(event){
        var form = this;
        var fd = new FormData(form);
    $.ajax({
    url: this.action,
    type: 'post',
    data:fd,
    dataType:'json',
    async:true,
    processData:false,
    contentType:false,
    success: function(data){
    $("#result").html(data.word)
    alert(data.status)

    }

    });
    return false;
    }
    );
    </script>
        <%--<%=request.getAttribute("result")%>--%
    <<script !src=""></script>

</body>
</html>
</br> </br>  <form action="./downLoadFile.do"style="border:1px solid grey;width:auto;" method="post">
    文件名：<input type="text" name="name"/></br></br>
    文件路径：<input type="text" name="filePath"/></br></br>
    <input type="submit" value="确认下载"/>
</form>


<%--<!DOCTYPE html>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
    <%--&lt;%&ndash;<meta http-equiv="Access-Control-Allow-Origin" content="*">&ndash;%&gt;--%>
    <%--<title>Document</title>--%>

    <%--<style type="text/css" >--%>
        <%--#output1{--%>
            <%--width: 100px;--%>
            <%--height:50px;--%>
        <%--}--%>
    <%--</style>--%>
    <%--<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>--%>
    <%--<!-- <script src="jquery.min.js"></script> -->--%>
    <%--<script src="static/jquery.form.js" type="text/javascript"></script>--%>
    <%--<script type="text/javascript">--%>
        <%--$(document).ready(function() {--%>
            <%--$('#tf').ajaxForm(function() {--%>
                <%--$('#output1').html("提交成功！欢迎下次再来！").show();--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="uploadvideo">  <!-- 表单div -->--%>

    <%--<form  id="tf" action="./upLoadFile.do" method="post" enctype="multipart/form-data">--%>
        <%--<input type="file" id="v_file" onchange="play()"  name="file"/>--%>
        <%--<!-- <div class="button-group"> -->--%>
        <%--<label  for="v_file"  class="button button-glow button-rounded button-action button1">添加本地视频</label>--%>
        <%--<button type="button" class="button button-glow button-rounded button-action button2" onclick="cancel()">取消</button>--%>
        <%--<button type="submit" class="button button-glow button-rounded button-action  button3" >上传</button>--%>
        <%--<!-- </div> -->--%>
        <%--<div id="output1" style="display:none;"></div>--%>
    <%--</form>--%>
<%--</div>--%>

<%--<div class="videoUI">  <!-- 播放器div -->--%>
    <%--<video src="" id="video_id" controls="controls"></video>--%>
<%--</div>--%>

<%--<script>--%>
    <%--function play(){--%>
        <%--var file = document.getElementById('v_file').files[0];--%>
        <%--var url = URL.createObjectURL(file);--%>
        <%--console.log(url);--%>
        <%--document.getElementById("video_id").src = url;--%>
    <%--}--%>
<%--</script>--%>

<%--</body>--%>

<%--</html>--%>

<%--<!DOCTYPE html>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="./upLoadFile.do" method="post"  enctype="multipart/form-data">--%>

    <%--Choose File:<input type="file" id="v_file" onchange="play()"  name="file"/>--%>
    <%--<video id="video_id" controls autoplay></video>--%>
    <%--<input type="submit" value="提交"/>--%>
<%--</form>--%>
<%--<script>--%>
    <%--function play(){--%>
        <%--var file = document.getElementById('v_file').files[0];--%>
        <%--var url = URL.createObjectURL(file);--%>
        <%--console.log(url);--%>
        <%--document.getElementById("video_id").src = url;--%>

    <%--}--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
<%--</br> </br>  <form action="./downLoadFile.do"style="border:1px solid grey;width:auto;" method="post">    文件名：<input type="text" name="name"/></br></br>    文件路径：<input type="text" name="filePath"/></br></br>    <input type="submit" value="确认下载"/>  </form>--%>



<%--<!DOCTYPE HTML>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html lang="en">--%>
<%--<head>--%>
    <%--<meta charset="utf-8">--%>
    <%--<title>lipreading-showvideo</title>--%>
    <%--<meta name="description" content="Preview and upload video.">--%>
    <%--<!-- Bootstrap styles -->--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <%--<!-- Generic page styles -->--%>
    <%--<link rel="stylesheet" href="static/css/style.css">--%>
    <%--<!-- blueimp Gallery styles -->--%>
    <%--<link rel="stylesheet" href="https://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">--%>
    <%--<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->--%>
    <%--<link rel="stylesheet" href="static/css/jquery.fileupload.css">--%>
    <%--<link rel="stylesheet" href="static/css/jquery.fileupload-ui.css">--%>
    <%--<!-- CSS adjustments for browsers with JavaScript disabled -->--%>
    <%--<noscript><link rel="stylesheet" href="static/css/jquery.fileupload-noscript.css"></noscript>--%>
    <%--<noscript><link rel="stylesheet" href="static/css/jquery.fileupload-ui-noscript.css"></noscript>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="navbar navbar-default navbar-fixed-top">--%>
    <%--<div class="container">--%>
        <%--<div class="navbar-header">--%>
            <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-fixed-top .navbar-collapse">--%>
                <%--<span class="icon-bar"></span>--%>
                <%--<span class="icon-bar"></span>--%>
                <%--<span class="icon-bar"></span>--%>
            <%--</button>--%>
            <%--<a class="navbar-brand">唇语识别</a>--%>
        <%--</div>--%>
        <%--<div class="navbar-collapse collapse">--%>
            <%--<ul class="nav navbar-nav">--%>
                <%--<li><a href=" ">产品介绍</a></li>--%>
                <%--<li><a href=" ">应用场景</a></li>--%>
                <%--<li><a href="  ">联系我们</a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<div class="container">--%>
    <%--<h1>Lipreading  </h1>--%>
    <%--<h2 class="lead">Change your life</h2>--%>

    <%--<br>--%>
    <%--<blockquote>--%>
        <%--<p>唇语识别，即借助人工智能识别人类动态无声唇语的黑科技--%>
            <%--<br>--%>
            <%--这项技术的实现能够使我们生活中的设备更加智能便利<br>--%>
            <%--快上传你的正面唇读视频在线体验唇读功能</p>--%>
    <%--</blockquote>--%>
    <%--<br>--%>
    <%--<!-- The file upload form used as target for the file upload widget -->--%>
    <%--<form id="fileupload" action="./upLoadFile.do" method="POST" enctype="multipart/form-data">--%>
        <%--<!-- Redirect browsers with JavaScript disabled to the origin page -->--%>
        <%--<!--  <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript> -->--%>
        <%--<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->--%>
        <%--<div class="row fileupload-buttonbar">--%>
            <%--<div class="col-lg-7">--%>
                <%--<!-- The fileinput-button span is used to style the file input field as button -->--%>
                <%--&lt;%&ndash;<span class="btn btn-success fileinput-button">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<i class="glyphicon glyphicon-plus"></i>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<span>Add files...</span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<input type="file" name="files[]" multiple>&ndash;%&gt;--%>
                <%--<input type="file" name="file"/>--%>
                <%--&lt;%&ndash;</span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<input type="submit" value="提交">&ndash;%&gt;--%>
                <%--<input type="submit" value="提交"/>--%>
                <%--<button type="submit" class="btn btn-primary start">--%>
                    <%--<i class="glyphicon glyphicon-upload"></i>--%>
                    <%--<span>Start upload</span>--%>
                <%--</button>--%>
                <%--<button type="reset" class="btn btn-warning cancel">--%>
                    <%--<i class="glyphicon glyphicon-ban-circle"></i>--%>
                    <%--<span>Cancel upload</span>--%>
                <%--</button>--%>
                <%--<button type="button" class="btn btn-danger delete">--%>
                    <%--<i class="glyphicon glyphicon-trash"></i>--%>
                    <%--<span>Delete</span>--%>
                <%--</button>--%>
                <%--<input type="checkbox" class="toggle">--%>
                <%--<!-- The global file processing state -->--%>
                <%--<!-- <span class="fileupload-process"></span> -->--%>
            <%--</div>--%>
            <%--<!-- The global progress state -->--%>
            <%--<div class="col-lg-5 fileupload-progress fade">--%>
                <%--<!-- The global progress bar -->--%>
                <%--<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">--%>
                    <%--<div class="progress-bar progress-bar-success" style="width:0%;"></div>--%>
                <%--</div>--%>
                <%--<!-- The extended global progress state -->--%>
                <%--<div class="progress-extended">&nbsp;</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<!-- The table listing the files available for upload/download -->--%>
        <%--<table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>--%>
    <%--</form>--%>
    <%--<br>--%>
    <%--<div class="panel panel-default">--%>
        <%--<div class="panel-heading">--%>
            <%--<h3 class="panel-title">识别结果</h3>--%>
        <%--</div>--%>
        <%--<div class="panel-body">--%>
            <%--显示对视频中唇语的识别结果（用ajax,json和后台结合）--%>
        <%--</div>--%>
    <%--</div>--%>

    <%--<br>--%>

    <%--<div class="panel panel-default">--%>
        <%--<div class="panel-heading">--%>
            <%--<h3 class="panel-title">上传注意</h3>--%>
        <%--</div>--%>
        <%--<div class="panel-body">--%>
            <%--<ul>--%>
                <%--<li>上传视频需仅包含所识别人物的正面影像.</li>--%>
                <%--<li>请保持人物的说话唇形完全包含在所上传的视频中</li>--%>
                <%--<li>请保持所上传视频中人物的面部和唇部清晰.</li>--%>
                <%--<li>请上传视频文件，包括： <strong>MP4，avi,rmvb,wmv等</strong> .</li>--%>
                <%--<li>请保持所上传的视频时长在20min以下。</li>--%>

            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!-- The blueimp Gallery widget -->--%>
<%--<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">--%>
    <%--<div class="slides"></div>--%>
    <%--<h3 class="title"></h3>--%>
    <%--<a class="prev">‹</a>--%>
    <%--<a class="next">›</a>--%>
    <%--<a class="close">×</a>--%>
    <%--<a class="play-pause"></a>--%>
    <%--<ol class="indicator"></ol>--%>
<%--</div>--%>
<%--<!-- The template to display files available for upload -->--%>
<%--<script id="template-upload" type="text/x-tmpl">--%>
<%--{% for (var i=0, file; file=o.files[i]; i++) { %}--%>
    <%--<tr class="template-upload fade">--%>
        <%--<td>--%>
            <%--<span class="preview"></span>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<p class="name">{%=file.name%}</p>--%>
            <%--<strong class="error text-danger"></strong>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<p class="size">Processing...</p>--%>
            <%--<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--{% if (!i && !o.options.autoUpload) { %}--%>
                <%--<button class="btn btn-primary start" disabled>--%>
                    <%--<i class="glyphicon glyphicon-upload"></i>--%>
                    <%--<span>Start</span>--%>
                <%--</button>--%>
            <%--{% } %}--%>
            <%--{% if (!i) { %}--%>
                <%--<button class="btn btn-warning cancel">--%>
                    <%--<i class="glyphicon glyphicon-ban-circle"></i>--%>
                    <%--<span>Cancel</span>--%>
                <%--</button>--%>
            <%--{% } %}--%>
        <%--</td>--%>
    <%--</tr>--%>
<%--{% } %}--%>
<%--</script>--%>
<%--<!-- The template to display files available for download -->--%>
<%--<script id="template-download" type="text/x-tmpl">--%>
<%--{% for (var i=0, file; file=o.files[i]; i++) { %}--%>
    <%--<tr class="template-download fade">--%>
        <%--<td>--%>
            <%--<span class="preview">--%>
                <%--{% if (file.thumbnailUrl) { %}--%>
                    <%--<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>--%>
                <%--{% } %}--%>
            <%--</span>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<p class="name">--%>
                <%--{% if (file.url) { %}--%>
                    <%--<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>--%>
                <%--{% } else { %}--%>
                    <%--<span>{%=file.name%}</span>--%>
                <%--{% } %}--%>
            <%--</p>--%>
            <%--{% if (file.error) { %}--%>
                <%--<div><span class="label label-danger">Error</span> {%=file.error%}</div>--%>
            <%--{% } %}--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<span class="size">{%=o.formatFileSize(file.size)%}</span>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--{% if (file.deleteUrl) { %}--%>
                <%--<button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>--%>
                    <%--<i class="glyphicon glyphicon-trash"></i>--%>
                    <%--<span>Delete</span>--%>
                <%--</button>--%>
                <%--<input type="checkbox" name="delete" value="1" class="toggle">--%>
            <%--{% } else { %}--%>
                <%--<button class="btn btn-warning cancel">--%>
                    <%--<i class="glyphicon glyphicon-ban-circle"></i>--%>
                    <%--<span>Cancel</span>--%>
                <%--</button>--%>
            <%--{% } %}--%>
        <%--</td>--%>
    <%--</tr>--%>
<%--{% } %}--%>
<%--</script>--%>
<%--<script src="static/js/jquery.min.js"></script>--%>
<%--<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->--%>
<%--<script src="static/js/vendor/jquery.ui.widget.js"></script>--%>
<%--<!-- The Templates plugin is included to render the upload/download listings -->--%>
<%--<script src="https://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>--%>
<%--<!-- The Load Image plugin is included for the preview images and image resizing functionality -->--%>
<%--<script src="https://blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>--%>
<%--<!-- The Canvas to Blob plugin is included for image resizing functionality -->--%>
<%--<script src="https://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>--%>
<%--<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<%--<!-- blueimp Gallery script -->--%>
<%--<script src="https://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>--%>
<%--<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->--%>
<%--<script src="static/js/jquery.iframe-transport.js"></script>--%>
<%--<!-- The basic File Upload plugin -->--%>
<%--<script src="static/js/jquery.fileupload.js"></script>--%>
<%--<!-- The File Upload processing plugin -->--%>
<%--<script src="static/js/jquery.fileupload-process.js"></script>--%>
<%--<!-- The File Upload image preview & resize plugin -->--%>
<%--<script src="static/js/jquery.fileupload-image.js"></script>--%>
<%--<!-- The File Upload audio preview plugin -->--%>
<%--<script src="static/js/jquery.fileupload-audio.js"></script>--%>
<%--<!-- The File Upload video preview plugin -->--%>
<%--<script src="static/js/jquery.fileupload-video.js"></script>--%>
<%--<!-- The File Upload validation plugin -->--%>
<%--<script src="static/js/jquery.fileupload-validate.js"></script>--%>
<%--<!-- The File Upload user interface plugin -->--%>
<%--<script src="static/js/jquery.fileupload-ui.js"></script>--%>
<%--<!-- The main application script -->--%>
<%--<script src="static/js/main.js"></script>--%>
<%--<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->--%>
<%--<!--[if (gte IE 8)&(lt IE 10)]>--%>
<%--<script src="static/js/cors/jquery.xdr-transport.js"></script>--%>
<%--<![endif]-->--%>
<%--</body>--%>
<%--</html>--%>