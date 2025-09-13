package com.mvr.crud.controller;

import com.mvr.crud.repository.UsersRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class CrudController {

    private final UsersRepository repository;

    public CrudController(UsersRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/getAll")
    public List<String> getAllUsers() {
        return repository.findAllUsernames();
    }

    @DeleteMapping("/deleteAll")
    public String deleteAllUsers() {
        repository.deleteAll();
        return "Deleted all users";
    }

    @PostMapping("/create")
    public String createNewUser(@RequestParam String username,
                                @RequestParam String email) {
        repository.save(username, email);
        return "New user created";
    }
}
