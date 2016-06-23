<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%!

  String name ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript">
        
        
                function onload()
                {
                    
                    <%
            
                     String error = (String)request.getAttribute("login");
                           if(error == "false")
                         %>
                              alert("you are not logged in");
                
                         <%
                
                    
            
                    %>
                            
                }
        	function signin()
        	{
        		
        		document.location.href = "myservlet";
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
                width:20%;
                float:left;
                margin-left:150px;
                margin-top:40px;
                font-family:sans-serif;
                font-weight: bold;
                font-size: 15px;
                color:blue;
                
            
            }
            
            .logout
            {
            
            	height:60%;
                width:20%;
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
            
            .logout:hover
            {
            	cursor:pointer;
            }
            
        </style>
    </head>
    <body onload="onload()">
        
        <div class =" header">
            <div class="skimmdit_logo">Skimmdit</div>
             <%
        		name = (String)request.getAttribute("loginfailed");
            if(name=="yes")
            {
            	%>
            	
            		<div class="warning">Try Again!</div>
            	<% 
            	
            }
        
        %>
        
        <div class="logout"><a onclick="load()">Go to Skimmdit Home Page</a></div>    
        <div class="logout"><a onclick="signin()">register with skimmdit</a></div>            
        </div>
        
        <div class="login_container">
            
            <div class="login_form">
                
                <div class="form_caption">Log in to Account </div>
                
                <form action="login" method="post">
                    
                    <div class="username">
                        <label> Username:</label> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="text" id="username" name="username" placeholder="enter the username"/>
                    </div>
                    
                    <div class="username">
                        <label> Password:</label> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="password" id="passcode" name="passcode" value=""/>
                    </div>
					
					
                    <div class="username">
                       &nbsp; <input type="submit"></input>
                    </div>
                </form>
                 
                </div>
        </div>
    </body>
</html>
