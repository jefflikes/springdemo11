
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>lipreading-showvideo</title>
  <meta name="description" content="Preview and upload video.">
  <!-- Bootstrap styles -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- Generic page styles -->
  <link rel="stylesheet" href="static/css/style.css">
  <!-- blueimp Gallery styles -->
  <link rel="stylesheet" href="https://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
  <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
  <link rel="stylesheet" href="static/css/jquery.fileupload.css">
  <link rel="stylesheet" href="static/css/jquery.fileupload-ui.css">
  <!-- CSS adjustments for browsers with JavaScript disabled -->
  <noscript><link rel="stylesheet" href="static/css/jquery.fileupload-noscript.css"></noscript>
  <noscript><link rel="stylesheet" href="static/css/jquery.fileupload-ui-noscript.css"></noscript>
</head>
<body>
<div class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-fixed-top .navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand">唇语识别</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href=" ">产品介绍</a></li>
        <li><a href=" ">应用场景</a></li>
        <li><a href="  ">联系我们</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="container">
  <h1>Lipreading  </h1>
  <h2 class="lead">Change your life</h2>

  <br>
  <blockquote>
    <p>唇语识别，即借助人工智能识别人类动态无声唇语的黑科技
      <br>
      这项技术的实现能够使我们生活中的设备更加智能便利<br>
      快上传你的正面唇读视频在线体验唇读功能</p>
  </blockquote>
  <br>
  <!-- The file upload form used as target for the file upload widget -->
  <form action="./upLoadFile.do" method="POST" enctype="multipart/form-data">
    <!-- Redirect browsers with JavaScript disabled to the origin page -->
    <!--  <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript> -->
    <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
    <div class="row fileupload-buttonbar">
      <div class="col-lg-7">
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="btn btn-success fileinput-button">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>Add files...</span>
                    <%--<input type="file" name="files[]" multiple>--%>
                    <input type="file" name="file"/>
                </span>
        <%--<input type="submit" value="提交">--%>
        <input type="submit" value="提交"/>
        <button type="submit" class="btn btn-primary start">
          <i class="glyphicon glyphicon-upload"></i>
          <span>Start upload</span>
        </button>
        <button type="reset" class="btn btn-warning cancel">
          <i class="glyphicon glyphicon-ban-circle"></i>
          <span>Cancel upload</span>
        </button>
        <button type="button" class="btn btn-danger delete">
          <i class="glyphicon glyphicon-trash"></i>
          <span>Delete</span>
        </button>
        <input type="checkbox" class="toggle">
        <!-- The global file processing state -->
        <!-- <span class="fileupload-process"></span> -->
      </div>
      <!-- The global progress state -->
      <div class="col-lg-5 fileupload-progress fade">
        <!-- The global progress bar -->
        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
          <div class="progress-bar progress-bar-success" style="width:0%;"></div>
        </div>
        <!-- The extended global progress state -->
        <div class="progress-extended">&nbsp;</div>
      </div>
    </div>
    <!-- The table listing the files available for upload/download -->
    <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
  </form>
  <br>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">识别结果</h3>
    </div>
    <div class="panel-body">
      显示对视频中唇语的识别结果（用ajax,json和后台结合）
    </div>
  </div>

  <br>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">上传注意</h3>
    </div>
    <div class="panel-body">
      <ul>
        <li>上传视频需仅包含所识别人物的正面影像.</li>
        <li>请保持人物的说话唇形完全包含在所上传的视频中</li>
        <li>请保持所上传视频中人物的面部和唇部清晰.</li>
        <li>请上传视频文件，包括： <strong>MP4，avi,rmvb,wmv等</strong> .</li>
        <li>请保持所上传的视频时长在20min以下。</li>

      </ul>
    </div>
  </div>
</div>
<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
  <div class="slides"></div>
  <h3 class="title"></h3>
  <a class="prev">‹</a>
  <a class="next">›</a>
  <a class="close">×</a>
  <a class="play-pause"></a>
  <ol class="indicator"></ol>
