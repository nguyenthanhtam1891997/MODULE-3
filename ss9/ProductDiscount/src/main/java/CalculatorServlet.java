import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("name_product");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));

        double amount = price * discount * 0.01;
        double priceAmount = price + amount;

        request.setAttribute("name",productName);
        request.setAttribute("price",price);
        request.setAttribute("discount",discount);
        request.setAttribute("amount",amount);
        request.setAttribute("priceAmount",priceAmount);

        request.getRequestDispatcher("calculator.jsp").forward(request,response);
    }
}
