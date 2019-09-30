package edu.magicbooks.magicbooks.utils;

import edu.magicbooks.magicbooks.magicbeans.Book;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class UtilityHelper {

    public static void sortByName(List<Book> bookList) {

        Comparator<Book> compareByName = (Book o1, Book o2) ->
                o1.getName().compareTo(o2.getName());
        Collections.sort(bookList, compareByName);
    }

    public static void sortByPriceLowToHigh(List<Book> bookList) {

        Comparator<Book> compareByPrice = (Book o1, Book o2) ->
                o1.getBookSellingPrice().compareTo(o2.getBookSellingPrice());
        Collections.sort(bookList, compareByPrice);
    }

    public static void sortByPriceHighToLow(List<Book> bookList) {
        Comparator<Book> compareByPrice = (Book o1, Book o2) ->
                o1.getBookSellingPrice().compareTo(o2.getBookSellingPrice());
        Collections.sort(bookList, compareByPrice.reversed());
    }

    public static void sortByRating(List<Book> bookList) {
        Comparator<Book> compareByRating = (Book o1, Book o2) ->
                o1.getRating().compareTo(o2.getRating());
        Collections.sort(bookList, compareByRating.reversed());
    }

    public static List<Book> removeRedundancyFromList(List<Book> bookList) {
        return bookList.stream().filter(b -> b.getQuantity() > 0 && b.getBookSellingPrice() > 0).collect(Collectors.toList());
    }

    private UtilityHelper() {
    }

    public static List<Book> filterByCategory(List<Book> bookList, String category) {

        return bookList.stream().filter(b -> b.getCategory().equalsIgnoreCase(category)).collect(Collectors.toList());

    }
}
