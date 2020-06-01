package com.bookit.pages;

public class SelfPage {
    /**
     *
     * @param value can be: role, name, team, batch, campus
     * @return it's value
     */
    public String getUserInfo(String value){
        String xpath = "//p[text()='"+value+"']/preceding-sibling::p";
        return "";
    }
}
