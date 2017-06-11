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
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入中文名字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#ENG_NAME").val()==""){
			$("#ENG_NAME").tips({
				side:3,
	            msg:'请输入英文名字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENG_NAME").focus();
			return false;
		}
		if($("#TEL").val()==""){
			$("#TEL").tips({
				side:3,
	            msg:'请输入家长联系电话',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TEL").focus();
			return false;
		}
		if($("#ENTER_SCHOOL_TIME").val()==""){
			$("#ENTER_SCHOOL_TIME").tips({
				side:3,
	            msg:'请输入入学日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENTER_SCHOOL_TIME").focus();
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
		if($("#BIRTHDY").val()==""){
			$("#BIRTHDY").tips({
				side:3,
	            msg:'请输入出生年月',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BIRTHDY").focus();
			return false;
		}
		if($("#LISTEN_LEVEL").val()==""){
			$("#LISTEN_LEVEL").tips({
				side:3,
	            msg:'请输入听等级',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LISTEN_LEVEL").focus();
			return false;
		}
		if($("#SPEAK_LEVEL").val()==""){
			$("#SPEAK_LEVEL").tips({
				side:3,
	            msg:'请输入说等级',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SPEAK_LEVEL").focus();
			return false;
		}
		if($("#READ_LEVEL").val()==""){
			$("#READ_LEVEL").tips({
				side:3,
	            msg:'请输入读等级',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#READ_LEVEL").focus();
			return false;
		}
		if($("#WRIE_LEVEL").val()==""){
			$("#WRIE_LEVEL").tips({
				side:3,
	            msg:'请输入写等级',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WRIE_LEVEL").focus();
			return false;
		}
		if($("#STUDY_PLAN").val()==""){
			$("#STUDY_PLAN").tips({
				side:3,
	            msg:'请输入学程规划',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STUDY_PLAN").focus();
			return false;
		}
		if($("#SEMESTER_CHECK").val()==""){
			$("#SEMESTER_CHECK").tips({
				side:3,
	            msg:'请输入学期评量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SEMESTER_CHECK").focus();
			return false;
		}
		if($("#TUITION").val()==""){
			$("#TUITION").tips({
				side:3,
	            msg:'请输入应缴学费',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TUITION").focus();
			return false;
		}
		if($("#TUITION_STATUS").val()==""){
			$("#TUITION_STATUS").tips({
				side:3,
	            msg:'请输入本次班级缴交状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TUITION_STATUS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="student/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="STUDENT_ID" id="STUDENT_ID" value="${pd.STUDENT_ID}"/>
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
				<td style="width:70px;text-align: right;padding-top: 13px;">中文名字:</td>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入中文名字" title="中文名字"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">英文名字:</td>
				<td><input type="text" name="ENG_NAME" id="ENG_NAME" value="${pd.ENG_NAME}" maxlength="32" placeholder="这里输入英文名字" title="英文名字"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">家长联系电话:</td>
				<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="32" placeholder="这里输入家长联系电话" title="家长联系电话"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">入学日期:</td>
				<td><input class="span10 date-picker" name="ENTER_SCHOOL_TIME" id="ENTER_SCHOOL_TIME" value="${pd.ENTER_SCHOOL_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="入学日期" title="入学日期"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学费到期时间:</td>
				<td><input class="span10 date-picker" name="TUITION_EXPIRE_TIME" id="TUITION_EXPIRE_TIME" value="${pd.TUITION_EXPIRE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="学费到期时间" title="学费到期时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">出生年月:</td>
				<td><input class="span10 date-picker" name="BIRTHDY" id="BIRTHDY" value="${pd.BIRTHDY}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="出生年月" title="出生年月"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">听等级:</td>
				<td><input type="text" name="LISTEN_LEVEL" id="LISTEN_LEVEL" value="${pd.LISTEN_LEVEL}" maxlength="32" placeholder="这里输入听等级" title="听等级"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">说等级:</td>
				<td><input type="text" name="SPEAK_LEVEL" id="SPEAK_LEVEL" value="${pd.SPEAK_LEVEL}" maxlength="32" placeholder="这里输入说等级" title="说等级"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">读等级:</td>
				<td><input type="text" name="READ_LEVEL" id="READ_LEVEL" value="${pd.READ_LEVEL}" maxlength="32" placeholder="这里输入读等级" title="读等级"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">写等级:</td>
				<td><input type="text" name="WRIE_LEVEL" id="WRIE_LEVEL" value="${pd.WRIE_LEVEL}" maxlength="32" placeholder="这里输入写等级" title="写等级"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学程规划:</td>
				<td><input type="text" name="STUDY_PLAN" id="STUDY_PLAN" value="${pd.STUDY_PLAN}" maxlength="32" placeholder="这里输入学程规划" title="学程规划"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学期评量:</td>
				<td><input type="text" name="SEMESTER_CHECK" id="SEMESTER_CHECK" value="${pd.SEMESTER_CHECK}" maxlength="32" placeholder="这里输入学期评量" title="学期评量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">应缴学费:</td>
				<td><input type="number" name="TUITION" id="TUITION" value="${pd.TUITION}" maxlength="32" placeholder="这里输入应缴学费" title="应缴学费"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">本次班级缴交状态:</td>
				<td><input type="number" name="TUITION_STATUS" id="TUITION_STATUS" value="${pd.TUITION_STATUS}" maxlength="32" placeholder="这里输入本次班级缴交状态" title="本次班级缴交状态"/></td>
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