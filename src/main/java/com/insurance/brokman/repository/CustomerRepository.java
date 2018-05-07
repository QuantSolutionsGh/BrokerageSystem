package com.insurance.brokman.repository;

import com.insurance.brokman.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer,Long> {




}
