package com.nixmash.cloud.mvc.ui;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.Locale;

@Component
public class WebUI {

    private static final Logger logger = LoggerFactory.getLogger(WebUI.class);

    public static final String FLASH_MESSAGE_KEY_FEEDBACK = "feedbackMessage";

    @Resource
    private MessageSource messageSource;

    // region Message Functions

    public String getMessage(String code, Object... params) {
        Locale current = LocaleContextHolder.getLocale();
        return messageSource.getMessage(code, params, current);
    }

    public void addFeedbackMessage(RedirectAttributes model, String code, Object... params) {
        String localizedFeedbackMessage = getMessage(code, params);
        model.addFlashAttribute(FLASH_MESSAGE_KEY_FEEDBACK, localizedFeedbackMessage);
    }

    public String parameterizedMessage(String code, Object... params) {
        return getMessage(code, params);
    }

    // endregion


}

