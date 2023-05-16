package com.ruoyi.common.utils.serializer;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.lang.reflect.Array;


public class ArrayToStringSerializer extends JsonSerializer<Array> {

    @Override
    public void serialize(Array array, JsonGenerator jsonGenerator, SerializerProvider serializerProvider)throws IOException{
        jsonGenerator.writeString(array.toString());
    }
}
