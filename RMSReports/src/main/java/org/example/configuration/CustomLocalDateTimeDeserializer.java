package org.example.configuration;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;

public class CustomLocalDateTimeDeserializer extends JsonDeserializer<Object> {
    @Override
    public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
        String dateStr = p.getText();

        // Try parsing with offset format (e.g., '2023-09-07T00:00:00+05:00')
        try {
            return OffsetDateTime.parse(dateStr, DateTimeFormatter.ISO_OFFSET_DATE_TIME);
        } catch (Exception e) {
            // If parsing with the offset format fails, try parsing without offset (e.g., '2023-09-07T00:00:00')
            try {
                LocalDateTime localDateTime = LocalDateTime.parse(dateStr, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
                // You can set a default offset here, e.g., UTC
                return localDateTime.atOffset(ZoneOffset.UTC);
            } catch (Exception ex) {
                // Handle any parsing errors here.
                throw new IOException("Failed to parse datetime: " + dateStr, ex);
            }
        }
    }
}