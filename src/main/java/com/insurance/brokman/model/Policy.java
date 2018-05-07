package com.insurance.brokman.model;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Policy {

    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;

    private String policyNumber;

    private String policyType;

    private Date coverFmDate;

    private Date coverToDate;



    private String insuranceCompany;

    private long premium;

    @ManyToOne
    @JoinColumn(name="customerId")
    private Customer customer;

    @OneToMany(mappedBy = "policy",cascade = CascadeType.PERSIST)
    private List<PaymentDetails> paymentDetailsList = new ArrayList<>();


    public void addToPaymentDetailsList(PaymentDetails paymentDetails){
        paymentDetails.setPolicy(this);
        this.getPaymentDetailsList().add(paymentDetails);
    }



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPolicyNumber() {
        return policyNumber;
    }

    public void setPolicyNumber(String policyNumber) {
        this.policyNumber = policyNumber;
    }

    public String getPolicyType() {
        return policyType;
    }

    public void setPolicyType(String policyType) {
        this.policyType = policyType;
    }

    public Date getCoverFmDate() {
        return coverFmDate;
    }

    public void setCoverFmDate(Date coverFmDate) {
        this.coverFmDate = coverFmDate;
    }

    public Date getCoverToDate() {
        return coverToDate;
    }

    public void setCoverToDate(Date coverToDate) {
        this.coverToDate = coverToDate;
    }

    public String getInsuranceCompany() {
        return insuranceCompany;
    }

    public void setInsuranceCompany(String insuranceCompany) {
        this.insuranceCompany = insuranceCompany;
    }

    public long getPremium() {
        return premium;
    }

    public void setPremium(long premium) {
        this.premium = premium;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<PaymentDetails> getPaymentDetailsList() {
        return paymentDetailsList;
    }

    public void setPaymentDetailsList(List<PaymentDetails> paymentDetailsList) {
        this.paymentDetailsList = paymentDetailsList;
    }
}
