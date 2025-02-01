package com.shoppercart.controller;

import com.shoppercart.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {

    @Autowired
    private ProductService productService;

    @GetMapping("/search")
    public String search(@RequestParam String query, Model model) {
        model.addAttribute("products", productService.searchProducts(query));
        return "search-results";
    }
}

