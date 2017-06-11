package com.fh.controller.study.studenthis;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;
import com.fh.service.study.studenthis.StudenthisService;

/** 
 * 类名称：StudenthisController
 * 创建人：FH 
 * 创建时间：2017-06-11
 */
@Controller
@RequestMapping(value="/studenthis")
public class StudenthisController extends BaseController {
	
	String menuUrl = "studenthis/list.do"; //菜单地址(权限用)
	@Resource(name="studenthisService")
	private StudenthisService studenthisService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Studenthis");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("STUDENTHIS_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER_ID", "");	//登记人
		pd.put("CREATE_TIME", Tools.date2Str(new Date()));	//登记时间
		pd.put("STUDENT_ID", "");	//学生表ID
		studenthisService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Studenthis");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			studenthisService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改Studenthis");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		studenthisService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Studenthis");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = studenthisService.list(page);	//列出Studenthis列表
			mv.setViewName("study/studenthis/studenthis_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Studenthis页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("study/studenthis/studenthis_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Studenthis页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = studenthisService.findById(pd);	//根据ID读取
			mv.setViewName("study/studenthis/studenthis_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Studenthis");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				studenthisService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Studenthis到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("班级id");	//1
			titles.add("班级名称");	//2
			titles.add("中文名字");	//3
			titles.add("英文名字");	//4
			titles.add("家长联系电话");	//5
			titles.add("入学日期");	//6
			titles.add("学费到期时间");	//7
			titles.add("出生年月");	//8
			titles.add("听等级");	//9
			titles.add("说等级");	//10
			titles.add("读等级");	//11
			titles.add("写等级");	//12
			titles.add("学程规划");	//13
			titles.add("学期评量");	//14
			titles.add("应缴标准");	//15
			titles.add("本次班级缴交状态");	//16
			titles.add("登记人");	//17
			titles.add("登记时间");	//18
			titles.add("学生表ID");	//19
			dataMap.put("titles", titles);
			List<PageData> varOList = studenthisService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("CLASSINFO_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("CLASS_NAME"));	//2
				vpd.put("var3", varOList.get(i).getString("NAME"));	//3
				vpd.put("var4", varOList.get(i).getString("ENG_NAME"));	//4
				vpd.put("var5", varOList.get(i).getString("TEL"));	//5
				vpd.put("var6", varOList.get(i).getString("ENTER_SCHOOL_TIME"));	//6
				vpd.put("var7", varOList.get(i).getString("TUITION_EXPIRE_TIME"));	//7
				vpd.put("var8", varOList.get(i).getString("BIRTHDY"));	//8
				vpd.put("var9", varOList.get(i).getString("LISTEN_LEVEL"));	//9
				vpd.put("var10", varOList.get(i).getString("SPEAK_LEVEL"));	//10
				vpd.put("var11", varOList.get(i).getString("READ_LEVEL"));	//11
				vpd.put("var12", varOList.get(i).getString("WRIE_LEVEL"));	//12
				vpd.put("var13", varOList.get(i).getString("STUDY_PLAN"));	//13
				vpd.put("var14", varOList.get(i).getString("SEMESTER_CHECK"));	//14
				vpd.put("var15", varOList.get(i).get("TUITION").toString());	//15
				vpd.put("var16", varOList.get(i).get("TUITION_STATUS").toString());	//16
				vpd.put("var17", varOList.get(i).getString("CREATE_USER_ID"));	//17
				vpd.put("var18", varOList.get(i).getString("CREATE_TIME"));	//18
				vpd.put("var19", varOList.get(i).getString("STUDENT_ID"));	//19
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
