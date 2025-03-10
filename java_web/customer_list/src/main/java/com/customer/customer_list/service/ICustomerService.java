package com.customer.customer_list.service;

import com.customer.customer_list.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
//    boolean add(Customer student);
}