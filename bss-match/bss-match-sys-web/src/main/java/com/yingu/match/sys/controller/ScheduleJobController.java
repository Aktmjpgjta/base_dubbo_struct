package com.yingu.match.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yingu.match.model.ScheduleJob;
import com.yingu.match.service.ScheduleJobService;


/**
 * 定时任务 controller
 * @author ty
 * @date 2015年1月14日
 */
@Controller
@RequestMapping("/sys/scheduleJob")
public class ScheduleJobController {
	
	@Autowired
	private ScheduleJobService scheduleJobService;
	
	@RequestMapping(value="/toList")
	public String toList() {
		return "sys/scheduleJob/list";
	}
	
	@RequestMapping(value="/toAdd")
	public String toAdd() {
		return "sys/scheduleJob/add";
	}
	
	@RequestMapping(value="/cron")
	public String cron() {
		return "sys/scheduleJob/cron";
	}
	
	
	
	@RequestMapping(value="/toUpdate")
	public ModelAndView toUpdate(ScheduleJob scheduleJob) {
		ModelAndView mav= new ModelAndView("sys/scheduleJob/update");
		mav.addObject("scheduleJob", scheduleJob);
		return mav;
	}
	
	/**
	 * 获取定时任务 json
	 */
	@RequiresPermissions("/sys/scheduleJob/list")
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> getAllJobs(){
		List<ScheduleJob> scheduleJobs = scheduleJobService.getAllScheduleJob();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", scheduleJobs);
		map.put("total", scheduleJobs.size());
		return map;
	}
	
	
	/**
	 * 添加
	 * @param user
	 * @param model
	 */
	@RequiresPermissions("/sys/scheduleJob/add")
	@RequestMapping(value = "/add")
	@ResponseBody
	public String create(ScheduleJob scheduleJob) {
		scheduleJobService.add(scheduleJob);
		return "success";
	}
	
	/**
	 * 暂停任务
	 */
	@RequiresPermissions("/sys/scheduleJob/stop")
	@RequestMapping("/stop")
	@ResponseBody
	public String stop(String[] name,String[] group) {
		scheduleJobService.stopJob(name,group);
		return "success";
	}

	/**
	 * 删除任务
	 */
	@RequiresPermissions("/sys/scheduleJob/delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(String[] name,String[] group) {
		scheduleJobService.delJob(name,group);
		return "success";
	}

	/**
	 * 修改表达式
	 */
	@RequiresPermissions("/sys/scheduleJob/update")
	@RequestMapping("/update")
	@ResponseBody
	public String update(ScheduleJob scheduleJob) {
		//验证cron表达式
		if(CronExpression.isValidExpression(scheduleJob.getCronExpression())){
			scheduleJobService.modifyTrigger(scheduleJob);
			return "success";
		}else{
			return "Cron表达式不正确";
		}
	}

	/**
	 * 立即运行一次
	 */
	@RequiresPermissions("/sys/scheduleJob/startNow")
	@RequestMapping("/startNow")
	@ResponseBody
	public String stratNow(String[] name,String[] group) {
		scheduleJobService.startNowJob(name,group);
		return "success";
	}

	/**
	 * 恢复
	 */
	@RequiresPermissions("/sys/scheduleJob/resume")
	@RequestMapping("/resume")
	@ResponseBody
	public String resume(String[] name,String[] group) {
		scheduleJobService.restartJob(name,group);
		return "success";
	}

	
}
