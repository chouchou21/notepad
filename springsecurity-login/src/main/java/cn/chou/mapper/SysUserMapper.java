package cn.chou.mapper;

import cn.chou.bean.SysUser;

public interface SysUserMapper {
    /** 登录时，通过username获得SysUser对象 */
    SysUser loadUserByUsername(String username);
}
