package com.shoppercart.controller;

import com.shoppercart.model.Product;
import com.shoppercart.service.ProductService;
import com.shoppercart.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ReviewService reviewService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "home";
    }

    @GetMapping("/category/{category}")
    public String getProductsByCategory(@PathVariable String category, Model model) {
        model.addAttribute("products",
                productService.getProductsByCategory(Product.Category.valueOf(category)));
        model.addAttribute("currentCategory", category);
        return "home";
    }

    @GetMapping("/product/{id}")
    public String getProductDetails(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("reviews", reviewService.getReviewsForProduct(id));
        return "product-details";
    }

    @GetMapping("/search")
    public String searchProducts(@RequestParam String query, Model model) {
        List<Product> searchResults = productService.searchProducts(query);
        model.addAttribute("products", searchResults);
        model.addAttribute("searchQuery", query);
        return "home";
    }
}

