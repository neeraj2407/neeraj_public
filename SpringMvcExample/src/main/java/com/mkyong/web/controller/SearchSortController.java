package com.mkyong.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mkyong.web.model.Tag;

@Controller
public class SearchSortController {

	List<Tag> data = new ArrayList<Tag>(); 

	SearchSortController() {
		// init data for testing
		data.add(new Tag(1, "ruby", 5000));
		data.add(new Tag(2, "rails", 400));
		data.add(new Tag(3, "c / c++", 14000));
		data.add(new Tag(4, ".net", 5000));
		data.add(new Tag(5, "python", 3000));
		data.add(new Tag(6, "java", 15000));
		data.add(new Tag(7, "javascript", 20000));
		data.add(new Tag(8, "jscript", 2000));
		data.add(new Tag(9, "php", 50000));
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getPages() {

		ModelAndView model = new ModelAndView("searchSortTable");
		return model;
	}

	@RequestMapping(value = "/getTags", method = RequestMethod.GET)
	public @ResponseBody
	List<Tag> getTags(@RequestParam String tagName) {

		return simulateSearchResult(tagName);

	}

	private List<Tag> simulateSearchResult(String tagName) {

		List<Tag> result = new ArrayList<Tag>();

		// iterate a list and filter by tagName
		for (Tag tag : data) {
			if (tag.getTagName().contains(tagName)) {
				result.add(tag);
			}
		}

		return result;
	}	
}
