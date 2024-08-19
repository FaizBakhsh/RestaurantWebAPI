package org.example.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CompanyInfo {
    public String Name;
    public String PhoneNo;
    public String Address;
    public String Logo;
}