</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<script src="static/js/jquery.min.js"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="static/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="https://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="https://blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="https://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- blueimp Gallery script -->
<script src="https://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="static/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="static/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="static/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="static/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="static/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="static/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="static/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="static/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="static/js/main.js"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="static/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
</body>
</html>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
  <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="./upLoadFile.do" method="post" enctype="multipart/form-data">--%>
  <%--选择文件：<input type="file" name="file"/>--%>
  <%--<input type="submit" value="提交"/>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>
&lt;%&ndash;<%@ page contentType="text/html;charset=UTF-8" language="java" %>&ndash;%&gt;--%>
<%--<html>--%>
  <%--<head>--%>
    <%--<title>IDEA搭建SpringMVC并用maven配置的小例子</title>--%>
  <%--</head>re--%>
  <%--&lt;%&ndash;<link rel="stylesheet" href="/asset/css/style.css"/>&ndash;%&gt;--%>
  <%--<script type="text/javascript" src="/static/js/jquery.min.js"></script>--%>

  <%--<body>--%>
        <%--<form id="userForm" action="/user/find" method="post">--%>
          <%--用户名：<input type="text" name="username"><br>--%>
          <%--密码：<input type="password" name="password">--%>
          <%--<button type="button" onclick="login()">登录</button>--%>
        <%--</form>--%>
  <%--</body>--%>
<%--<script>--%>
    <%--function login() {--%>
        <%--$.ajax({--%>
            <%--type: 'post',--%>
<%--//            url: $('#userForm').attr('action'),--%>
            <%--url:"user/find",--%>
<%--//            data: $('#userForm').serialize(),--%>
            <%--data:$('#userForm').serialize(),--%>
            <%--dataType: 'json',--%>
            <%--success:function(data){--%>
                <%--if (data.result = "success"){--%>
                    <%--alert("登录成功");--%>
                    <%--location.href='user/success';--%>
                <%--}else{--%>
                    <%--alert("用户名或者密码错误！");--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>


<%--</script>--%>
<%--</html>--%>
<%--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">--%>
<%--<html>--%>
<%--<head>--%>
  <%--<title>login test</title>--%>
  <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
  <%--<meta http-equiv="pragma" content="no-cache">--%>
  <%--<meta http-equiv="cache-control" content="no-cache">--%>
  <%--<meta http-equiv="expires" content="0">--%>
  <%--<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">--%>
  <%--<meta http-equiv="description" content="ajax方式">--%>
  <%--<script src="static/js/jquery.min.js"></script>--%>
  <%--<script type="text/javascript">--%>
      <%--function login() {--%>
          <%--$.ajax({--%>
              <%--//几个参数需要注意一下--%>
              <%--type: "POST",//方法类型--%>
              <%--dataType: "json",//预期服务器返回的数据类型--%>
              <%--url: "localhost:8080/springdemo3/user/find",//url--%>
              <%--data: $('#form1').serialize(),--%>
              <%--success: function (result) {--%>
                  <%--console.log(result);//打印服务端返回的数据(调试用)--%>
                  <%--if (result.resultCode == 200) {--%>
                      <%--alert("SUCCESS");--%>
                  <%--}--%>
                  <%--;--%>
              <%--},--%>
              <%--error : function() {--%>
                  <%--alert("异常！");--%>
              <%--}--%>
          <%--});--%>
      <%--}--%>
  <%--</script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="form-div">--%>
  <%--<form id="form1" onsubmit="return false" action="/user/find" method="post">--%>
    <%--<p>用户名：<input name="userName" type="text" id="txtUserName" tabindex="1" size="15" value=""/></p>--%>
    <%--<p>密　码：<input name="password" type="password" id="TextBox2" tabindex="2" size="16" value=""/></p>--%>
    <%--<p><input type="button" value="登录" onclick="login()">&nbsp;<input type="reset" value="重置"></p>--%>
  <%--</form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>