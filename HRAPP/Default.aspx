<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
    <title>NTMS HR Portal</title>
    <style>
        body { font-family: Segoe UI; background:#f4f6f9; padding:30px }
        .box { background:white; padding:20px; margin:15px 0; border-radius:8px }
        .admin { border-left:6px solid red }
        .manager { border-left:6px solid orange }
        .employee { border-left:6px solid green }
    </style>
</head>
<body>

<h1>🏢 NTMS HR Portal</h1>

<p><b>User:</b> <asp:Label ID="lblUser" runat="server" /></p>

<asp:Panel ID="adminPanel" runat="server" CssClass="box admin" Visible="false">
    <h2>HR Admin</h2>
    <ul>
        <li>Manage Employees</li>
        <li>Update Salary</li>
        <li>HR Audits</li>
    </ul>
</asp:Panel>

<asp:Panel ID="managerPanel" runat="server" CssClass="box manager" Visible="false">
    <h2>HR Manager</h2>
    <ul>
        <li>Approve Leave</li>
        <li>View Team Reports</li>
    </ul>
</asp:Panel>

<asp:Panel ID="employeePanel" runat="server" CssClass="box employee" Visible="false">
    <h2>Employee</h2>
    <ul>
        <li>View Profile</li>
        <li>Apply Leave</li>
    </ul>
</asp:Panel>

</body>
</html>
