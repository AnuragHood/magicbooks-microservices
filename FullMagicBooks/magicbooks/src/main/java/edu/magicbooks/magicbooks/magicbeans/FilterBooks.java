package edu.magicbooks.magicbooks.magicbeans;


import java.util.Arrays;

public class FilterBooks {
    String[] categoryList;
    Integer[] ratingList;
    String value;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String[] getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(String[] categoryList) {
        this.categoryList = categoryList;
    }

    public Integer[] getRatingList() {
        return ratingList;
    }

    public void setRatingList(Integer[] ratingList) {
        this.ratingList = ratingList;
    }

    @Override
    public String toString() {
        return "FilterBooks{" +
                "categoryList=" + Arrays.toString(categoryList) +
                ", ratingList=" + Arrays.toString(ratingList) +
                '}';
    }
}
