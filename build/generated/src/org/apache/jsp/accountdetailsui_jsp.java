package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import edu.pitt.utilities.StringUtilities;
import java.util.ArrayList;
import edu.pitt.bank.Account;
import edu.pitt.bank.Bank;
import javax.swing.JOptionPane;
import java.net.URL;
import java.sql.ResultSet;
import edu.pitt.utilities.MySqlUtilities;
import edu.pitt.utilities.DbUtilities;
import edu.pitt.bank.Customer;

public final class accountdetailsui_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Account Details</title>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("\n");
      out.write("            function  submitOnSelect() {\n");
      out.write("                // alert(\"HI\");\n");
      out.write("                var frmAccountDetails = document.getElementById(\"frmAccountDetails\");\n");
      out.write("                var cboAccountList = document.getElementById(\"cboAccountList\");\n");
      out.write("                if (cboAccountList.value != \"\") {\n");
      out.write("                    frmAccountDetails.submit();\n");
      out.write("\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            background-color: #BAE6FF;\n");
      out.write("            text-align: left;\n");
      out.write("            margin:20%;\n");
      out.write("            font-size: 20px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        ");

            /**
             * This validates that the user has logged in in the index.jsp page.
             */
            if (session.getAttribute("authenticatedUser") != null) {
                Customer authUser = (Customer) session.getAttribute("authenticatedUser");
                Bank b = new Bank();


        
      out.write("\n");
      out.write("\n");
      out.write("        <form id = \"frmAccontDetails\" name=\"frmAccountDetails\" action=\"accountdetailsui.jsp\"method=\"post\">\n");
      out.write("            <select id= \"cboAccountList\" name=\"cboAccountList\" onchange =\"submitOnSelect();\">\n");
      out.write("                <option value =\"\">-SELECT ACCOUNT-</option>\n");
      out.write("                ");
                    /**
                     * This will run through all accounts until it finds the
                     * ones that belong to a particular user and return them in
                     * the drop down box
                     */
           
                    Account selectedAccount = null;
                    String selectedAccountID = "";

                    // ACCOUNTS NOT LOADING CORRECTLY       
                    for (String accountID : b.getAccountListbyOwner(authUser.getCustomerID())){

                                

                        if (request.getParameter("cboAccountList") != "") {
                                    selectedAccountID = request.getParameter("cboAccountList"));;
                                    if(selectedAccount.getAccountID().equals(accountID)){
                                        out.print("<option selected value='" + accountID + "')>" + accountID + "</option>");
                                    }
                        }
                        else {
                            
                        }
                        out.print("<option  value='" + accountID + "')>" + accountID + "</option>");
                            
                    }
                    
                
      out.write(" \n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <input type =\"submit\"  name =\"btnTransactions\" id=\"btnTransactions\" value=\"Show Transactions\">\n");
      out.write("            <p>Deposit:<input id =\"txtDeposit\" type =\"text\" name = \"txtDeposit\"/></p>\n");
      out.write("            <p> Withdraw:<input id =\"txtWithdraw\" type =\"text\" name = \"txtWithdraw\"/></p>\n");
      out.write("            <p><input id = \"btnSubmit\" type =\"submit\" name =\"btnSubmit\" value =\"Submit\"/></p>\n");
      out.write("\n");
      out.write("            \n");
      out.write("        </p>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    ");
            } else {
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
    
      out.write("    \n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
