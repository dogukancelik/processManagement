<%@ include file="/view/shared/secure.jsp" %>

<%@ include file="/view/shared/layout_header.jsp" %>

<%@ page import="model.ProcessStepModel, DAL.PROCESSSTEP, Account.Account"  %>

<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">

<div class="content">
	<div class="contentItem" style="width:900px">
		<div class="head"><i class="fa fa-step-forward"></i> Process Step List</div>
		<div style="height:30px; line-height:30px">&nbsp<a class="a1" href="processStep/create">Create New Process Step</a></div>
		<div class="loading">
    		<i class="fa fa-refresh fa-spin"></i>
    			Data Loading...
    			
		</div>
		<br>
		<table id="table_id" style="display:none" class="display">
		    <thead>
		        <tr>
		            <th>ID</th>
		            <th>Process ID</th>
		            <th>User ID</th>
		            <th>Process Date</th>
		            <th></th>
		        </tr>
		    </thead>
		    <tfoot>
		        <tr>
		            <th>ID</th>
		            <th>Process ID</th>
		            <th>User ID</th>
		            <th>Process Date</th>
		            <th></th>
		        </tr>
		    </tfoot>
		    <tbody>
		    <% 
		    PROCESSSTEP ps = new PROCESSSTEP();
		    for(ProcessStepModel st: ps.GetProcessOrderList()){
		    %>
		        <tr align="center">
		            <td><%=st.getProcessStepId() %></td>
		            <td><%=st.getProcessId() %></td>
		            <td><%=st.getUserId()%> </td>
		            <td><%=st.getProcessDate()%></td>
		            <td>
		            <% 
		            	Account ac=new Account(); 
		            
		            	if (ac.IsAuthority("processStep","edit", session.getAttribute("UserId").toString())){ 
		            %>
		            		<a class="a1" href="processStep/edit/<%=st.getProcessStepId() %>">Edit</a>
		            <%	
		            	}
		            	if(ac.IsAuthority("processStep","edit", session.getAttribute("UserId").toString()) && ac.IsAuthority("processStep","delete", session.getAttribute("UserId").toString())){
		            %>
		            		|
		            <%
		            	} 
		            	if (ac.IsAuthority("processStep","delete", session.getAttribute("UserId").toString())){ 
		            %>
		            	<a class="a1" href="processStep/delete/<%=st.getProcessStepId() %>">Delete</a>
		            <%
		            	} 
		            %>
		            	
		            </td>
		        </tr>
		    <% }%>
		    </tbody>
		</table>
	</div>
</div>


<script type="text/javascript" src="js/jqueryDataTable.js"></script>
<script type="text/javascript" src="js/jquery-uiDataTable.js"></script>
<script>
$(document).ready( function () {
	setTimeout(function(){ 
		$("#table_id").show();
	    $(".loading").hide();
	    $('#table_id').DataTable();
	}, 1000);
	
} );
</script>
<%@ include file="/view/shared/layout_footer.jsp" %>