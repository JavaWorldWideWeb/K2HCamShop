/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import sv.iuh.project.model.UserShop;

/**
 *
 * @author Tuan Khang
 */
public interface LoginService {
    public UserShop login(String uname, String passwd);
}