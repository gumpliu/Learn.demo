package com.yss.fsip.demo.web.baseplatform.util;

import com.yss.fsip.common.util.id.IDGenerator;
import com.yss.fsip.common.util.id.NUIDGenerator;
import com.yss.fsip.demo.web.baseplatform.config.FsipConfig;
import com.yss.fsip.util.BeanUtil;

/**
 * IDGenerator factory
 * @author LSP
 *
 */
public class IDGeneratorFactory {
	
	private static IDGenerator idGenerator;
	private final static Object lock = new Object();

	/**
	 * 获取IDGenerator 对象
	 * @return
	 */
	public static IDGenerator getIDGenerator() {
		if(idGenerator == null) {
			synchronized(lock) {
				if(idGenerator == null) {
					idGenerator = BeanUtil.getBean(IDGenerator.class);
					if(idGenerator == null) {
						FsipConfig fsipConfig = BeanUtil.getBean(FsipConfig.class);
						String nodeCode = fsipConfig != null ? fsipConfig.getNodeCode() : null;
						idGenerator = new NUIDGenerator(nodeCode);
					}
				}
			}
		}
		return idGenerator;
	}
}
