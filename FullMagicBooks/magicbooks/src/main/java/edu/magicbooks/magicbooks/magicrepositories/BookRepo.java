package edu.magicbooks.magicbooks.magicrepositories;

import edu.magicbooks.magicbooks.magicbeans.Book;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepo extends CrudRepository<Book, Long>, EntityManagerRepo {
    @Query(value = "SELECT *  FROM Book WHERE name like :searchParam% OR category like  :searchParam% OR author like  :searchParam%", nativeQuery = true)
    List<Book> searchBook(@Param("searchParam") String searchParam);

    @Query(value = "SELECT *  FROM Book WHERE category in :categoryList and rating in :ratingList", nativeQuery = true)
    List<Book> filterBooks(@Param("categoryList") String[] categoryList, @Param("ratingList") Integer[] ratingList);

    @Query(value = "SELECT *  FROM Book WHERE category in :categoryList", nativeQuery = true)
    List<Book> filterBooksByCategory(@Param("categoryList") String[] categoryList);

    @Query(value = "SELECT *  FROM Book WHERE rating in :ratingList", nativeQuery = true)
    List<Book> filterBooksByRating(@Param("ratingList") Integer[] ratingList);

    @Query(value = "SELECT *  FROM Book WHERE category in :categoryList and rating in :ratingList and id in(Select id from Book where name like :searchParam% OR category like  :searchParam% OR author like  :searchParam%)",
            nativeQuery = true)
    List<Book> filterSearchedBooks(@Param("categoryList") String[] categoryList, @Param("ratingList") Integer[] ratingList, @Param("searchParam") String searchParam);

    @Query(value = "SELECT *  FROM Book WHERE category in :categoryList  and id in(Select id from Book where name like :searchParam% OR category like  :searchParam% OR author like  :searchParam%)", nativeQuery = true)
    List<Book> filterSearchedBooksByCategory(@Param("categoryList") String[] categoryList, @Param("searchParam") String searchParam);

    @Query(value = "SELECT *  FROM Book WHERE rating in :ratingList and id in(Select id from Book where name like :searchParam% OR category like  :searchParam% OR author like  :searchParam%)", nativeQuery = true)
    List<Book> filterSearchedBooksByRating(@Param("ratingList") Integer[] ratingList, @Param("searchParam") String searchParam);

    @Query(value = "SELECT *  FROM Book WHERE id in :idList", nativeQuery = true)
    List<Book> findList(@Param("idList") Long[] idList);

    @Modifying
    @Query(value = "Update book set quantity = -1 where id = ?", nativeQuery = true)
    void setQuantityToZero(Long id);

}
