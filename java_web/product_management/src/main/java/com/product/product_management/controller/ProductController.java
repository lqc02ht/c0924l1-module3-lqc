package com.product.product_management.controller;

import com.product.product_management.service.ProductService;
import com.product.product_management.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                request.getRequestDispatcher("/product-form.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("product", productService.getProductById(id));
                request.getRequestDispatcher("/product-form.jsp").forward(request, response);
                break;
            case "delete":
                productService.deleteProduct(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("products");
                break;
            case "search":
                String name = request.getParameter("name");
                request.setAttribute("products", productService.searchProductByName(name));
                request.getRequestDispatcher("/product-list.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("products", productService.getAllProducts());
                request.getRequestDispatcher("/product-list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");

        Product product = new Product(id, name, price, description, manufacturer);

        String action = request.getParameter("action");
        if ("update".equals(action)) {
            productService.updateProduct(product);
        } else {
            productService.addProduct(product);
        }
        response.sendRedirect("products");
    }
}
