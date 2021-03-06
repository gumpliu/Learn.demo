package com.yss.fsip.common.util;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class JWTTokenUtil {
	
	private static Logger logger = LoggerFactory.getLogger(JWTTokenUtil.class);
	
    /**
     * 使用Hs256算法,生成Jwt
     * @param ttlMillis 过期时间，ttlMillis小于0 不设置过期时间
     * @param claims payload的私有声明
     * @param secretKey 秘钥
     * @return
     */
    public static String createJWT(long ttlMillis, Map<String, Object> claims, String secretKey) {
        //指定签名的时候使用的签名算法，也就是header那部分，jjwt已经将这部分内容封装好了。
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
 
        //生成JWT的时间
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
 
 
        //生成签名的时候使用的秘钥secret,这个方法本地封装了的，一般可以从本地配置文件中读取，切记这个秘钥不能外露哦。
        //它就是你服务端的私钥，在任何场景都不应该流露出去。一旦客户端得知这个secret, 那就意味着客户端是可以自我签发jwt了。
//        String key = jwtTokenDto.getSecretKey();
 
        //生成签发人
//        String subject = subjectPrefix;
 
 
        //下面就是在为payload添加各种标准声明和私有声明了
        //这里其实就是new一个JwtBuilder，设置jwt的body
        JwtBuilder builder = Jwts.builder()
                //设置jti(JWT ID)：是JWT的唯一标识，根据业务需要，这个可以设置为一个不重复的值，主要用来作为一次性token,从而回避重放攻击。
                .setId(UUID.randomUUID().toString())
                //iat: jwt的签发时间
                .setIssuedAt(now)
                //代表这个JWT的主体，即它的所有人，这个是一个json格式的字符串，可以存放什么userid，roldid之类的，作为什么用户的唯一标志。
//                .setSubject(subject)
                //设置签名使用的签名算法和签名使用的秘钥
                .signWith(signatureAlgorithm, generalKey(secretKey));
        
        if(claims != null && !claims.isEmpty()) {
            //如果有私有声明，一定要先设置这个自己创建的私有的声明，这个是给builder的claim赋值，一旦写在标准的声明赋值之后，就是覆盖了那些标准的声明的
        	//如果要拿这个做验证，一般是需要和jwt的接收方提前沟通好验证方式的）
        	builder.setClaims(claims);
        }
        
        if (ttlMillis > 0) {
            long expMillis = nowMillis + ttlMillis;
            Date exp = new Date(expMillis);
            //设置过期时间
            builder.setExpiration(exp);
        }
        return builder.compact();
    }
 
 
    /**
     * Token的解密
     * @param token 加密后的token
     * @param secretKey 秘钥，与生产jwt的秘钥一致
     * @return
     */
    public static Claims parseJWT(String token, String secretKey) {

        //得到DefaultJwtParser
        Claims claims = Jwts.parser()
                //设置签名的秘钥
                .setSigningKey(generalKey(secretKey))
                //设置需要解析的jwt
                .parseClaimsJws(token).getBody();
        
        return claims;
    }
 
 
    /**
     * 校验token
     * 
     * @param token 加密后的token
     * @param secretKey  签名秘钥，和生成的签名的秘钥一模一样
     * @return
     */
    public static Boolean isVerify(String token, String secretKey) {
        //签名秘钥，和生成的签名的秘钥一模一样
    	try {
    		parseJWT(token, secretKey);
    		return true;
		} catch (Throwable e) {
			logger.error("token verify fail, error ={}", e.getMessage());
			return false;
		}
    }
    
    private static SecretKey generalKey(String secretKey){
        byte[] encodedKey = null;
		try {
			encodedKey = Base64.getEncoder().encode(secretKey.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        SecretKey key = new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");
        logger.info("secretKey={},key={}", secretKey, key.toString());
        return key;
    }
    
    
    public static void main(String []args) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("userId", "12");
    	map.put("userName", "lsp");
    	map.put("loginName", "lsp");
    	String jwt = JWTTokenUtil.createJWT(0,map, "1");
    	System.out.println(jwt);
    	System.out.println(JWTTokenUtil.isVerify("eyJhbGciOiJIUzI1NiJ9.eyJsb2dpbk5hbWUiOiJsc3AiLCJ1c2VyTmFtZSI6ImxzcCIsInVzZXJJZCI6IjEyIn0.FZLGjkxDGxzvdnEkPI6rRM8SEx2N24bE_oHFvk3kvL8", "1"));
	}
 
}