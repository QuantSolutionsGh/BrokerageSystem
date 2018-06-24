package com.insurance.brokman.repository;

import com.insurance.brokman.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product,Long>{
}
