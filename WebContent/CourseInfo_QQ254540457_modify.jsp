<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%@ page import="com.shuangyulin.domain.CourseInfo_QQ254540457" %>
<%@ page import="com.shuangyulin.domain.Teacher_QQ287307421" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //��ȡ���е�courseTeacher��Ϣ
    List<Teacher_QQ287307421> teacher_QQ287307421List = (List<Teacher_QQ287307421>)request.getAttribute("teacher_QQ287307421List");
    CourseInfo_QQ254540457 courseInfo_QQ254540457 = (CourseInfo_QQ254540457)request.getAttribute("courseInfo_QQ254540457");

    String username=(String)session.getAttribute("username");
    if(username==null){
        response.getWriter().println("<script>top.location.href='" + basePath + "login/login_view.action';</script>");
    }
%>
<HTML><HEAD><TITLE>�޸Ŀγ���Ϣ</TITLE>
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
    var courseNumber = document.getElementById("courseInfo_QQ254540457.courseNumber").value;
    if(courseNumber=="") {
        alert('������γ̱��!');
        return false;
    }
    var courseName = document.getElementById("courseInfo_QQ254540457.courseName").value;
    if(courseName=="") {
        alert('������γ�����!');
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
    <TD align="left" vAlign=top ><s:form action="CourseInfo_QQ254540457/CourseInfo_QQ254540457_ModifyCourseInfo_QQ254540457.action" method="post" onsubmit="return checkForm();" enctype="multipart/form-data" name="form1">
<table width='100%' cellspacing='1' cellpadding='3' class="tablewidth">
  <tr>
    <td width=30%>�γ̱��:</td>
    <td width=70%><input id="courseInfo_QQ254540457.courseNumber" name="courseInfo_QQ254540457.courseNumber" type="text" value="<%=courseInfo_QQ254540457.getCourseNumber() %>" readOnly /></td>
  </tr>

  <tr>
    <td width=30%>�γ�����:</td>
    <td width=70%><input id="courseInfo_QQ254540457.courseName" name="courseInfo_QQ254540457.courseName" type="text" size="20" value='<%=courseInfo_QQ254540457.getCourseName() %>'/></td>
  </tr>

  <tr>
    <td width=30%>�Ͽ���ʦ:</td>
    <td width=70%>
      <select name="courseInfo_QQ254540457.courseTeacher.teacherNumber">
      <%
        for(Teacher_QQ287307421 teacher_QQ287307421:teacher_QQ287307421List) {
          String selected = "";
          if(teacher_QQ287307421.getTeacherNumber().equals(courseInfo_QQ254540457.getCourseTeacher().getTeacherNumber()))
            selected = "selected";
      %>
          <option value='<%=teacher_QQ287307421.getTeacherNumber() %>' <%=selected %>><%=teacher_QQ287307421.getTeacherName() %></option>
      <%
        }
      %>
    </td>
  </tr>

  <tr>
    <td width=30%>�Ͽ�ʱ��:</td>
    <td width=70%><input id="courseInfo_QQ254540457.courseTime" name="courseInfo_QQ254540457.courseTime" type="text" size="40" value='<%=courseInfo_QQ254540457.getCourseTime() %>'/></td>
  </tr>

  <tr>
    <td width=30%>�Ͽεص�:</td>
    <td width=70%><input id="courseInfo_QQ254540457.coursePlace" name="courseInfo_QQ254540457.coursePlace" type="text" size="40" value='<%=courseInfo_QQ254540457.getCoursePlace() %>'/></td>
  </tr>

  <tr>
    <td width=30%>�γ�ѧ��:</td>
    <td width=70%><input id="courseInfo_QQ254540457.courseScore" name="courseInfo_QQ254540457.courseScore" type="text" size="8" value='<%=courseInfo_QQ254540457.getCourseScore() %>'/></td>
  </tr>

  <tr>
    <td width=30%>������Ϣ:</td>
    <td width=70%><input id="courseInfo_QQ254540457.courseMemo" name="courseInfo_QQ254540457.courseMemo" type="text" size="100" value='<%=courseInfo_QQ254540457.getCourseMemo() %>'/></td>
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