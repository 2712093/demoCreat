package com.merry.cms.exception;


public class PassportException  extends RuntimeException {
    public PassportException() {
        super();
    }

    public PassportException(Throwable cause) {
        super(cause);
    }

    public PassportException(String message) {
        super(message);
    }

    public PassportException(String message, Throwable cause) {
        super(message, cause);
    }

    protected PassportException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
