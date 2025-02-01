<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopper's Cart - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-card {
            transition: transform 0.3s;
            height: 100%;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .product-image {
            height: 300px;
            object-fit: cover;
        }
        .category-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="/">Shopper's Cart</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/category/SHIRTS">Shirts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/category/PANTS">Pants</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/category/DRESSES">Dresses</a>
                    </li>
                </ul>
                <form class="d-flex" action="/search" method="GET">
                    <input class="form-control me-2" type="search" placeholder="Search products" aria-label="Search" name="query">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <div class="d-flex">
                    <a href="/cart" class="btn btn-outline-dark me-2">
                        <i class="bi bi-cart"></i> Cart
                    </a>
                    <c:if test="${empty sessionScope.user}">
                        <a href="/login" class="btn btn-primary">Login</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <div class="dropdown">
                            <button class="btn btn-outline-dark dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown">
                                ${sessionScope.user.firstName}
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/profile">Profile</a></li>
                                <li><a class="dropdown-item" href="/orders">Orders</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <c:if test="${not empty searchQuery}">
            <h2>Search Results for "${searchQuery}"</h2>
        </c:if>
        <c:if test="${empty searchQuery}">
            <h2>Featured Products</h2>
        </c:if>
        
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <c:forEach items="${products}" var="product">
                <div class="col">
                    <div class="card product-card">
                        <span class="badge bg-primary category-badge">${product.category}</span>
                        <img src="${product.imageUrl}" class="card-img-top product-image" alt="${product.name}">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text text-truncate">${product.description}</p>
                            <div class="mt-auto">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">$${product.price}</h6>
                                    <div class="d-flex gap-2">
                                        <a href="/product/${product.id}" class="btn btn-outline-primary btn-sm">View Details</a>
                                        <form action="/cart/add" method="post" style="display: inline;">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <button type="submit" class="btn btn-primary btn-sm">Add to Cart</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <footer class="bg-light mt-5 py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>About Us</h5>
                    <p>Your one-stop shop for fashion needs.</p>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="/about">About</a></li>
                        <li><a href="/contact">Contact</a></li>
                        <li><a href="/faq">FAQ</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact</h5>
                    <p>Email: support@shopperscart.com<br>
                    Phone: (555) 123-4567</p>
                </div>
            </div>
            <hr>
            <div class="text-center">
                <p>&copy; 2024 Shopper's Cart. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

