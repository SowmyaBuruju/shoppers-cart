package com.shoppercart.service;

import com.shoppercart.model.*;
import com.shoppercart.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserService userService;

    @Transactional
    public Order createOrder(String username, List<CartItem> cartItems) {
        User user = userService.getUserByEmail(username);

        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus(Order.OrderStatus.PENDING);

        List<OrderItem> orderItems = cartItems.stream()
                .map(cartItem -> {
                    OrderItem item = new OrderItem();
                    item.setProduct(cartItem.getProduct());
                    item.setQuantity(cartItem.getQuantity());
                    item.setPrice(cartItem.getProduct().getPrice());
                    item.setOrder(order);
                    return item;
                })
                .collect(Collectors.toList());

        order.setItems(orderItems);
        order.setTotalAmount(calculateTotal(orderItems));

        return orderRepository.save(order);
    }

    private BigDecimal calculateTotal(List<OrderItem> items) {
        return items.stream()
                .map(item -> item.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public Order getOrderById(Long orderId) {
        return orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));
    }
}

