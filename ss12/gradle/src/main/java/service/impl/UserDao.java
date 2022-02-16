package service.impl;

import model.User;
import reponsitory.IUserRepository;
import reponsitory.impl.UserRepository;
import service.IUserDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements IUserDao {
private static IUserRepository iUserRepository = new UserRepository();

    @Override
    public void insertUser(User user) throws SQLException {
        iUserRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        User user= this.iUserRepository.selectUser(id);
        return user;

    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = iUserRepository.selectAllUsers();
        return userList;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean deleted = iUserRepository.deleteUser(id);
        return deleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean updated = iUserRepository.updateUser(user);
        return updated;
    }

    @Override
    public List<User> search(String country) {
        List<User> userList = iUserRepository.search(country);
        return userList;
    }

//    private void printSQLException(SQLException ex) {
//
//    }
}
