<%@page import="MT.link_handler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import ="MT.LinkDatabase" %>
 <%@ page import="java.util.Map" %>

 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script>

	function callservlet(element)
	{
		
	
		
		
		document.location.href = "vote_handler?id="+ element.id+"";
	   
	}
	
	function dislike(element)
	{
		
		document.location.href = "dislike_handler?id="+ element.id+"";
		
	}
	
	
	function login()
	{
		
		document.location.href = "login";
		
		
	}
	

    function signin()
    {
    	 document.location.href = "myservlet";
    }


</script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
			html,body
			{
				height:auto;
			}
			 .header
            {
                
                height:100px;
                width:120 px;
                background-color:#ffcccc;
                 
                
            }
            
            .skimmdit_logo
            {
                height:60%;
                width:20%;
                float:left;
                margin-left: 20px;
                margin-top: 10px;
                padding-left: 25px;
                padding-top:25px;
                font-family:sans-serif;
                font-weight: bold;
                font-size: 25px;
                color:#0000ff;
                
            }
            
            .skimmdit_slogan
            {
                height:60%;
                width:40%;
                float:left;
                margin-left: 20px;
                margin-top: 10px;
                padding-left: 25px;
                padding-top:25px;
                font-family:sans-serif;
                font-weight: bold;
                font-size: 15px;
                color:#0000ff;
                
            }
            
             .account
            {
                height:60%;
                width:20%;
                float:left;
                margin-left: 20px;
                margin-top: 10px;
                padding-left: 25px;
                padding-top:25px;
                font-family:sans-serif;
                font-weight: bold;
                font-size: 15px;
                color:blue;
                
            }
            
            
            
            .login_container
            {
                 
                width:inherit;
                height:auto;
                background-color:#cccccc;
               
                  
            }
            
            .link_container
            {
               margin-top:10px;
               height:50px;
               width:inherit;
              border-bottom: 1px solid black;
               background-color:#cccccc;
               
               
           }
            
            .link_detail
            {
            
               height:25px;
               width:inherit;
               text-align:left;
               padding-left:130px;
               padding-top:10px;
               line-height:10px;
               font-family: sans-serif;
               font-weight:bold;
               color:blue;
               font-size:14px;
            
            }
            
            .vote_button
            {
            
              height:25px;
              width:25px;
              float:left;
              margin-left:10px;
              margin-top:10px;
            }
            
             .vote_count
            {
            
              height:25px;
              width:auto;
              float:left;
              margin-left:10px;
              margin-top:10px;
              color:blue;
              text-align:center;
            }
            
            .haording
            {
            
            width:ingerit;
            height:300px;
            background-color: grey;
            text-align:center;
            line-height:150px;
            color:blue;
            
            }
            a:hover
            {
              cursor:pointer;
            
            }
            
            img:hover
            {
            	cursor:pointer;
            }
            
            .account:hover
            {
            	cursor:pointer;
            }
            
</style>

</head>

<body>

<div class="header">
     
     <div class="skimmdit_logo">Skimmdit</div>
     <%
          String user =(String) request.getSession().getAttribute("username");
          if(user!=null)
          {
        	  %>
                  
                                <div class="account"> Logged In: <%=user%> </div>
        	  		<div class="account" onclick="login()">Go back to your Account!</div>
        	  <% 
        	  
          }
          else
          {
        	  %>
        	  
        	      <div class="skimmdit_slogan"> See,Vote,Enjoy!</div>
        	      <div class = "account" onclick="signin()">register with skimmdit</div>
        	  <% 
      	  
          } 
           
     %>
     
</div>

<div class="login_container">

    
   
    <%
      
         @SuppressWarnings("unchecked")
         
         Map<String,LinkDatabase> links = (Map<String,LinkDatabase>)session.getAttribute("links");
         String[] slinks = (String[])session.getAttribute("sortedlinks");
         int i=0;
         if(slinks!=null)
         {
         
	        for(int j=slinks.length-1; j>=0;j--)
	        {
	        	for(String s : links.keySet())
	       		{	
	        		
	        		if(links.get(s).getname().equals(slinks[j]))
	        		{
	        			i++;
	        	    	   %>
	        	    	        
                                   
	        	    	        <div class="link container" style="border-bottom:1px solid black;" value="<%=i%>">
                                            
	        	    	        <div class="vote_button"><img src="Graphics/Vote_u.png" id="<%=s%>" width="20" height="20" onclick="callservlet(this)"></img></div>
	        	    	        <div class="vote_count"> <%= links.get(s).getvote() %> </div>
	        	    	   	<div class="vote_button"><img src="Graphics/Vote_d.png" id="<%=s%>" width="20" height="20" onclick="dislike(this)"></img></div>	
                                       
                                        <div class="link_detail">[<%=i%>] Name :  <%= links.get(s).getname() %> </div>
	        	    	        <div class="link_detail"> <a href="<%=links.get(s).getURL()%>">URL : <%=links.get(s).getURL() %> </a></div>
                                         <div class="link_detail"> Submitted by : <%= links.get(s).getusername()%></div> 
	        	                   	         
	        	    	    <% 
	        	    	    break;
	        		}
	        		
	       		}
	        }
         }	
   		if(i==0)
   		{
   			%>
   			     <div class="hoarding">There are no links that have been posted!</div>
   			<% 
   		}
    
    
 %>

  
</div>

</body>
</html>