package com.insurance.brokman;

import com.insurance.brokman.model.Customer;
import com.insurance.brokman.model.Insurer;
import com.insurance.brokman.model.Policy;
import com.insurance.brokman.repository.CustomerRepository;
import com.insurance.brokman.repository.InsurerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;

import java.util.Date;

@SpringBootApplication(exclude = {MongoAutoConfiguration.class})
/* Because I have included BIRT which has some mongo DB classes, spring boot is automatically configuring MongoDB against
* my wishes. The above stops that*/
public class BrokmanApplication implements CommandLineRunner {

	@Autowired
	CustomerRepository customerRepo;

	@Autowired
	InsurerRepository insurerRepo;


	public static void main(String[] args) {

		SpringApplication.run(BrokmanApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {



		Customer customer = new Customer();
		customer.setLastName("test");
		customer.setFirstName("test - ttest");

		Policy policy = new Policy();

		policy.setPolicyNumber("ABC123456");

		policy.setCoverFmDate(new Date());

		policy.setCoverToDate(new Date());

		policy.setInsuranceCompany("test test");

		Insurer insurer =insurerRepo.getOne(Integer.toUnsignedLong(1));
		policy.setInsurer(insurer);





		customer.addToPolicyList(policy);

		customerRepo.save(customer);








	}


}
