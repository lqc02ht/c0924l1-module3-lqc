package com.customer.customer_list.service;

import com.customer.customer_list.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Lê Quốc Cường","07/03/2004","Ha Noi","./"));
        customerList.add(new Customer("Lê Quốc Cường","12/08/2004","Ha Noi","./"));
        customerList.add(new Customer("Lê Quốc Cường","04/12/2004","Ha Noi","./"));
        customerList.add(new Customer("Lê Quốc Cường","12/07/2004","Ha Noi","./"));
        customerList.add(new Customer("Lê Quốc Cường","18/02/2004","Ha Noi","./"));
        customerList.add(new Customer("Lê Quốc Cường","23/10/2004","Ha Noi","./"));
    }
    @Override
    public List<Customer> findAll() {
        return customerList;
    }
}