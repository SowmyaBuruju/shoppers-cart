package com.shoppercart.service;

import com.shoppercart.model.Product;
import com.shoppercart.model.Review;
import com.shoppercart.model.User;
import com.shoppercart.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    public Review addReview(Long productId, String userEmail, int rating, String comment) {
        Product product = productService.getProductById(productId);
        User user = userService.getUserByEmail(userEmail);

        Review review = new Review();
        review.setProduct(product);
        review.setUser(user);
        review.setRating(rating);
        review.setComment(comment);
        review.setCreatedAt(LocalDateTime.now());

        return reviewRepository.save(review);
    }

    public List<Review> getReviewsForProduct(Long productId) {
        return reviewRepository.findByProductId(productId);
    }
}

