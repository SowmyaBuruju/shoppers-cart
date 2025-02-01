package com.shoppercart.repository;

import com.shoppercart.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByNameContainingIgnoreCase(String name);
    List<Product> findByCategory(Product.Category category);
    List<Product> findByInStoreQuantityGreaterThan(int quantity);
}

