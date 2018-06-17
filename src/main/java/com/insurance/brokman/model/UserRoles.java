package com.insurance.brokman.model;


import javax.persistence.*;

@Entity(name = "user_roles")
public class UserRoles {
    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }



    private String role;

    @ManyToOne
    @JoinColumn(name="username")
    private Users users;

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
