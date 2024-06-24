package com.sjc.SJC_V1.custom.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjc.SJC_V1.model.Users;

@Service
public class UserService {

    @Autowired
    private UserDao UserDao;

    public List<Users> getAllUsers() {
        return UserDao.findAll();
    }

    public Optional<Users> getUserById(Long id) {
        return UserDao.findById(id);
    }

    public Users createUser(Users user) {
        return UserDao.save(user);
    }

    public Users updateUser(Users user) {
        return UserDao.save(user);
    }

    public void deleteUser(Long id) {
        UserDao.deleteById(id);
    }
}