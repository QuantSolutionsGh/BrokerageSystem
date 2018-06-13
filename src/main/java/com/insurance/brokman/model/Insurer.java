package com.insurance.brokman.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Insurer {

    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;

    private String companyName;

    @OneToMany(mappedBy="insurer")
    private List<Policy> policyList=new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
}
