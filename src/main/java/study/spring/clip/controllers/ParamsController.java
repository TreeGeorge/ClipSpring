package study.spring.clip.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 이 클래스를 컨트롤러로서 지정함
// -> import org.springframework.stereotype.Controller;
@Controller
public class ParamsController {
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "Youth_protection_policy", method = RequestMethod.GET)
	public String goYouthProtectionPolicy() {
		return "Youth_protection_policy";
	}
	
	@RequestMapping(value = "Clip_terms", method = RequestMethod.GET)
	public String goClipTerms() {
		return "Clip_terms";
	}
	
	@RequestMapping(value = "Privacy_policy", method = RequestMethod.GET)
	public String goPrivacyPolicy() {
		return "Privacy_policy";
	}
	
	@RequestMapping(value = "Customer_service", method = RequestMethod.GET)
	public String goCustomerService() {
		return "Customer_service";
	}

}
