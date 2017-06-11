<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#CLASSINFO_ID").val()==""){
			$("#CLASSINFO_ID").tips({
				side:3,
	            msg:'请输入班级id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLASSINFO_ID").focus();
			return false;
		}
		if($("#CLASS_NAME").val()==""){
			$("#CLASS_NAME").tips({
				side:3,
	            msg:'请输入班级名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLASS_NAME").focus();
			return false;
		}
		if($("#STUDENT_ID").val()==""){
			$("#STUDENT_ID").tips({
				side:3,
	            msg:'请输入学生表ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STUDENT_ID").focus();
			return false;
		}
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入学生中文名字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#AMOUNT").val()==""){
			$("#AMOUNT").tips({
				side:3,
	            msg:'请输入已缴费用',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AMOUNT").focus();
			return false;
		}
		if($("#TUITION_EXPIRE_TIME").val()==""){
			$("#TUITION_EXPIRE_TIME").tips({
				side:3,
	            msg:'请输入学费到期时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TUITION_EXPIRE_TIME").focus();
			return false;
		}
		if($("#TUITION_PAY_TIME").val()==""){
			$("#TUITION_PAY_TIME").tips({
				side:3,
	            msg:'请输入费用缴交时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TUITION_PAY_TIME").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="studenttuition/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="STUDENTTUITION_ID" id="STUDENTTUITION_ID" value="${pd.STUDENTTUITION_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">班级id:</td>
				<td><input type="text" name="CLASSINFO_ID" id="CLASSINFO_ID" value="${pd.CLASSINFO_ID}" maxlength="32" placeholder="这里输入班级id" title="班级id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">班级名称:</td>
				<td><input type="text" name="CLASS_NAME" id="CLASS_NAME" value="${pd.CLASS_NAME}" maxlength="32" placeholder="这里输入班级名称" title="班级名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学生表ID:</td>
				<td><input type="text" name="STUDENT_ID" id="STUDENT_ID" value="${pd.STUDENT_ID}" maxlength="32" placeholder="这里输入学生表ID" title="学生表ID"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学生中文名字:</td>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入学生中文名字" title="学生中文名字"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">已缴费用:</td>
				<td><input type="number" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入已缴费用" title="已缴费用"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学费到期时间:</td>
				<td><input class="span10 date-picker" name="TUITION_EXPIRE_TIME" id="TUITION_EXPIRE_TIME" value="${pd.TUITION_EXPIRE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="学费到期时间" title="学费到期时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">费用缴交时间:</td>
				<td><input class="span10 date-picker" name="TUITION_PAY_TIME" id="TUITION_PAY_TIME" value="${pd.TUITION_PAY_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="费用缴交时间" title="费用缴交时间"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>