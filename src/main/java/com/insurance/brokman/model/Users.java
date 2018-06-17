package com.insurance.brokman.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity(name= "users")
public class Users {
    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;

    private String username;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    private String password;

    private  int enabled;

    @OneToMany(mappedBy="users")
    private List<UserRoles> rolesList=new ArrayList<>();

    public List<UserRoles> getRolesList() {
        return rolesList;
    }

    public void setRolesList(List<UserRoles> rolesList) {
        this.rolesList = rolesList;
    }
}
