<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
<form class="layui-form" lay-filter="form_user">
  <div class="layui-form-item">
    <label class="layui-form-label">学生姓名</label>
    <div class="layui-input-inline">
      <input type="text" name="stuName" required  lay-verify="required|checkStuName" placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">学生年龄</label>
    <div class="layui-input-inline">
      <input type="text" name="stuAge" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">`
    <label class="layui-form-label">生日</label>
    <div class="layui-input-inline">
      <input  name="StuBirth" id="StuBirthDay" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">爱好</label>
    <div class="layui-input-block">
      <input type="checkbox" name="like[write]" title="写作">
      <input type="checkbox" name="like[read]" title="阅读" checked>
      <input type="checkbox" name="like[dai]" title="发呆">
    </div>
  </div> 
  <div class="layui-form-item">
    <label class="layui-form-label">单选框</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="1" title="男">
      <input type="radio" name="sex" value="0" title="女" checked>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <input class="layui-btn" lay-submit lay-filter="formDemo" value="提交">
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>

<script src="assert/layui/layui.js"></script>
<script>
//一般直接写在一个js文件中
layui.use(['layer', 'form','laydate'], function(){
 var layer = layui.layer
  ,form = layui.form,laydate=layui.laydate
  ,$=layui.$;
 
  
  laydate.render({
	 elem:'#StuBirthDay'
 });
  form.verify({
	  checkStuName:function(value,item){
		  var msg;
		  $.ajax({
			  type:'get',
			  async:false,
			  url:'student/check',
			  data:{"stuName":value},
			  success:function(result){
				  if(result==1){
					  msg="此名称已有人使用"
				  }
			  }
		  });
		  return msg;
	  }
	  });
  
  form.on('submit(formDemo)',function(){
	  data=form.val('form_user');
	  console.log(data);
	  $.ajax({
		  type:'post',
		  url:'student',
		  data:data,
		  success:function(result){
			  if(result){
				  layer.msg("提交成功了");
			  }
		  }
	  });
  });
});
</script> 
</body>
</html>