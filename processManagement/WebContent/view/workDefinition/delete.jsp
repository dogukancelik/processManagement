<%@ include file="/view/shared/secure.jsp" %>

<%@ include file="/view/shared/layout_header.jsp" %>

<%@ page import="model.WorkDefinitionModel ,DAL.WORKDEFINITION"  %>

<%
String pathInfo = request.getPathInfo();
String[] pathParts = pathInfo.split("/");
String ID = pathParts[pathParts.length-1];

WORKDEFINITION  wrk=new WORKDEFINITION();
WorkDefinitionModel wdm = wrk.GetDefinitionList(WorkDefinitionModel.GetWorkDefinitionId, ID).get(0);
%>

<div class="content">
	<div class="contentItem" style="width:800px">
		<div class="head"><i class="fa fa-th"></i> Work Definition Delete</div>
		<h2>Do you want to delete this work definition ?</h2>
		<div>ID: <b><%=wdm.getWorkDefinitionId() %></b></div>
		<div>Definition Name: <b><%=wdm.getWorkDefinitionName()%></b></div>
		<div>Description: <b><%=wdm.getWorkDefinitionDesciription() %></b></div>
		
		<form action="dataBase" method="post">
		<div style="height:75px; line-height:75px">
			<a href="workDefinition/index" class="a1"><i class="fa fa-arrow-circle-left"></i>Go Back</a>
			<input type="hidden" name="actions" value="workDefinition,delete">
			<input type="hidden" name=<%=wdm.GetWorkDefinitionId %> value=<%=wdm.getWorkDefinitionId() %>>
			<input type="submit" value="Delete" class="button1">
		</div>
		</form>
	</div>
</div>

<%@ include file="/view/shared/layout_footer.jsp" %>