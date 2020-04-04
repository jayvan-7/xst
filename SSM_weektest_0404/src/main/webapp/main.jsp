<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tbody tr:nth-of-type(even){
		background-color:pink;
	}
</style>

<script type="text/javascript" src="js/jquery.js">	</script>
<script type="text/javascript">
	$(function(){
		mypage(1);
		$("#find").click(function(){
			var name=$("#cname").val();
			if(name==null||name==""){
				alert("请填写搜索关键字");
				mypage(1);
				return false;
			}
			mypage(1);
		});	
	})
	
	function mypage(index){
		var cname=$("#cname").val();
		
		$.post("findpage","cname="+cname+"&index="+index,function(result){
			var obj=$.parseJSON(result);
			var html="";
			for(var i=0;i<obj.data.length;i++){
				var c=obj.data[i];	
				html+="<tr>"+
						"<td>"+c.id+"</td>"+
						"<td><a href='update.jsp?id="+c.id+"'>"+c.cname+"</a></td>"+
						"<td>"+c.mobile+"</td>"+
						"<td>"+c.qq+"</td>"+
						"<td>"+c.email+"</td>"+
						"<td>"+c.address+"</td>"+
					  "</tr>";					  
			}
			if(obj.data.length<1){
				html+="<h3>没有找到与'"+cname+"'相关的联系人</h3>";
			}
			$("tbody").html(html);
			  
			var pagehtml ="<span>共"+obj.totalNewscount+"条数据["+obj.pageindex+"/"+obj.totalpagecount+"]</span>";
			if(obj.pageindex>1){
				pagehtml+="<a href='javascript:mypage(1);'>首页 </a>";
				pagehtml+="<a href='javascript:mypage("+(obj.pageindex-1)+");'>上一页 </a>";
			}
			if(obj.pageindex<obj.totalpagecount){
				pagehtml+="<a href='javascript:mypage("+(obj.pageindex+1)+");'>下一页 </a>";
				pagehtml+="<a href='javascript:mypage("+(obj.totalpagecount)+");'>末页 </a>";
			}
			$("#page").html(pagehtml); 			
		});
	}
</script>
</head>
<body>
<h1>在线通讯录</h1>
<div>
	<form action="#">
	<p>查找联系人：	
	<input id="cname" type="text"  >
	<input id="find" type="button"  value="查找">
	<a href="add.jsp">添加联系人</a>
	</p>
</form>
</div>

<div>
	<table>
		<thead>
			<tr>
				<td>序号</td>
				<td>姓名</td>
				<td>手机</td>
				<td>QQ</td>
				<td>Email</td>
				<td>地址</td>
			</tr>
		</thead>
		<tbody>
		</tbody>	
	</table>
</div>
<div id="page"></div>
</body>
</html>