package MT;





import java.io.IOException;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class load_dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public load_dashboard() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			int[] vote = new int[link_handler.links.size()];
                        int i=0;
			for(String s : link_handler.links.keySet())
	   		{	
			  vote[i] = link_handler.links.get(s).getvote();
			  i++;
			
		    }
			
		Arrays.sort(vote);
		String[] sortedlinks = new String[vote.length];
                
		
		i=0;
		int j=0;
		
		for(int k=0;k<vote.length;k++)
		{
			for(String s : link_handler.links.keySet())
	   		{	
				
				if(link_handler.links.get(s).getvote()==vote[i])
					
				{
					int flag=0;
					for(int l=0; l<k;l++)
					{
						if(sortedlinks[l].equals(link_handler.links.get(s).getname()))
						{
							flag=1;
							break;
						}
					}
					if(flag==0)
					{
						sortedlinks[j]=link_handler.links.get(s).getname();
                                                
						i++;
						j++;
					    break;
					}
				}
			
	        }
		}	
		
		for(int d=0;d<sortedlinks.length;d++)
		{
			System.out.println("---------"+sortedlinks[d]);
                       
		}
                
                
		
	    System.out.println("-------------------------------------------------------------------------------");
		HttpSession session = request.getSession();
		
		session.setAttribute("links", link_handler.links);
		if(sortedlinks.length!=0)
		{
			session.setAttribute("sortedlinks",sortedlinks);
		}
		else
		{
			
			session.setAttribute("empty","true");
		}
		request.getRequestDispatcher("/WEB-INF/show_dashboard.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
