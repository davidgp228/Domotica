package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ejemploQR_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("<meta name=\"robots\" content=\"noindex,nofollow\"/>\n");
      out.write("<title>Generate QR Code using QRGen and ZXing library</title>\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/themes/master.css\" type=\"text/css\" />\n");
      out.write("<link\n");
      out.write(" href=\"http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css\"\n");
      out.write(" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("\n");
      out.write("<script\n");
      out.write(" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js\"\n");
      out.write(" type=\"text/javascript\"></script>\n");
      out.write("<script\n");
      out.write(" src=\"http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js\"\n");
      out.write(" type=\"text/javascript\"></script>\n");
      out.write("<script\n");
      out.write(" src=\"http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js\"\n");
      out.write(" type=\"text/javascript\"></script> \n");
      out.write("<script src=\"/resources/scripts/mysamplecode.js\" type=\"text/javascript\"></script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write(" $(document).ready(function() {\n");
      out.write("  \n");
      out.write("  $(\"#samplecode\").validate({\n");
      out.write("    rules: {\n");
      out.write("     qrText: \"required\"\n");
      out.write("   }\n");
      out.write("  });\n");
      out.write("  \n");
      out.write(" });       \n");
      out.write("    </script> \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"allContent\">\n");
      out.write("\n");
 
String qrText =  request.getParameter("qrText");
if(qrText == null){
 qrText = "";
}

      out.write("\n");
      out.write("<div id=\"myContent\" style=\"width:50%;\">\n");
      out.write(" <form id=\"samplecode\" name=\"samplecode\" method=\"POST\" action=\"ejemploQR.jsp\">\n");
      out.write("   <fieldset>\n");
      out.write("    <legend><b>&nbsp;&nbsp;&nbsp;QR Code Generator - Request&nbsp;&nbsp;&nbsp;</b></legend>\n");
      out.write("\n");
      out.write("    <p>\n");
      out.write("     <label for=\"qrText\"> Input Text for QR Code </label><br /> \n");
      out.write("     <input id=\"qrText\" type=\"text\" name=\"qrText\" size=\"50\"\n");
      out.write("     value=\"");
      out.print( qrText );
      out.write("\"\n");
      out.write("     />\n");
      out.write("    </p>\n");
      out.write("    <input id=\"generate\" type=\"submit\" value=\"Generate QR Code\" />\n");
      out.write("   </fieldset>\n");
      out.write("   ");

         if (!qrText.trim().equalsIgnoreCase("")) {
            
      out.write("\n");
      out.write("            <fieldset>\n");
      out.write("    <legend><b>&nbsp;&nbsp;&nbsp;QR Code Generator - Response&nbsp;&nbsp;&nbsp;</b></legend>\n");
      out.write("             <img src=\"http://localhost:8080/Domotica/qrservlet?qrtext=");
      out.print( request.getParameter("qrText") );
      out.write("\">\n");
      out.write("   </fieldset>\n");
      out.write("            ");

         }
            
      out.write("\n");
      out.write(" </form>\n");
      out.write("</div> \n");
      out.write(" \n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>");
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
