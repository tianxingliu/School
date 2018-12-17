
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
 * Servlet implementation class Homepage
 */
@WebServlet("/Homepage")
public class Homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homepage() {
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
		
		String notdata = this.getServletContext().getRealPath("Assignment3.json");
		int front = notdata.indexOf(".metadata");
		String middle = ".metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/CSCI201L_Tianxing_Assignment3/Assignment3.json";
		String frontstring = notdata.substring(0, front);
		String all = frontstring + "CSCI201L_Tianxing_Assignment3/WebContent/Assignment3.json";
		System.out.println(all);
		FileWriter fw = new FileWriter(all);
		fw.write(database);
		fw.close();
		session.setAttribute("database", database);
		String next = "/HomePage.jsp";
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next); 
		dispatch.forward(request,response);
	}

}
