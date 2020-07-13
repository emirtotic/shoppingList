package com.shopping.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.entity.Item;
import com.shopping.repo.ItemRepo;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	private ItemRepo repo;

	@RequestMapping({ "/main-page", "/" })
	public String getItems(Model model) {

		model.addAttribute("itemList", repo.findAll());

		return "main-page.jsp";
	}

	@RequestMapping("/item-form")
	public String addItem(Model model) {

		Item item = new Item();
		model.addAttribute("item", item);

		return "item-form.jsp";
	}

	@RequestMapping("/item-save")
	public String saveItem(@ModelAttribute @Valid Item item, Errors errors, Model model) {

		if (errors.hasErrors()) {

			return "item-form.jsp";

		}

		repo.save(item);

		return "redirect:/main-page";

	}

	@RequestMapping("item-delete")
	public String deleteItem(int id) {

		repo.deleteById(id);

		return "redirect:/main-page";

	}

	@RequestMapping("/item-update-form")
	public String updateItem(@RequestParam int id, Model model) {

		Optional<Item> item = repo.findById(id);
		model.addAttribute("item", item);

		return "item-form.jsp";

	}

}
