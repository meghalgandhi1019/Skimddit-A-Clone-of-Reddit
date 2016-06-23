package MT;



import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Map<String,String>userdatabase = new HashMap<>();
       
    
	
    public login() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("username")!=null)
		{
			
			request.getRequestDispatcher("/WEB-INF/Submit.jsp").forward(request,response);
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/Signin.jsp").forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int flag=0;
	
		HttpSession session = request.getSession();
		if(session.getAttribute("username")!=null)
		{
			
			request.getRequestDispatcher("/WEB-INF/Submit.jsp").forward(request,response);
			return;
		}
		
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("passcode");
		
		
		if(username.isEmpty()|| password.isEmpty() || !login.userdatabase.containsKey(username) || !password.equals(login.userdatabase.get(username)))
		{
			flag=1;
			response.getWriter().println(login.userdatabase.get(username));
			request.setAttribute("loginfailed", "yes");
			request.getRequestDispatcher("/WEB-INF/Signin.jsp").forward(request,response);
		}
		if(flag==0)
		{
			session.setAttribute("username", username);
			request.getRequestDispatcher("/WEB-INF/Submit.jsp").forward(request,response);
		}
	}
	
	
}

