package cn.chou.mapper;

import java.util.List;

import cn.chou.bean.SysRole;

public interface SysRoleMapper {
    List<SysRole> getRolesByUserId(Integer userId);
    
}