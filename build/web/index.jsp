<%-- 
    Document   : index
    Created on : Feb 19, 2015, 7:05:23 PM
    Author     : Nick
--%>

<%@page import="edu.pitt.utilities.ErrorLogger"%>
<%@page import="edu.pitt.bank.Security"%>
<%@page import="edu.pitt.bank.Customer"%>
<%@page import="edu.pitt.utilities.DbUtilities"%>
<%@page import="edu.pitt.utilities.MySqlUtilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bank Login</title>
        <link href='http://fonts.googleapis.com/css?family=Lobster&effect=fire-animation' rel='stylesheet' type='text/css'>

    </head>
    
    
    <style>
        body{
            background-color: #BAE6FF;
        }
        header{
            text-align:center;
            margin-top: 5%;
            font-size: 20px;
        }
        #login{
            text-align: center;
            margin-top: 20%;
        }    
        
        
    </style>
    
    
    <body>
        
                        <header> 
                            <div class = "font-effect-fire-animation">
				<h1>NSC18'S SUPER AWESOME BANK LOG IN GO TEAM YEAH!</h1>
			</div>
			</header>        
        
        
        <div id="login">
            <form id="frmLogin" name="frmLogin" action="index.jsp" method ="post">
        
                LOGIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="txtLogin" name="txtLogin" value=""/><br/>
                PASSWORD:<input type="password" id="txtPassword" name="txtPassword" value=""/><br/>
                <p><input type ="submit" name ="btnSubmit" id="btnSubmit" value ="Login" /></p><br/>

                <br/>
            </form>
        </div>
        

        <!-- This section checks to ensure that the user entered values and that the spaces are not null--!>
        <%
            
            // Log in area that checks to ensure that the user did enter credentials
            String txtLogin, txtPassword;
            
            txtLogin = request.getParameter("txtLogin");
            txtPassword = request.getParameter("txtPassword");
            if(txtLogin !=null && txtPassword!=null){
                if(!txtLogin.equals("") && !txtPassword.equals("")){
                    
                    try{
                    
                    if(Integer.parseInt(txtPassword) >= 0){
                        Security s = new Security();
                        Customer cust = s.validateLogin(txtLogin, Integer.parseInt(txtPassword));
                        //out.print(cust.getFirstName());
                        
                        if(cust != null){
                        session.setAttribute("authenticatedUser",cust);
                        response.sendRedirect("accountdetailsui.jsp");
                        }
                        else{
                            out.print("You must provide correct credentials to log in, password not numeric");
                             session.setAttribute("authenticatedUser",null);
                        }

                    }else{
                        out.print("You must provide correct credentials to log in, password not numeric");
                    }
                    }catch(NumberFormatException e2) {
                        e2.printStackTrace();
			ErrorLogger.log("Invalid");	 			// use this for all error handling so it logs
			ErrorLogger.log(e2.getMessage());		// use this for all error handling so it logs, remember to also log the query along with the errors
                        out.print("You must provide correct credentials to log in, password not numeric");
                    }
                    
                }else{
                        out.print("You must provide correct credentials to log in");
                    }
            }
        %>    
        
    </body>
</html>
