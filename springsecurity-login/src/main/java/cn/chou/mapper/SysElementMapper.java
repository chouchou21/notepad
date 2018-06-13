package cn.chou.mapper;

import java.util.List;

import cn.chou.bean.SysElement;
import cn.chou.bean.SysRole;

public interface SysElementMapper {
    List<SysElement> loadMenu();
    List<SysElement> loadUserMenu(Integer userId);
    
//    以下查询的数据没有父子关系，为不含children的查询
    List<SysElement> getMenusByUserId(Integer userId);
    List<SysElement> getMenusByRoles(List<SysRole> roles);
    List<SysElement> getMenusByRoleId(Integer roleId);
}