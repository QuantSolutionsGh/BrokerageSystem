package com.insurance.brokman.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class SalesAgent {

    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;

    private String agentName;

    @OneToMany(mappedBy="salesAgent")
    private List<Policy> policyList=new ArrayList<>();



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public List<Policy> getPolicyList() {
        return policyList;
    }

    public void setPolicyList(List<Policy> policyList) {
        this.policyList = policyList;
    }
}
