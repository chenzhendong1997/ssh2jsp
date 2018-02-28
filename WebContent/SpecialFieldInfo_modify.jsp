<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%@ page import="com.shuangyulin.domain.SpecialFieldInfo" %>
<%@ page import="com.shuangyulin.domain.CollegeInfo" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //��ȡ���е�specialCollegeNumber��Ϣ
    List<CollegeInfo> collegeInfoList = (List<CollegeInfo>)request.getAttribute("collegeInfoList");
    SpecialFieldInfo specialFieldInfo = (SpecialFieldInfo)request.getAttribute("specialFieldInfo");

    String username=(String)session.getAttribute("username");
    if(username==null){
        response.getWriter().println("<script>top.location.href='" + basePath + "login/login_view.action';</script>");
    }
%>
<HTML><HEAD><TITLE>�޸�רҵ��Ϣ</TITLE>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
.label {font-style.:italic; }
.errorLabel {font-style.:italic;  color:red; }
.errorMessage {font-weight:bold; color:red; }
</STYLE>
 <script src="<%=basePath %>calendar.js"></script>
<script language="javascript">
/*��֤����*/
function checkForm() {
    var specialFieldNumber = document.getElementById("specialFieldInfo.specialFieldNumber").value;
    if(specialFieldNumber=="") {
        alert('������רҵ���!');
        return false;
    }
    var specialFieldName = document.getElementById("specialFieldInfo.specialFieldName").value;
    if(specialFieldName=="") {
        alert('������רҵ����!');
        return false;
    }
    return true; 
}
 </script>
</HEAD>
<BODY background="<%=basePath %>images/adminBg.jpg">
<s:fielderror cssStyle="color:red" />
<TABLE align="center" height="100%" cellSpacing=0 cellPadding=0 width="80%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><s:form action="SpecialFieldInfo/SpecialFieldInfo_ModifySpecialFieldInfo.action" method="post" onsubmit="return checkForm();" enctype="multipart/form-data" name="form1">
<table width='100%' cellspacing='1' cellpadding='3' class="tablewidth">
  <tr>
    <td width=30%>רҵ���:</td>
    <td width=70%><input id="specialFieldInfo.specialFieldNumber" name="specialFieldInfo.specialFieldNumber" type="text" value="<%=specialFieldInfo.getSpecialFieldNumber() %>" readOnly /></td>
  </tr>

  <tr>
    <td width=30%>רҵ����:</td>
    <td width=70%><input id="specialFieldInfo.specialFieldName" name="specialFieldInfo.specialFieldName" type="text" size="20" value='<%=specialFieldInfo.getSpecialFieldName() %>'/></td>
  </tr>

  <tr>
    <td width=30%>����ѧԺ:</td>
    <td width=70%>
      <select name="specialFieldInfo.specialCollegeNumber.collegeNumber">
      <%
        for(CollegeInfo collegeInfo:collegeInfoList) {
          String selected = "";
          if(collegeInfo.getCollegeNumber().equals(specialFieldInfo.getSpecialCollegeNumber().getCollegeNumber()))
            selected = "selected";
      %>
          <option value='<%=collegeInfo.getCollegeNumber() %>' <%=selected %>><%=collegeInfo.getCollegeName() %></option>
      <%
        }
      %>
    </td>
  </tr>

  <tr>
    <td width=30%>��������:</td>
    <td width=70%><input type="text" readonly  id="specialFieldInfo.specialBirthDate"  name="specialFieldInfo.specialBirthDate" onclick="setDay(this);" value='<%=specialFieldInfo.getSpecialBirthDate() %>'/></td>
  </tr>

  <tr>
    <td width=30%>��ϵ��:</td>
    <td width=70%><input id="specialFieldInfo.specialMan" name="specialFieldInfo.specialMan" type="text" size="10" value='<%=specialFieldInfo.getSpecialMan() %>'/></td>
  </tr>

  <tr>
    <td width=30%>��ϵ�绰:</td>
    <td width=70%><input id="specialFieldInfo.specialTelephone" name="specialFieldInfo.specialTelephone" type="text" size="20" value='<%=specialFieldInfo.getSpecialTelephone() %>'/></td>
  </tr>

  <tr>
    <td width=30%>������Ϣ:</td>
    <td width=70%><input id="specialFieldInfo.specialMemo" name="specialFieldInfo.specialMemo" type="text" size="100" value='<%=specialFieldInfo.getSpecialMemo() %>'/></td>
  </tr>

  <tr bgcolor='#FFFFFF'>
      <td colspan="4" align="center">
        <input type='submit' name='button' value='����' >
        &nbsp;&nbsp;
        <input type="reset" value='��д' />
      </td>
    </tr>

</table>
</s:form>
   </TD></TR>
  </TBODY>
</TABLE>
</BODY>
</HTML>