package org.zerock.exception;

import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice   //이 객체는 스프링의 컨트롤러에서 발생하는 예외를 처리하는 객체다
@Log4j
public class CommonExceptionAdvice {
    // @ControllerAdvice를 이용한 예외처리, 별도의 로직처리는 안함


    @ExceptionHandler(Exception.class)
    public String except(Exception ex, Model model){
        log.error("Exception.............."+ex.getMessage());

        model.addAttribute("exception",ex);
        log.error(model);
        return "error_page";

    }
}
