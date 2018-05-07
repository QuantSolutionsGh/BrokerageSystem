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


    private Date transactonDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getTransactonDate() {
        return transactonDate;
    }

    public void setTransactonDate(Date transactonDate) {
        this.transactonDate = transactonDate;
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
}
