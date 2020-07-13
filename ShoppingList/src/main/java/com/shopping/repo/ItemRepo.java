package com.shopping.repo;

import org.springframework.data.repository.CrudRepository;

import com.shopping.entity.Item;

public interface ItemRepo extends CrudRepository<Item, Integer> {

}
