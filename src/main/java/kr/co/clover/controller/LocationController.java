package kr.co.clover.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.clover.entity.ApiCode;
import kr.co.clover.entity.Location;
import kr.co.clover.service.ApiService;
import kr.co.clover.service.LocationService;

@Controller
@RequestMapping("/location")
public class LocationController {

	@Autowired
	private ApiService apiService;
	
	@Autowired
	private LocationService lService;
	
	@GetMapping("insert")
	public String test() {

		try {
			lService.insertItems(apiService.getSeoulLocationData());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "index";
	}

	@GetMapping("detail")
	public String detail(String contentId, Model model) {
		try {
			model.addAttribute("details", apiService.detailContent(contentId));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "location/detail";
	}

	@GetMapping("list")
	public String listLocation(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model,
			String keyword, String contentType, String sigunguCode, HttpSession session) {
		page -= 1;
		
		Page<Location> paging = null;
		ApiCode apiCode = new ApiCode();
		
		if (contentType == "") {
			paging = lService.findLocationExceptTheme(page, keyword, sigunguCode);
			
			System.out.println(paging.getSize());
			System.out.println("asdf");
		} else {
			paging = lService.findLocationContainTheme(page, keyword, sigunguCode, apiCode.getContentsCode(contentType));
			//session.setAttribute("contentType", contentType);
			
		}
		
		model.addAttribute("paging", paging);
		session.setAttribute("keyword", keyword);
		session.setAttribute("sigunguCode", sigunguCode);
		session.setAttribute("contentType", contentType);
		
		return "location/list";
	}

	@GetMapping("map")
	public String map() {
		return "mapTest";
	}

}
