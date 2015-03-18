<%-- 
    Document   : accountdetailsui
    Created on : Feb 26, 2015, 7:51:05 PM
    Author     : Nick
--%>


<%@page import="edu.pitt.utilities.StringUtilities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.pitt.bank.Account"%>
<%@page import="edu.pitt.bank.Bank"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="edu.pitt.utilities.MySqlUtilities"%>
<%@page import="edu.pitt.utilities.DbUtilities"%>
<%@page import="edu.pitt.bank.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Details</title>

        <script>

            function  submitOnSelect() {
                var frmAccountDetails = document.getElementById("frmAccountDetails");
                var cboAccountList = document.getElementById("cboAccountList");
                if (cboAccountList.value != "") {
                    frmAccountDetails.submit();

                }
            }


        </script>

    </head>
    <style>
        body{
            background-color: #BAE6FF;
            text-align: left;
            margin:20%;
            font-size: 20px;
        }
    </style>


    <body>
        <%
            /**
             * This validates that the user has logged in in the index.jsp page.
             */
            if (session.getAttribute("authenticatedUser") != null) {
                Customer authUser = (Customer) session.getAttribute("authenticatedUser");
                Bank b = new Bank();

                Account selectedAccount = null;
                String selectedAccountID = request.getParameter("cboAccountList");
                if (selectedAccountID == null) {
                    selectedAccountID = "";
                }
                if (!selectedAccountID.equals("")) {
                    selectedAccount = new Account(selectedAccountID);
                }
        %>

        <form id = "frmAccountDetails" name="frmAccountDetails" action="accountdetailsui.jsp"method="post">
            <select id= "cboAccountList" name="cboAccountList" onchange ="submitOnSelect();">
                <option value ="">-SELECT ACCOUNT-</option>
                <%                    /**
                     * This will run through all accounts until it finds the
                     * ones that belong to a particular user and return them in
                     * the drop down box
                     */

                    // ACCOUNTS NOT LOADING CORRECTLY       
                    for (String accountID : b.getAccountListbyOwner(authUser.getCustomerID())) {
                        if (selectedAccountID.equals(accountID)) {
                            out.print("<option selected value='" + accountID + "')>" + accountID + "</option>");
                        } else {
                            out.print("<option  value='" + accountID + "')>" + accountID + "</option>");
                        }
                    }

                %> 
            </select>




            <%                if (!selectedAccountID.equals("")) {
                    session.setAttribute("selectedAccount", selectedAccountID);
                    out.print("<br /><a href='transactionui.jsp?accountID=" + selectedAccountID + "'>Transactions</a><br />");
                }
            %>
            <p>Deposit:<input id ="txtDeposit" type ="text" name = "txtDeposit"/></p>
            <p> Withdraw:<input id ="txtWithdraw" type ="text" name = "txtWithdraw"/></p>
            <p><input id = "btnSubmit" type ="submit" name ="btnSubmit" value ="Submit"/></p>


        </p>
        <%
            /**
             * This will check that there is an account, that it is created, and
             * that there is a deposit. It runs through every character in
             * deposit and checks that it is numerical then checks to see if it
             * is a large depost. It will then deposit the money.
             */
            if (request.getParameter("btnSubmit") != null) {
                if (!request.getParameter("txtDeposit").toString().equals("")) {

                    String amountTest = request.getParameter("txtDeposit").toString();

                    if (StringUtilities.isNumeric(amountTest)) {

                        Double amount = Double.parseDouble(amountTest);

                        if (amount >= 10000) {
                            out.print("<p>" + "This is a large deposit and will be tracked by the IRS" + "</p>");
                            selectedAccount.deposit(amount);
                            out.print("<p>" + "Balance :  " + selectedAccount.getBalance());

                        } else {
                            Account a = new Account(request.getParameter("cboAccountList"));
                            selectedAccount.deposit(amount);
                            out.print("<p>" + "Balance :  " + selectedAccount.getBalance());
                        }

                    } else {
                        out.print("You have entered an incorrect value");
                    }
                }

                /**
                 * This will check to see if an acount is selected, if there is
                 * something in withdraw, if the items in withdraw are numerical
                 * and then makes sure that there is enough money in the account
                 * to withdraw. and also that the account is active
                 */
                else if (!request.getParameter("txtWithdraw").toString().equals("")) {

                    String amountWithdraw = request.getParameter("txtWithdraw").toString();
                    double x = selectedAccount.getBalance();

                    if (StringUtilities.isNumeric(amountWithdraw)) {
                        double y = Double.parseDouble(amountWithdraw);
                        if (y <= x) {
                            Double amount = Double.parseDouble(amountWithdraw);
                            if (!selectedAccount.getStatus().equalsIgnoreCase("frozen")) {
                                if (!selectedAccount.getStatus().equalsIgnoreCase("closed")) {
                                    selectedAccount.withdraw(amount);
                                    out.print("<p>" + "Balance :  " + selectedAccount.getBalance());
                                } else {
                                    out.print("your account is closed");
                                }
                            } else {
                                out.print(" Let it Snow, Let it Snow, Your account is frozen na na na");
                            }
                        } else {
                            out.print("You cant withdraw that much");
                        }
                    } else {

                        out.print("You have entered an incorrect value");
                    }

                } else {
                    out.print("Please enter a value");
                }

            }
        %>


    </form>




    <%            } else {
            /**
             * I know i was supposed to redirect them back to index.jsp.... but
             * this is so much more fun!
             *
             * CHOOSE YOUR DOOM!
             */
            //out.print("stop hacking....");//boringest
            //response.sendRedirect("index.jsp");// pppfffffftttttt boring.....
            //response.sendRedirect("https://www.youtube.com/watch?v=k6Lb3kFwJRQ");// Burns your eardrums
            response.sendRedirect("https://www.youtube.com/watch?v=dQw4w9WgXcQ");// Never gonna give you up
        }
    %>    
</body>
</html>
