package com.shoppercart.controller;

import com.shoppercart.model.Order;
import com.shoppercart.service.CartService;
import com.shoppercart.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CheckoutController {

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    @GetMapping("/checkout")
    public String checkout(Model model) {
        model.addAttribute("cartItems", cartService.getCartItems());
        model.addAttribute("total", cartService.getTotal());
        return "checkout";
    }

    @PostMapping("/place-order")
    public String placeOrder(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        Order order = orderService.createOrder(userDetails.getUsername(), cartService.getCartItems());
        cartService.clearCart();
        model.addAttribute("order", order);
        return "confirmation";
    }
}

