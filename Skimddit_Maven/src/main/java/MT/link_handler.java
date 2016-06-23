package MT;




import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class link_handler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int linkcount=1;
	
	static final Map<String,LinkDatabase> links = new HashMap<>();

	
	
       
    
        public link_handler() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int flag=0;
		String linkname = request.getParameter("linkname");
		String URL = request.getParameter("url");
		if(linkname.isEmpty() || URL.isEmpty())
		{
			flag=1;
			request.setAttribute("failure", "true");
			request.getRequestDispatcher("WEB-INF/Submit.jsp").forward(request, response);
		}
		if(flag!=1)
		{
			
                        
			LinkDatabase newlink = new LinkDatabase();
                     
			String username= (String)request.getParameter("newuser");
			newlink.setname(linkname);
			newlink.setURL(URL);
			newlink.setvote(0);
			newlink.setusername(username);
                        response.getWriter().println("---check1----"+newlink.getusername());
                       
                       
                      
			
			link_handler.links.put(linkname,newlink);
                     
		
			request.setAttribute("success", "true");
			request.getRequestDispatcher("WEB-INF/Submit.jsp").forward(request, response);
			
		}
		
		
		
	}

}
