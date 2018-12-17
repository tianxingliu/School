import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class Homepage2
 */
@WebServlet("/Homepage2")
public class Homepage2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homepage2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String database = request.getParameter("hiddenValue");
		FileWriter fw = new FileWriter("/Users/tianxingliu/eclipse-workspace/CSCI201L_Tianxing_Assignment3/WebContent/Assignment3.json");
		fw.write(database);
		fw.close();
		session.setAttribute("database", database);
		String next = "/HomePage.jsp";
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next); 
		dispatch.forward(request,response);
	}

}