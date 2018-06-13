package cn.chou.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cn.chou.bean.SysElement;
import cn.chou.bean.SysUser;
import cn.chou.common.UserUtils;
import cn.chou.service.MenuService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api("主界面")
@RestController
@RequestMapping("/config")
public class SystemBasicController {

    @Autowired
    MenuService menuService;

    @ApiOperation(value = "菜单列表", notes = "首页菜单")
    @RequestMapping(value = "/sysmenu", method = RequestMethod.GET)
    public List<SysElement> sysMenu() {
//        return menuService.getMenusByUserId();
        return menuService.loadFullMenu();
    }

    @ApiOperation(value = "用户菜单列表", notes = "首页菜单")
    @RequestMapping(value = "/sysmenu_user", method = RequestMethod.GET)
    public List<SysElement> userMenu() {
//        return menuService.getMenusByUserId();
        return menuService.loadUserMenu();
    }

    @ApiOperation(value = "登录用户", notes = "当前用户")
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public SysUser currentUser() {
        return UserUtils.getCurrentUser();
    }

    
/*
//    @RequestMapping(value = "/menuTree/{roleid}", method = RequestMethod.GET)
//    public Map<String, Object> menuTree(@PathVariable Long roleid) {

    @ApiOperation(value = "导航菜单", notes = "显示导航")
    @RequestMapping(value = "/menuTree", method = RequestMethod.GET)
    public Map<String, Object> menuTree() {
        
        Map<String, Object> map = new HashMap<>();
        List<SysElement> menus = new ArrayList<>(); //menuService.menuTree();
        
        SysElement element = new SysElement(1100, "menu_team", "组织用户", 1000);
        menus.add(element);
        element = new SysElement(1101, "menu_dept", "__组织单位", 1100);
        menus.add(element);
        element = new SysElement(1102, "menu_user", "__用户管理", 1100);
        menus.add(element);
        element = new SysElement(1103, "menu_role", "__角色权限", 1100);
        menus.add(element);
        element = new SysElement(1200, "menu_app", "应用接入", 1000);
        menus.add(element);
        element = new SysElement(1201, "menu_app_register", "__应用注册", 1200);
        menus.add(element);
        element = new SysElement(1202, "menu_link", "__连接管理", 1200);
        
//        element.setchildren();
        menus.add(element);
        element = new SysElement(1300, "menu_datasource", "数据资源", 1000);
        menus.add(element);
        element = new SysElement(1301, "menu_catalog", "__资源目录", 1300);
        menus.add(element);
        element = new SysElement(1302, "menu_resource", "__资源管理", 1300);
        menus.add(element);
        element = new SysElement(1303, "menu_catalog_item", "__资源列表", 1300);
        menus.add(element);
        element = new SysElement(1304, "menu_authorize", "__授权管理", 1300);
        menus.add(element);
        element = new SysElement(1400, "menu_exchange", "交换中心", 1000);
        menus.add(element);
        map.put("menus", menus);
        return map;
    }*/
}
