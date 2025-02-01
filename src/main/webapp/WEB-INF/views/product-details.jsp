<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${product.name} - Shopper's Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-image {
            max-height: 600px;
            object-fit: contain;
        }
        .size-selector input[type="radio"] {
            display: none;
        }
        .size-selector label {
            border: 1px solid #dee2e6;
            padding: 8px 16px;
            margin: 0 4px;
            cursor: pointer;
            border-radius: 4px;
        }
        .size-selector input[type="radio"]:checked + label {
            background-color: #0d6efd;
            color: white;
            border-color: #0d6efd;
        }
        .quantity-selector {
            width: 100px;
        }
    </style>
</head>
<body>
    <!-- Include the same navbar as home.jsp -->

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <img src="${product.imageUrl}" alt="${product.name}" class="img-fluid product-image">
            </div>
            <div class="col-md-6">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/category/${product.category}">${product.category}</a></li>
                        <li class="breadcrumb-item active">${product.name}</li>
                    </ol>
                </nav>
                
                <h1 class="mb-3">${product.name}</h1>
                <h3 class="text-primary mb-4">$${product.price}</h3>
                
                <p class="mb-4">${product.description}</p>
                
                <div class="mb-4">
                    <h5>Select Size:</h5>
                    <div class="size-selector">
                        <input type="radio" name="size" id="size-s" value="S">
                        <label for="size-s">S</label>
                        
                        <input type="radio" name="size" id="size-m" value="M">
                        <label for="size-m">M</label>
                        
                        <input type="radio" name="size" id="size-l" value="L">
                        <label for="size-l">L</label>
                        
                        <input type="radio" name="size" id="size-xl" value="XL">
                        <label for="size-xl">XL</label>
                    </div>
                </div>
                
                <form action="/cart/add" method="post" class="mb-4">
                    <input type="hidden" name="productId" value="${product.id}">
                    <div class="row g-3">
                        <div class="col-auto">
                            <input type="number" name="quantity" value="1" min="1" max="${product.stockQuantity}" 
                                   class="form-control quantity-selector">
                        </div>
                        <div class="col">
                            <button type="submit" class="btn btn-primary w-100">Add to Cart</button>
                        </div>
                    </div>
                </form>
                
                <div class="mb-4">
                    <h5>Product Details:</h5>
                    <ul class="list-unstyled">
                        <li><strong>Category:</strong> ${product.category}</li>
                        <li><strong>Stock:</strong> ${product.stockQuantity} items</li>
                        <li><strong>Average Rating:</strong> 
                            <fmt:formatNumber value="${product.averageRating}" maxFractionDigits="1"/> 
                            (${product.reviewCount} reviews)
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="row mt-5">
            <div class="col-12">
                <h3>Customer Reviews</h3>
                <hr>
                
                <c:forEach items="${reviews}" var="review">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <h6 class="card-subtitle mb-2 text-muted">
                                        ${review.user.firstName} ${review.user.lastName}
                                    </h6>
                                    <div class="mb-2">
                                        <c:forEach begin="1" end="5" var="i">
                                            <span class="text-warning">
                                                <c:choose>
                                                    <c:when test="${i <= review.rating}">★</c:when>
                                                    <c:otherwise>☆</c:otherwise>
                                                </c:choose>
                                            </span>
                                        </c:forEach>
                                    </div>
                                </div>
                                <small class="text-muted">
                                    <fmt:formatDate value="${review.createdAt}" pattern="MMM dd, yyyy"/>
                                </small>
                            </div>
                            <p class="card-text">${review.comment}</p>
                        </div>
                    </div>
                </c:forEach>

                <!-- Review Form -->
                <c:if test="${not empty sessionScope.user}">
                    <div class="card mt-4">
                        <div class="card-body">
                            <h5 class="card-title">Write a Review</h5>
                            <form action="/product/${product.id}/review" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Rating</label>
                                    <div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rating" value="5" id="rating5" required>
                                            <label class="form-check-label" for="rating5">5 ★</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rating" value="4" id="rating4">
                                            <label class="form-check-label" for="rating4">4 ★</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rating" value="3" id="rating3">
                                            <label class="form-check-label" for="rating3">3 ★</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rating" value="2" id="rating2">
                                            <label class="form-check-label" for="rating2">2 ★</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rating" value="1" id="rating1">
                                            <label class="form-check-label" for="rating1">1 ★</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="comment" class="form-label">Your Review</label>
                                    <textarea class="form-control" id="comment" name="comment" rows="3" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit Review</button>
                            </form>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Include the same footer as home.jsp -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

