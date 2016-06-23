package MT;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


public class vote_handler extends HttpServlet {
	private static final long serialVersionUID = 1L;
        int count=1;
        
          final static Map<String,ArrayList<String>> voteusermap = new HashMap<>();

    public vote_handler() {
        super();
        
    }

    @Override
    public void init() throws ServletException {
        super.init(); 
    }


    
    
      
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
           if(request.getSession().getAttribute("username")==null)
           {
               request.setAttribute("login","false");
               response.sendRedirect("login");
               return;
           }
               
               
           int flag=0;
           int insertflag=0;
            String username= (String)request.getSession().getAttribute("username");
                    
            
		if(request.getSession().getAttribute("username")!=null)
		{
                    
			String link_name="";
			
                       
			 Enumeration e = request.getParameterNames();
			    while (e.hasMoreElements()) {
			      String name = (String) e.nextElement();
                             
			      String values[] = request.getParameterValues(name);
                            
			      if (values != null) {
			        for (int i = 0; i < values.length; i++) {
			          link_name=values[i];
			        }
			      }
			    }
			    
			    LinkDatabase link = link_handler.links.get(link_name);
                            ArrayList userlist=null;
                           for(String s : voteusermap.keySet())
                            {	
                                
                                if(s.equals(link_name))
                                {
                                    userlist = voteusermap.get(s);
                                    break;
                                }
                                    
                            }
                           if(userlist!=null)
                           {
                               
                               insertflag=1;
                               
                               Iterator i = userlist.iterator();
                                while(i.hasNext())
                                {
                                     
                                    if(i.next().equals(username))
                                    {
                                        flag=1;
                                        break;
                                    }
                                }
                           } 
                           if(flag==1)
                           {
                               
                                response.sendRedirect("load_dashboard");
                                 return;
                           }
                            else
                            {
                                
                                
                                if(insertflag==0)
                                {
                                    ArrayList newuserlist = new ArrayList();
                                    newuserlist.add(username);     
                                    voteusermap.put(link_name, newuserlist);
                                }
                                else
                                {
                                   userlist.add(username);
                                    voteusermap.put(link_name, userlist);
                                }
                                 
                                 int newvote = link.getvote();
                           
                                 newvote++;
                                 link.setvote(newvote);
		                 for(String s : dislike_handler.voteusermap.keySet())
                                 {	
                                
                                    if(s.equals(link_name))
                                    {
                                        userlist = dislike_handler.voteusermap.get(s);
                                        userlist.remove(username);
                                        break;
                                    }
                                    
                                }
                                 link_handler.links.put(link_name, link);
                                 response.sendRedirect("load_dashboard");
                                 return;
                            }
                          
		}
			   
		
	}
     
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
}
}