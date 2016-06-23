package MT;




import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class myservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	@SuppressWarnings("resource")
	
    public myservlet() {
        
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("fault", "no");
		request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
            
		HttpSession session = request.getSession();
		if(session.getAttribute("username")!=null)
		{
			request.getRequestDispatcher("WEB-INF/Submit.jsp").forward(request, response);
			return;
			
		}
		String username = request.getParameter("username");
		String password = request.getParameter("passcode");
		String confirm = request.getParameter("cpasscode");
                
                
		
		if((!password.equals(confirm))|| (username.isEmpty()) || (password.isEmpty()) || login.userdatabase.containsKey(username))
		{
			
			
			request.setAttribute("Signin", "failed");
			request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
			
		}
		
		else
		{
                       
                        
			login.userdatabase.put(username, password);
		
			session.setAttribute("username", username);
			request.getRequestDispatcher("WEB-INF/Submit.jsp").forward(request, response);
			
		}
                
                
                 
   }
}
