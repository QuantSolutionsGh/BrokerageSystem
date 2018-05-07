package com.insurance.brokman;

import com.insurance.brokman.model.Customer;
import com.insurance.brokman.model.Policy;
import com.insurance.brokman.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.ArrayList;
import java.util.Date;

@SpringBootApplication
public class BrokmanApplication implements CommandLineRunner {

	@Autowired
	CustomerRepository customerRepo;


	public static void main(String[] args) {

		SpringApplication.run(BrokmanApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {



		Customer customer = new Customer();
		customer.setLastName("Bernard");
		customer.setFirstName("Osei - aning");

		Policy policy = new Policy();

		policy.setPolicyNumber("ABC123456");

		policy.setCoverFmDate(new Date());

		policy.setCoverToDate(new Date());

		policy.setInsuranceCompany("Hollard Insurance");


		customer.addToPolicyList(policy);

		customerRepo.save(customer);








	}
}
