package com.yss.fsip.demo.web.baseplatform.timer;

import com.google.common.base.Joiner;
import com.yss.fsip.common.util.HttpClient;
import com.yss.fsip.common.util.StringUtil;
import com.yss.fsip.demo.web.baseplatform.config.FsipConfig;
import com.yss.fsip.demo.web.baseplatform.util.FSIPConstants;
import com.yss.fsip.demo.web.baseplatform.util.JWTSessionUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 定时服务
 * 
 * @author LSP
 */
@Configuration      
@EnableScheduling
public class TimerService {
	
	@Autowired
	private FsipConfig fsipConfig;
	
	private Logger logger = LoggerFactory.getLogger(TimerService.class);
		
	/**
	 * 延迟sofa中session时间
	 */
	@Scheduled(fixedRate= FSIPConstants.INTERVAL_TIME)
	public void delaySofaSessionTime() {
		List<String> sessionIds = getSessionIds();
		
		if(sessionIds.isEmpty()) {
			return;
		}
		HttpClient httpClient = new HttpClient();
		Map<String, String> heards = new HashMap<String, String>();
		String paramsSIds = Joiner.on(",").join(sessionIds);
		heards.put("sessionids", paramsSIds);
		logger.info("TimerService.invokeSofaDelaySessionTime sessionIds ={} ", paramsSIds);
		//TODO 需要处理，应返还注销的sessionId
		String json = httpClient.sendPost(fsipConfig.getSofaUrl() + "/sofa-sso/refreshClusterSession", null, heards);
		if(!StringUtil.isEmpty(json)) {
			for(String sessionId : json.split(",")) {
				JWTSessionUtil.removeSessionJwtTime(sessionId);
			}
		}
		logger.info("fail sessionids={}", json);
	}

	
	/**
	 * 获取需要延迟session时间的sessionId
	 * 
	 * @return
	 */
	private List<String> getSessionIds(){
		List<String> sessionIds = new ArrayList<String>();
		long currentTime = System.currentTimeMillis();

		for(Entry<String, Long> entry : JWTSessionUtil.getSessionTimeSet()) {
			long lastTime = JWTSessionUtil.getSessionTime(entry.getKey());
			if(currentTime - lastTime <= FSIPConstants.INTERVAL_TIME) {
				sessionIds.add(entry.getKey());
			}
		}
		return sessionIds;
	}
}
