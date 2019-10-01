package edu.adhira.adhira.authentication;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@EnableAutoConfiguration
public class Address {
    @Id
    @JsonInclude
    private int userId;
    private String flateNo;
    private String street;
    private String city;
    private long pin;
    private String state;

    public Address() {
    }

    public Address(int userId, String flateNo, String street, String city, long pin, String state, String country) {
        this.userId = userId;
        this.flateNo = flateNo;
        this.street = street;
        this.city = city;

        this.pin = pin;
        this.state = state;
        this.country = country;
    }

    public int getUserId() {

        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
