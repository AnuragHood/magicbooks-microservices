package edu.adhira.adhira.authentication;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;

import javax.persistence.*;

@Entity
@EnableAutoConfiguration
@SequenceGenerator(name = "seq", initialValue = 565482147, allocationSize = 100)

public class Address {
    @Id
    @JsonInclude
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq")
    private int addressId;
    private String flateNo;
    private String street;
    private String city;
    private long pin;
    private String state;

    public Address() {
    }
    
    public int getaddressId() {

        return addressId;
    }

    public void setaddressId(int addressId) {
        this.addressId = addressId;
    }

    private String country;

    public String getFlateNo() {
        return flateNo;
    }

    public void setFlateNo(String flateNo) {
        this.flateNo = flateNo;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public long getPin() {
        return pin;
    }

    public void setPin(long pin) {
        this.pin = pin;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
