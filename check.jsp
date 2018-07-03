<%@page import="java.sql.*"%>
<%@page import="java.lang.Integer"%>
<%
	int count=0;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/qbank","root","incarnation1234@");
	Statement stmt = con.createStatement();
	String subject = (String)session.getAttribute("subject");
	String total = (String)session.getAttribute("total");
	String query = "select * from "+subject+"_mcq";
	ResultSet rs = stmt.executeQuery(query);
	int score = 0;
	while(rs.next())
	{
		String q = rs.getString("description");
		int marks = Integer.parseInt(rs.getString("marks"));
		String ans =""; 
		ans +=request.getParameter(q);
		if(ans.equals(""))
			continue;
		String res =rs.getString("answer");
		String correct =rs.getString(res);
		//out.println(ans);
		//out.println(correct);
		if(ans.equals(correct))
		{
			score += marks;
			count++;
		}
	}
	out.println(count+" question(s) were correct");
	out.println("<center><h1> Congratulation! Your score is "+score+"/"+total+".</h1></center>");
%>