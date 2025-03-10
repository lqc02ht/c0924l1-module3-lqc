package com.customer.customer_list.controller;

import com.customer.customer_list.model.Customer;
import com.customer.customer_list.service.CustomerService;
import com.customer.customer_list.service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServelet", urlPatterns = {"/customerList"})
public class CustomerServelet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customerList = customerService.findAll();
        req.setAttribute("customerList", customerList);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);

    }
}
