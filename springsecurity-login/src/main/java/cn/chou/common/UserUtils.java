package cn.chou.common;

import org.springframework.security.core.context.SecurityContextHolder;

import cn.chou.bean.SysUser;

/**
 * Created by zhouj on 2018/4/20.
 */
public class UserUtils {
    public static SysUser getCurrentUser() {
        return (SysUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

//    public static void main(String[] args) {
//        String password = "888";
//        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//        String encode = encoder.encode(password); // 密码明文加密
//        System.out.println("password encode=" + encode);
//    }
}
