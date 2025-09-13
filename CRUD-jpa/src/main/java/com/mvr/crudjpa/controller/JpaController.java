package com.mvr.crudjpa.controller;

import com.mvr.crudjpa.entity.User;
import com.mvr.crudjpa.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class JpaController {
    private final UserRepository repository;

    public JpaController(UserRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/getAll")
    public List<User> getAllUsers() {
        return repository.findAll();
    }

    @DeleteMapping("/deleteAll")
    public String deleteAllUsers() {
        repository.deleteAll();
        return "Deleted all users";
    }

    @PostMapping("/create")
    public String createNewUser(@RequestParam String username,
                                @RequestParam String email) {
        repository.save(new User(username, email));
        return "New user created";
    }
}
