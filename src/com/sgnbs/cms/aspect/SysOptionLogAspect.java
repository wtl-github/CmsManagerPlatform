package com.sgnbs.cms.aspect;

import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sgnbs.cms.entity.SysLog;
import com.sgnbs.cms.service.intf.SysLogService;
import com.sgnbs.cms.util.WebServletUtil;

public class SysOptionLogAspect {	

	@Autowired
	private SysLogService sysLogService;
	
	public Object doSystemLog(ProceedingJoinPoint point) throws Throwable {
		// 切入方法名称
		String methodName = point.getSignature().getName();
		
		   
		// 目标方法不为空
		if (StringUtils.isNotEmpty(methodName)) {
			String targetName = point.getTarget().getClass().getName();  
			@SuppressWarnings("rawtypes")
			Class targetClass = Class.forName(targetName);			
			Method[] methods = targetClass.getMethods();
			for (Method m : methods) { 
				  if (m.getName().equals(methodName)) { 
					  boolean hasAnnotation = m
								.isAnnotationPresent(MethodAction.class);
						if (hasAnnotation) {
							HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
									.getRequestAttributes()).getRequest();
		                    //请求参数
							String parame = null;
							StringBuilder builder = new StringBuilder();
							
							// 用户openId
							String userOpenId = request.getParameter("userOpenId") == null ? null
									: request.getParameter("userOpenId").trim();
							String accessToken = request.getParameter("accessToken") == null ? null
									: request.getParameter("accessToken").trim();// 用户访问令牌
							String generalAccount = request.getParameter("generalAccount") == null ? null
									: request.getParameter("generalAccount").trim();// 未来社区总账户
							String sellerOpenId = request.getParameter("sellerOpenId") ==null ? null :request.getParameter("sellerOpenId").trim();//商户唯一编号 
							String consumState = request.getParameter("consumState") == null ? null
									: request.getParameter("consumState").trim();// 消费状态【0：未消费，1：支付，2支付超时，订单取消
																					// ，3、已支付，超时需要退款】
							String consumType = request.getParameter("consumType") == null ? null
									: request.getParameter("consumType").trim();// 消费类型【0：普通商品，1：服务商品，2预售商品，3余额充值】
							String money = request.getParameter("money") == null ? null
									: request.getParameter("money").trim();// 消费金额
							String orderDetail = request.getParameter("orderDetail") == null ? null
									: request.getParameter("orderDetail").trim();// 订单详情
							String orderNum = request.getParameter("orderNum") == null ? null
									: request.getParameter("orderNum").trim();// 订单编号
							String playType = request.getParameter("playType") == null ? null
									: request.getParameter("playType").trim();// 支付平台类型【0：余额支付，1：微信支付，2：支付宝支付】
							String plateType = request.getParameter("plateType") == null ? null
									: request.getParameter("plateType").trim();// 平台类型【0：未来社区】							
							String sign = request.getParameter("sign") == null ? null : request
									.getParameter("sign").trim();// 数字签名证书。
							
							//设置支付密码
							String password = request.getParameter("password") == null ? null : request
									.getParameter("password").trim();//支付密码。
							String optionType = request.getParameter("optionType") == null ? null : request
									.getParameter("optionType").trim();// 支付密码动作。
							
							if(userOpenId != null){
								builder.append(";参数userOpenId："+userOpenId);
							}
							if(accessToken != null){
								builder.append(";参数accessToken："+accessToken);
							}
							if(generalAccount !=null){
								builder.append(";参数generalAccount："+generalAccount);
							}
							if(sellerOpenId !=null){
								builder.append(";参数sellerOpenId："+sellerOpenId);
							}
							if(consumState !=null){
								builder.append(";参数consumState："+consumState);
							}
							if(consumType !=null){
								builder.append(";参数consumType："+consumType);
							}
							if(money !=null){
								builder.append(";参数money："+money);
							}
							if(orderDetail !=null){
								builder.append(";参数orderDetail："+orderDetail);
							}
							if(orderNum !=null){
								builder.append(";参数orderNum："+orderNum);
							}
							if(playType !=null){
								builder.append(";参数playType："+playType);
							}
							if(plateType != null){
								builder.append(";参数plateType："+plateType);
							}
							if(sign !=null){
								builder.append(";参数sign："+sign);
							}
							if(password !=null){
								builder.append(";参数password："+password);
							}
							if(optionType !=null){
								builder.append(";参数optionType："+optionType);
							}
							parame = builder.toString();
							
							MethodAction annotation = m
									.getAnnotation(MethodAction.class);
							
							// 方法描述
							String methodDescp = annotation.optionDescription();
							// 方法名称
							String name = annotation.methodName();							
							// 用户IP地址
							String ip = WebServletUtil.getClientIpAddr(request) == null ? null : WebServletUtil.getClientIpAddr(
									request).trim();

							SysLog sysLog = new SysLog();
							sysLog.setUserId(1);
							sysLog.setOptionDesc(methodDescp);
							sysLog.setOptionIp(ip);
							sysLog.setOptionMethod(name);
							sysLog.setOptionTime(new Date());
							sysLog.setParame(parame);
							sysLogService.insertSysLog(sysLog);

						}
				  }   
			}
		}
		return point.proceed();
	}

/*	// 返回用IP地址
	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader(" x-forwarded-for ");
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getHeader(" Proxy-Client-IP ");
		}
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getHeader(" WL-Proxy-Client-IP ");
		}
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
*/
}
