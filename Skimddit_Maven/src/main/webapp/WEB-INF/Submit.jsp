

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
    
    

    
    <%! 
    
    	String name;
       
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function logout()
{
	document.location.href="logout";	
}

function load()
{
      
	document.location.href = "load_dashboard";	
}

</script>

<style>




 .header
            {
                
                height:100px;
                width:120 px;
                background-color:#ffcccc;
                 
                
            }
            
            .skimmdit_logo
            {
                height:60%;
                width:10%;
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
            
            .login_container
            {
                 
                width:inherit;
                height:530px;
                background-color:#cccccc;
                  
            }
            
            .login_form
            {
                
                float:left;
                margin-left: 400px;
                margin-top: 70px;
                width:40%;
                height:80%;
                
                
            }
            
            .form_caption
            {
                
                width:90%;
                height:10%;
                border: 1px solid black;
                background-color:#333333;
                font-family: sans-serif;
                font-size: 20px;
                font-weight: bold;
                text-align: center;
                line-height: 40px;
                color:#ccffcc;
                
            }
            
            .username
            {
                
                width:90%;
                height:10%;
                background-color:#333333;
                font-family: sans-serif;
                font-size: 15 px;
                font-weight: bold;
                text-align: center;
                line-height: 40px;
                color:#ccffcc;
            }
            
           .warning
            {
            	height:70%;
                width:40%;
                float:left;
                margin-left:250px;
                margin-top:40px;
                font-family:sans-serif;
                font-weight: bold;
                font-size: 15px;
                color: blue;
                
            
            }
            
            
            .welcome_note
            {
            	height:20%;
                width:40%;
                margin-left:400px;
                line-height:70px;
                text-align:center;
                font-family:sans-serif;
                font-weight: bold;
                font-size: 15px;
               
                
                
            
            }
            a:hover
            {
            	cursor:pointer;
            
            }

            .logout
            {
            
            	height:60%;
                width:10%;
                float:right;
                margin-left: 20px;
                margin-top: 10px;
                padding-left: 25px;
                padding-top:25px;
                font-family:sans-serif;
                font-weight: bold;
                font-size: 15px;
                color:#0000ff;  
            
            }
</style>

</head>
<body>
	 <div class ="header">
	      
            <div class="skimmdit_logo">Skimmdit</div>
            <div class="warning"><a class="change_cursor" onclick="load()"> Click here to go to Skimmdit Home Page </a></div>
            
            <%
            
               
                name = (String)session.getAttribute("username");
                	   
            
            
            %>
            
             
            <div class="logout"><a onclick="logout()">logout</a></div>
                   
          </div>  
        
        <div class="login_container">
            <% 
            	if(request.getAttribute("success")!=null)
            	{
            		%>
            			<div class="welcome_note">Link Submitted Successfully! <%= name %> ! </div>
            		<% 
            	}
            		else if(request.getAttribute("failure")!=null)
            		{
            			%>
            				<div class="welcome_note">Link not submitted successfully! <%= name %> ! </div>
            			<% 
            		}
            		else
            		{
            			
            			%>
        				<div class="welcome_note">Welcome to skimmdit! <%= name %> ! </div>
        				<% 
            			
            		}
            
            %>
            
            
            
            <div class="login_form">
                 
                <div class="form_caption"> Submit a new link</div>
                
                <form action="link_handler" method="post">
                    
                    <div class="username">
                    <input type="hidden" id="newuser" name="newuser" value=<%=name %> />
                        <label> Link name:</label>&nbsp; <input type="text" id="username" name="linkname" placeholder="enter the name"/>
                    </div>
                    
                    <div class="username">
                        <label> URL:</label> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="text" id="passcode" name="url" placeholder="enter the URL"/>
                    </div>
					
				  <div class="username">
                       &nbsp; <input type="submit"></input>
                    </div>
                </form>
                 
                </div>
        </div>
</body>
</html>