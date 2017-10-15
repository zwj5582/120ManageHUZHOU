package com.meliora.exception;

public class BusinessException extends RuntimeException {

    private static final long serialVersionUID = -8067628071408925276L;

    public BusinessException() {
        super();
    }

    public BusinessException(String message) {
        super(message);
    }

    public BusinessException(String message, Throwable throwable) {
        super(message, throwable);
    }

    public BusinessException(Throwable throwable) {
        super(throwable);
    }


}
