/******************************************************
 * Program History
 * 
 * Project Name	            :  st-server-webapp-template
 * Client Name				:  TMAP-EM
 * Package Name             :  th.co.toyota.application.web
 * Program ID 	            :  WelcomeController.java
 * Program Description	    :  Welcome Controller.
 * Environment	 	        :  Java 7
 * Author					:  danilo
 * Version					:  1.0
 * Creation Date            :  Aug 2, 2013
 *
 * Modification History	    :
 * Version	   Date		   Person Name		Chng Req No		Remarks
 *
 * Copyright(C) 2013-TOYOTA Motor Asia Pacific. All Rights Reserved.             
 ********************************************************/
package th.co.toyota.application.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import th.co.toyota.application.model.Payload;
import th.co.toyota.application.model.ServiceStatus;
import th.co.toyota.application.model.XmlPayload;
import th.co.toyota.kv0.api.constants.AppConstants;

@Controller
@RequestMapping(value = "/")
public class WelcomeController extends CommonBaseController {
	
	WelcomeController(){
		logger = LoggerFactory.getLogger(WelcomeController.class);
	}
	/**
	 * THis is the first operation executed for every user session, when user
	 * login to ST3 web application.
	 * <p>
	 * It willDisplaythe welcome message on screen.
	 * 
	 * @param request A http request object.
	 * @return A {@link Payload} object.
	 */
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		logger.debug("Welcome view will be renedered.");
		
		String viewName = "WKV00000";
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(viewName, payload,
				RequestContextUtils.getLocale(request));
		payload.setStatus(ServiceStatus.OK);

		ModelAndView mv = new ModelAndView(viewName);
		mv.addObject(AppConstants.MV_USER_COMPANY, getUserCompany(getUserInSession(request)));
		mv.addObject(AppConstants.MV_PAYLOAD, payload);

		return mv;
	}
	

	@RequestMapping(value="/NewCarInsuranceMenu", method = RequestMethod.GET)
	public ModelAndView newCarInsurance(HttpServletRequest request) {
		String viewName = "WKV03000";
		Payload payload = new XmlPayload();
		payload = populatePayloadForDisplay(viewName, payload,
				RequestContextUtils.getLocale(request));
		payload.setStatus(ServiceStatus.OK);

		ModelAndView mv = new ModelAndView(viewName);
		mv.addObject(AppConstants.MV_USER_COMPANY, getUserCompany(getUserInSession(request)));
		mv.addObject(AppConstants.MV_PAYLOAD, payload);

		return mv;
	}
	
}
