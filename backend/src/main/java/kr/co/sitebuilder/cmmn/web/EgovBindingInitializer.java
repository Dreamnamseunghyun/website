/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.co.sitebuilder.cmmn.web;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * @Class Name : EgovBindingInitializer.java
 * @Description : EgovBindingInitializer Class
 * @Modification Information
 * @
 * @  ?섏젙??     ?섏젙??             ?섏젙?댁슜
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           理쒖큹?앹꽦
 *
 * @author 媛쒕컻?꾨젅?꾩썚???ㅽ뻾?섍꼍 媛쒕컻?
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class EgovBindingInitializer implements WebBindingInitializer {

	/**
	* initBinder
	* @param binder
	* @param request
	* @see 媛쒕컻?꾨젅?꾩썚???ㅽ뻾?섍꼍 媛쒕컻?
	*/
	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(false));
	}

}
