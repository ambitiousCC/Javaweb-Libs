<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>实验1</title>
<style type="text/css">
.must {
	color: red;
}
.title{
	color:red;
	font-size: 2.5em;
	font-weight: bold;
	text-shadow: 2px 2px 2px orange;
}
</style>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<form action="" method="post">
		<table align="center">
			<caption class="title">用户注册</caption>
			<tr>
				<td align="right">
					<span class="must">*</span>用户名：
				</td>
				<td>
					<input type="text" name="name" class="edit"/>
				</td>
				<td>用户名由3-5个字符组成</td>
			</tr>
			<tr>
				<td align="right">
					<span class="must">*</span>密码：
				</td>
				<td>
					<input type="password" name="password" class="edit"/>
				</td>
				<td>请输入8-12位密码</td>
			</tr>
			<tr>
				<td align="right">
					<span class="must">*</span>确认密码：
				</td>
				<td>
					<input type="password" name="confirm" class="edit"/>
				</td>
				<td>两次密码不一致</td>
			</tr>
			<tr>
				<td align="right">
					<span class="must">*</span>Email：
				</td>
				<td>
					<input type="text" name="email" class="edit"/>
				</td>
				<td>格式：xxxxxxxx@163.com</td>
			</tr>
			<tr>
				<td align="right">
					<span class="must">*</span>手机号码：
				</td>
				<td>
					<input type="text" name="tel" class="edit"/>
				</td>
				<td>格式示例：13803780000</td>
			</tr>
			<tr>
				<td align="right">
					<span class="must">*</span>真实姓名：
				</td>
				<td>
					<input type="text" name="realName" class="edit"/>
				</td>
				<td>由2-5个中文组成</td>
			</tr>
			<tr>
				<td align="right">
					<span class="must">*</span>省份：
				</td>
				<td colspan="2">
					<select>
						<option value="0">--请选择--</option>
						<option value="1">北京</option>
						<option value="2">河南</option>
						<option value="3">湖南</option>
					</select>请选择省份
				</td>
			</tr>
			<tr>
				<td align="right">
					<span class="must">*</span>技术方向：
				</td>
				<td colspan="2">
					<input type="radio" name="type" value="Java" checked />Java
					<input type="radio" name="type" value=".Net" />.Net
					<input type="radio" name="type" value="PHP" />PHP
					<input type="radio" name="type" value="Web" />网页
					<input type="radio" name="type" value="IOS" />IOS
					<input type="radio" name="type" value="Android" />Android
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="注册" />
					<input type="reset" value="重置" />
				</td>
			</tr>
		</table>
	</form>

<script type="text/javascript">
$(function(){
	var regName=/^\S{3,5}$/;//校验用户名
	var regPassword=/^\w{8,12}$/;//校验密码
	var regEmail=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;//校验邮箱
	var regTel=/^1[3,4,5,7,8]\d{9}$/;//校验手机号
	var regRealName=/^[\u4e00-\u9fa5]{2,5}$/;//校验真实姓名
	$(".edit").blur(function(){
		var value=this.value;
		var name=this.getAttribute("name");
		var isPass=false;
		if(name=="name"){
			isPass=regName.test(value);
		}else if(name=="password"){
			isPass=regPassword.test(value);
		}else if(name=="confirm"){
			if(value==$("input[name='password']").val()&&value!="")
				isPass=true;
		}else if(name=="email"){
			isPass=regEmail.test(value);
		}else if(name=="tel"){
			isPass=regTel.test(value);
		}else if(name=="realName"){
			isPass=regRealName.test(value);
		}
		//jq校验输入正确性
		if(!isPass){
			$(this).parent().next().css("color","red");
		}else{
			$(this).parent().next().css("color","green");
		}
	})
})
</script>
</body>
</html>