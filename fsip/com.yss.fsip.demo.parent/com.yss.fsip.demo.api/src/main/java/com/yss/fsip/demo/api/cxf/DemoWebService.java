package com.yss.fsip.demo.api.cxf;

import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.yss.fsip.demo.api.vo.UserVo;

/**
 * 
 * webService demo
 * 
 * @author LSP
 *
 */
@WebService
public interface DemoWebService {
	
	@WebMethod
	List<UserVo> listUser();

}
