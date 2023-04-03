package com.ruoyi.common.utils.serializer;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.ruoyi.common.utils.StringUtils;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

public class DateJsonDeserializer extends JsonDeserializer<Date> {

    public static final SimpleDateFormat format = new SimpleDateFormat("HH:mm");

    @Override
    public Date deserialize(JsonParser jsonParser, DeserializationContext context)throws IOException, JsonProcessingException {
        try {
            if (jsonParser!= null && StringUtils.isNotEmpty(jsonParser.getText())){
                return format.parse(jsonParser.getText());
            }else{
                return null;
            }
        } catch (Exception e){
//            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }
}
