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
<form class="layui-form" lay-filter="form_role">
  <div class="layui-form-item">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-inline">
      <input type="text" name="roleName" required  lay-verify="required|checkRoleName" placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div> 
  <div class="layui-form-item">
    <label class="layui-form-label">角色级别</label>
    <div class="layui-input-block">
      <input type="radio" name="roleKind" value="0" title="普通角色">
      <input type="radio" name="roleKind" value="1" title="超级角色" checked>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">角色简介</label>
    <div class="layui-input-block">
      <textarea name="roleInfo" placeholder="角色简介" class="layui-textarea"></textarea>
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
 
  form.verify({
	  checkRoleName:function(value,item){
		  var msg;
		  $.ajax({
			  type:'get',
			  async:false,
			  url:'role/check',
			  data:{"roleName":value},
			  success:function(result){
				  if(result){
					  msg="此角色名已被占用"
				  }
			  }
		  });
		  return msg;
	  }
	  }); 
  
  form.on('submit(formDemo)',function(){
	  data=form.val('form_role');
	  console.log(data);
	  $.ajax({
		  type:'post',
		  url:'role',
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