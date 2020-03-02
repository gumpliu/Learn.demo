package com.yss.fsip.demo.web.interfaces.controller;

import com.yss.fsip.generic.service.BaseService;
import com.yss.fsip.demo.api.cxf.DemoWebService;
import com.yss.fsip.demo.api.vo.UserVo;
import com.yss.fsip.demo.web.domain.user.entity.TUser;
import com.yss.fsip.demo.web.domain.user.service.UserService;
import com.yss.fsip.web.BaseController;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController extends BaseController<TUser, String> {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;

	@Autowired
	DemoWebService demoWebService;


    @ApiOperation(value="用户查询分页接口", notes="从url中获取当前页数及页面显示条数")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNumber", value = "当前页", required = true, dataType = "Integer"),
            @ApiImplicitParam(name = "pageSize", value = "每页显示条数", required = true, dataType = "Integer")
    })
	@ResponseBody
//	@Cacheable(value="userCache",key="'person_'+#pageSize+#pageNumber")
	@RequestMapping(value="/user/page/{pageSize}/{pageNumber}", method = RequestMethod.GET, produces="application/json")
	public Page<TUser> findUserPage(@PathVariable int pageSize, @PathVariable int pageNumber) {
		logger.info("UserController.findUserPage param pageSize={},pageNumber={}",pageSize, pageNumber);
	   return findPage(0);
	}

	@ResponseBody
	@RequestMapping(value="/user/find/{name}", method = RequestMethod.GET, produces="application/json")
	public TUser findByName1(@PathVariable(name = "name") String userName) {

		return userService.findByUserName(userName);
	}

	@ResponseBody
	@RequestMapping(value="/user/findByName", method = RequestMethod.GET, produces="application/json")
	public TUser findByName(@RequestParam(value = "name") String userName) {

		return userService.findByUserName(userName);
	}

	@ResponseBody
	@RequestMapping(value="/user/findByUserName", method = RequestMethod.GET, produces="application/json")
	public TUser findByUserName(String userName) {

		return userService.findByUserName(userName);
	}

	@ResponseBody
	@RequestMapping(value="/user/cxf", method = RequestMethod.GET, produces="application/json")
	public List<UserVo> findByCXF() {

		return demoWebService.listUser();
	}

    @ResponseBody
    @RequestMapping(value="/user/delete/{id}", method = RequestMethod.POST, produces="application/json")
	public void delete(@PathVariable String id) {

    	userService.delete(id);
	}

	@Override
	public BaseService<TUser, String> getBaseService() {
		return userService;
	}
}
