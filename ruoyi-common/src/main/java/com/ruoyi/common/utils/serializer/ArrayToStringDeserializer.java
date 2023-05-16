package com.ruoyi.common.utils.serializer;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.ruoyi.common.utils.StringUtils;

import java.io.IOException;
import java.lang.reflect.Array;

public class ArrayToStringDeserializer extends JsonDeserializer<String[]> {

    @Override
    public String[] deserialize(JsonParser jsonParser, DeserializationContext context)throws IOException, JsonProcessingException {
        try {
            if (jsonParser!= null && StringUtils.isNotEmpty(jsonParser.getText())){
                System.out.println(jsonParser.getText());
                JSONArray tempJsonArray = JSON.parseArray(jsonParser.getText());
                String[] array = new String[tempJsonArray.size()];
                for (int i = 0; i < tempJsonArray.size()-1; i++) {
                    array[i] = tempJsonArray.getString(i);
                }
                System.out.println(array);
                return array;
            }else {
                return null;
            }
        } catch (Exception e){
            throw  new RuntimeException(e);
        }
    }
}
