<%@ page import="java.sql.*" %>
<%@ page import="com.r3sys.db.DbConnection" %>
<%@ page session="true" %>

<h2 align="center">Received Donations</h2>

<table border="1" align="center" cellpadding="8">
<tr>
<th>User Name</th>
<th>Amount</th>
</tr>

<%
int ngoId = (int) session.getAttribute("ngoId");

Connection con = DbConnection.getConnection();
PreparedStatement ps = con.prepareStatement(
 "SELECT u.name, d.amount FROM donation d JOIN user u ON d.user_id=u.user_id WHERE d.ngo_id=?"
);
ps.setInt(1, ngoId);

ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getInt(2) %></td>
</tr>
<%
}
%>

</table>
