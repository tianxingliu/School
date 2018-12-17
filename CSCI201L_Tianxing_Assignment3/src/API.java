

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class API
 */
@WebServlet("/API")
public class API extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public API() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String key = request.getParameter("context");
		key = key.replace(" ", "+");
		String option = request.getParameter("choice");
		System.out.println("key = " + key);
		System.out.println("option = " + option);
		String correctURL = "https://www.googleapis.com/books/v1/volumes?q=" + option + ":" + key +"&callback=handleResponse&maxResults=12";
		System.out.println("url = " + correctURL);
		session.setAttribute("url", correctURL);
		String next = "/SearchResult.jsp";
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next); 
		dispatch.forward(request,response);
		
	}
}
