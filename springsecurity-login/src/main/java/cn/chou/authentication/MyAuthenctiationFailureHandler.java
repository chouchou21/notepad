package cn.chou.authentication;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import cn.chou.dto.BaseResponse;

@Component("myAuthenctiationFailureHandler")
public class MyAuthenctiationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
    private Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired
    private ObjectMapper objectMapper;
    
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
        if (exception instanceof UsernameNotFoundException || exception instanceof BadCredentialsException) {
            logger.info("用户名或密码输入错误，登录失败!");
        } else if (exception instanceof DisabledException) {
            logger.info("账户被禁用，登录失败，请联系管理员!");
        } else {
            logger.info("登录失败!");
        }
        
//        logger.info("登录失败");
        response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(objectMapper.writeValueAsString(new BaseResponse(exception.getMessage())));
    }
}
