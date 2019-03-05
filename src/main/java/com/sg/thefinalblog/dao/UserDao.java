/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.thefinalblog.dao;

import com.sg.thefinalblog.dto.User;
import java.util.List;

/**
 *
 * @author heath
 */
public interface UserDao {

    public User addUser(User user);

    public void removeUser(int id);

    public void updateUser(User user);
    
    public User getUserById(int userId);

    public User getUserByUsername(String username);

    public List getAllUsers();

}
