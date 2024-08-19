package org.example.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import org.example.configuration.CustomLocalDateTimeDeserializer;

import javax.persistence.Id;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;

abstract class BaseDomain {

    public boolean IsActive;
    public int CreatedById;
    //  @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss[.SSS][.SS][.S]")
    @JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
    public Object CreatedOn;
    public int ModifiedById;
    // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss[.SSS][.SS][.S]")
    @JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
    public Object ModifiedOn;
    @JsonDeserialize(using = CustomLocalDateTimeDeserializer.class)
    public Object date;
    public String time;
}
