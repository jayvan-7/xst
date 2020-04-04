<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js">	</script>
<script type="text/javascript">
	$(function(result){
		var str = window.location.href;
		var id = str.split("=")[1];
		$.post("findByid","id="+id,function(result){
			var obj = $.parseJSON(result);
			$("#cname").val(obj.cname);
			$("#mobile").val(obj.mobile);
			$("#qq").val(obj.qq);
			$("#email").val(obj.email);
			$("#address").val(obj.address);	
		});
				
		$("#save").click(function(){
			var cname=$("#cname").val();
			var mobile=$("#mobile").val();
			var qq=$("#qq").val();
			var email=$("#email").val();
			var address=$("#address").val();
			var param="cname="+cname+"&mobile="+mobile+"&qq="+qq+"&email="+email+"&address="+address+"&id="+id;
			
			if(cname==null||cname==""){
				alert("必须填写联系人姓名");
				return false;
			}
			var regMobile=/^1\d{10}$/;
			if(regMobile.test(mobile)==false){
				alert("请正确填写手机");
				return false;
			}
			var regQQ=/^\d{8,10}$/;
			if(regQQ.test(qq)==false){
				alert("请正确填写QQ");
				return false;
			}
			var regEmail= /^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
			if(regEmail.test(email)==false){
				alert("请正确填写Email");
				return false;
			}
			
			$.post("updateContact",param,function(result){
				var data=$.parseJSON(result);
				if(data=="success"){
					alert("修改联系人成功");
					location.href="main.jsp";
				}else{
					alert("修改联系人失败");
				}
			});
		})			
	})

</script>
</head>
<body>
<h1>修改联系人</h1>
<div>
	<form action="#">
	<p>姓名：	
		<input id="cname" type="text"  >
	</p>
	<p>手机：	
		<input id="mobile" type="text"  >
	</p>
	<p>QQ：	
		<input id="qq" type="text"  >
	</p>
	<p>Email：	
		<input id="email" type="text"  >
	</p>
	<p>地址：	
		<input id="address" type="text"  >
	</p>
	<p>
		<input id="save" type="button"  value="保存">
		<input  type="reset"  value="重置">
	</p>
</form>
</div>
</body>
</html>