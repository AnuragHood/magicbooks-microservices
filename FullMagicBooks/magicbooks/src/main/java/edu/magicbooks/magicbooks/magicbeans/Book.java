package edu.magicbooks.magicbooks.magicbeans;

import com.fasterxml.jackson.annotation.JsonInclude;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;

import java.util.List;

@Entity
@EnableAutoConfiguration
@SequenceGenerator(name = "seq", initialValue = 357948, allocationSize = 100)
public class Book {
    @Id
    @JsonInclude
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq")
    private Long id;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private String category;
    @Column(nullable = false)
    private String author;
    @Column(nullable = true)
    private String publishingDate;
    @Column(nullable = true)
    private Integer rating;
    @Column(nullable = true)
    private String picture;
    @Column(nullable = true)
    private String pictures;
    @Column(nullable = true)
    private Float priceDrop;
    @Column(nullable = false)
    private Long bookMrp;
    @Column(nullable = false)
    private Long bookSellingPrice;
    @Column(nullable = false)
    private Long quantity;
    @Transient
    private int itemInCart;

    public int getItemInCart() {
		return itemInCart;
	}

	public void setItemInCart(int itemInCart) {
		this.itemInCart = itemInCart;
	}

	public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {

        return "Book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", author='" + author + '\'' +
                ", publishingDate='" + publishingDate + '\'' +
                ", rating=" + rating +
                ", picture='" + picture + '\'' +
                ", pictures='" + pictures + '\'' +
                ", priceDrop=" + priceDrop +
                ", bookMrp=" + bookMrp +
                ", bookSellingPrice=" + bookSellingPrice +
                ", quantity=" + quantity +
                ", bulkFile=" + bulkFile +
                ", bookButton='" + bookButton + '\'' +
                '}';
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Long getBookMrp() {
        return bookMrp;
    }

    public void setBookMrp(Long bookMrp) {
        this.bookMrp = bookMrp;
    }

    public Long getBookSellingPrice() {
        return bookSellingPrice;
    }

    public void setBookSellingPrice(Long bookSellingPrice) {
        this.bookSellingPrice = bookSellingPrice;
    }


    public Float getPriceDrop() {
        return priceDrop;
    }

    public void setPriceDrop(Float priceDrop) {
        this.priceDrop = priceDrop;
    }

    public String getPictures() {
        return pictures;
    }

    public void setPictures(String pictures) {
        this.pictures = pictures;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Transient
    @Size(min = 1, max = 10)
    private List<MultipartFile> bulkFile;
    @Transient
    private String bookButton;

    public String getBookButton() {
        return bookButton;
    }

    public void setBookButton(String bookButton) {
        this.bookButton = bookButton;
    }

    public List<MultipartFile> getBulkFile() {
        return bulkFile;
    }

    public void setBulkFile(List<MultipartFile> bulkFile) {
        this.bulkFile = bulkFile;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPublishingDate() {
        return publishingDate;
    }

    public void setPublishingDate(String publishingDate) {
        this.publishingDate = publishingDate;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
