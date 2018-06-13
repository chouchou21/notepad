package cn.chou.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import cn.chou.bean.SysUser;
import cn.chou.mapper.SysUserMapper;

@Component
public class UserService implements UserDetailsService {

    private Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired
    SysUserMapper userMapper;
    
//  @Autowired
//  private PasswordEncoder passwordEncoder;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUser user = userMapper.loadUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("用户名不对"); // 此行代码无效，spring会重新抛出BadCredentialsException异常
        }

//        String password = passwordEncoder.encode("123456");
//        SysUser user = new SysUser(username, password);
        logger.info("登录的ID: {}", user.getUserId());
        logger.info("登录的账户: {}", user.getUsername());
        logger.info("登录的姓名: {}", user.getRealname());
        return user;
    }

}
