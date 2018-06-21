package com.insurance.brokman.repository;

import com.insurance.brokman.model.Insurer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InsurerRepository extends JpaRepository<Insurer,Long> {
}
