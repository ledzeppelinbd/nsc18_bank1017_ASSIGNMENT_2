<%-- 
    Document   : transactionui
    Created on : Mar 10, 2015, 1:20:53 PM
    Author     : Nick
--%>

<%@page import="edu.pitt.bank.Transaction"%>
<%@page import="edu.pitt.bank.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction</title>


        <style>
            #transactionTable tr td{
                text-align: center;
            }

        </style>
    </head>



    <body>

        <%
            if (session.getAttribute("authenticatedUser") != null&& session.getAttribute("selectedAccount") != null) {
        %>


        <table id = "transactionsTable" border ="1" cellspacing = "0" cellpadding = "5">
            <tr>
                <th>Transaction ID</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>

            <%
                Account selectedAccount = new Account(session.getAttribute("selectedAccount").toString());
                //out.print(selectedAccount.getBalance());
                for(Transaction t : selectedAccount.getTransactionList()){
                    out.print("<tr>");
                       
                        out.print("<td>"+t.getTransactionID());
                        out.print("</td>");

                        out.print("<td>"+t.getType());
                        out.print("</td>");

                        out.print("<td>"+t.getAmount());
                        out.print("</td>");

                        out.print("<td>"+t.getTransactionDate());
                        out.print("</td>");
                    
                    out.print("</tr>");
                }
            %>




            <tr>
                <td></td>
                <td></td>
                <td align ="right"></td>
                <td></td>                
            </tr>
        </table>

        <%            } else {
                /**
                 * I know i was supposed to redirect them back to index.jsp.... but this
                 * is so much more fun!
                 */
                //out.print("stop hacking....");
                response.sendRedirect("index.jsp");
                //response.sendRedirect("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
            }
        %>  
    </body>
</html>
