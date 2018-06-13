package com.insurance.brokman.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class PaymentDetails {
    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;

    @ManyToOne
    @JoinColumn(name="policyId")
    private Policy policy;


    private long amtPaid;

    private Date entryDate;


    private Date transactionDate;

    private String comments;

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public long getAmtPaid() {
        return amtPaid;
    }

    public void setAmtPaid(long amtPaid) {
        this.amtPaid = amtPaid;
    }

    public Policy getPolicy() {
        return policy;
    }

    public void setPolicy(Policy policy) {
        this.policy = policy;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }
}
