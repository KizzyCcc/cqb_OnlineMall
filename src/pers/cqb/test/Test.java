package pers.cqb.test;

import org.springframework.beans.factory.annotation.Value;

public class Test {

    @Value("${key}")
    private String value;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public static void main(String[] args) {
        String s1 = null;
        String s2 = "";
        System.out.println(s1);
        System.out.println(s2);
    }
}
