<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order Confirmation - Shopper's Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="/">Shopper's Cart</a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Order Confirmation</h2>
                        <div class="alert alert-success" role="alert">
                            Thank you for your order! Your order has been successfully placed.
                        </div>
                        <h4>Order Details</h4>
                        <p><strong>Order Number:</strong> ${order.id}</p>
                        <p><strong>Order Date:</strong> <fmt:formatDate value="${order.orderDate}" pattern="MMMM d, yyyy"/></p>
                        <p><strong>Total Amount:</strong> $${order.totalAmount}</p>
                        
                        <h4 class="mt-4">Items Ordered</h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${order.items}" var="item">
                                    <tr>
                                        <td>${item.product.name}</td>
                                        <td>${item.quantity}</td>
                                        <td>$${item.price * item.quantity}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                        <h4 class="mt-4">Shipping Information</h4>
                        <p>${order.shippingAddress.fullName}</p>
                        <p>${order.shippingAddress.address}</p>
                        <p>${order.shippingAddress.city}, ${order.shippingAddress.zipCode}</p>
                        <p>${order.shippingAddress.country}</p>
                        
                        <div class="text-center mt-4">
                            <a href="/" class="btn btn-primary">Continue Shopping</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

