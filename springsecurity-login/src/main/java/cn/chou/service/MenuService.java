package cn.chou.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.chou.common.UserUtils;
import cn.chou.bean.SysElement;
import cn.chou.mapper.SysElementMapper;

@Component
public class MenuService {
    @Autowired
    SysElementMapper menuMapper;

    public List<SysElement> loadFullMenu(){
        System.out.println("menuMapper.loadMenu()");
        return menuMapper.loadMenu();
    }

    public List<SysElement> loadUserMenu(){
        Integer userId = UserUtils.getCurrentUser().getUserId();
        System.out.println("menuMapper.loadUserMenu(userId=" + userId + ")");
        return menuMapper.loadUserMenu(userId);
    }

    public List<SysElement> getMenusByUserId(){
//        Integer userId = UserUtils.getCurrentUser().getUserId();
//        System.out.println("getMenusByUserId(userId=" + userId + ")");
//        
//        return menuMapper.getMenusByUserId(userId);
        return null;
//        return menuMapper.getMenusByRoles(UserUtils.getCurrentUser().getRoles());
    }
    
}
