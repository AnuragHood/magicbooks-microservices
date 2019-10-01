package edu.adhira.adhira.repository;

import edu.adhira.adhira.authentication.Address;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("addressRepo")
public interface AddressRepo extends CrudRepository<Address,Long> {
}
