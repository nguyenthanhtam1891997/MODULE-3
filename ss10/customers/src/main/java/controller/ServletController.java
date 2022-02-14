package controller;



import model.Customers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletController", value = "/demo")
public class ServletController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customers> customersList = new ArrayList<>();
        customersList.add(new Customers("Mai van toan","1983-08-20","Ha noi","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNvwDk3lNCtTkPbx14k69ZYyRlN9Rmm9Fk9w&usqp=CAU"));
        customersList.add(new Customers("nguyen van nam","1983-08-21","bac giang","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNvwDk3lNCtTkPbx14k69ZYyRlN9Rmm9Fk9w&usqp=CAU"));
        customersList.add(new Customers("nguyen thai hoa","1983-08-21","nam dinh","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNvwDk3lNCtTkPbx14k69ZYyRlN9Rmm9Fk9w&usqp=CAU"));
        customersList.add(new Customers("tran dăng khoa","1983-08-21","ha tay","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNvwDk3lNCtTkPbx14k69ZYyRlN9Rmm9Fk9w&usqp=CAU"));
        customersList.add(new Customers("nguyen dinh thi","1983-08-21","ha noi","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNvwDk3lNCtTkPbx14k69ZYyRlN9Rmm9Fk9w&usqp=CAU"));

    request.setAttribute("listCustomers",customersList);
request.getRequestDispatcher("/tex.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
