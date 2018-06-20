package com.insurance.brokman.repository;

import com.insurance.brokman.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Users,Long> {
}
