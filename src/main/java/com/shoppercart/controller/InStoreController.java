package com.shoppercart.controller;

import com.shoppercart.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InStoreController {

    @Autowired
    private ProductService productService;

    @GetMapping("/instore")
    public String inStoreItems(Model model) {
        model.addAttribute("instoreItems", productService.getInStoreItems());
        return "instoreitems";
    }
}

