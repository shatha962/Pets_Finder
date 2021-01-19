package com.axsos.petsfinder.repositories;

import com.axsos.petsfinder.models.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface RoleRepository extends CrudRepository<Role,Long> {

}
