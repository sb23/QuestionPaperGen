<%@page import="java.sql.*"%>
<%@page import="java.lang.Integer"%>
<%
	
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/qbank","root","incarnation1234@");
	 out.write("<html>");
     out.write("<head/>");
	 out.write("<center><h1>");
	 String subject = request.getParameter("subject");
	 session.setAttribute("subject",subject);
	 out.write(subject);
	 out.write(" Question Paper");
	 out.write("</h1></center>");
	 out.write("<h2><center>Full Marks : ");
	 
	 out.write(request.getParameter("total"));
	 out.write("</center></h2>");
	 out.write("<body>");
	 out.write("<style>body {display:block;border: 2px solid ;position:relative;top: 15%;margin:0 auto; width:70%;padding: 20px;width:80%;}#sub{width:90%} input[type=submit]{display: block;position: relative;margin: 0 auto;width:50%;}span.mark{position:absolute;left:90%;width:5%);</style>");
	Statement stmt = con.createStatement();
	int limit =0,sum=0;
	int avg = Integer.parseInt(request.getParameter("difficulty"));
	int n1 = Integer.parseInt(request.getParameter("five"));
	limit += 5*n1*avg;
	int n2 = Integer.parseInt(request.getParameter("three"));
	limit += 3*n2*avg;
	int n3 =Integer.parseInt(request.getParameter("two"));
	limit += 2*n3*avg;
	int c=1;
	String query = "select * from "+subject+"_mcq where marks = 5 order by rand()";
	ResultSet rs = stmt.executeQuery(query);
    int i=0;
	String full_marks = request.getParameter("total");
    session.setAttribute("total",full_marks);
	out.write("<form method='POST' action='check.jsp'>");
	while(rs.next())
	{
		if(i==n1)
		   break;
	   out.write(Integer.toString(c));
	   out.write(".");
	   c++;
	   out.write(rs.getString("description"));
	   out.write("<span class='mark'>");
	   out.write("mark :");
	   out.write(rs.getString("marks"));
	   out.write("</span>");
	   out.write("<br><br>"); 
	   String val1=rs.getString("description");
	   String val2=rs.getString("optionA");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>"); 
	   val2=rs.getString("optionB");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>");
	   val2=rs.getString("optionC");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>");
	   val2=rs.getString("optionD");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br><br><br>");
	   i++;
	   sum+= 5*Integer.parseInt(rs.getString("difficulty"));
	 
	}

	
	query = "select * from "+subject+"_mcq where marks = 3 order by rand()";
	rs = stmt.executeQuery(query);
	i =0;
	while(rs.next())
	{
	   if(i==n2)
			break;
	   out.write(Integer.toString(c));
	   out.write(".");
	   c++;
	   out.write(rs.getString("description"));
	   out.write("<span class='mark'>");
	   out.write("mark :");
	   out.write(rs.getString("marks"));
	   out.write("</span>");
	   out.write("<br><br>"); 
	   String val1=rs.getString("description");
	   String val2=rs.getString("optionA");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>"); 
	   val2=rs.getString("optionB");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>");
	   val2=rs.getString("optionC");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>");
	   val2=rs.getString("optionD");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br><br><br>");
	   i++;
	   sum+= 3*Integer.parseInt(rs.getString("difficulty"));
	   
	}
	
	int val=0;
	if(n3!=0)
	{
	 int diff = limit - sum;
	 val = diff/(2*n3);
	 if(val>10)
		val = 10;
	}
	query = "select * from "+subject+"_mcq where marks = 2 order by difficulty desc";
	rs = stmt.executeQuery(query);
    i=0;
	while(rs.next())
	{
		 if(i==n3)
           break;
		int temp =Integer.parseInt(rs.getString("difficulty"));
		if(temp>val)
			continue;
	   out.write(Integer.toString(c));
	   out.write(".");
	   c++;
	   out.write(rs.getString("description"));
	   out.write("<span class='mark'>");
	   out.write("mark :");
	   out.write(rs.getString("marks"));
	   out.write("</span>");
	   out.write("<br><br>"); 
	   String val1=rs.getString("description");
	   String val2=rs.getString("optionA");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>"); 
	   val2=rs.getString("optionB");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>");
	   val2=rs.getString("optionC");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br>");
	   val2=rs.getString("optionD");
	   out.write("<input type='radio' name='");
	   out.write(val1);
	   out.write("' value='");
	   out.write(val2);
	   out.write("'/>");
	   out.write(val2);
	   out.write("<br><br><br>");
        i++;			
       			  
	}
	out.write("<input type='submit'/><br>");
	out.write("</form>");
	out.write("<button id=\"printpage\" onclick=\"myFunction()\">Print</button>");
	out.write("<script>function myFunction() {");
	out.write("var printButton = document.getElementById(\"printpage\");");
	out.write("printButton.style.visibility = \'hidden\';");	
	out.write("window.print();");	
	out.write("printButton.style.visibility = \'visible\';");	
	out.write("}</script>");	
	out.write("</body>");
    out.write("</html>");
%>