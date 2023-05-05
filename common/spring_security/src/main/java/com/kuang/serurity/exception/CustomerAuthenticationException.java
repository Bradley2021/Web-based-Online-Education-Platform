package com.kuang.serurity.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * @author starsea
 * @date 2022-07-27 16:30
 */
public class CustomerAuthenticationException extends AuthenticationException {

    public CustomerAuthenticationException(String message) {
        super(message);
    }

}
