using System;
using System.Security.Principal;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WindowsIdentity user = (WindowsIdentity)User.Identity;
        lblUser.Text = user.Name;

        if (User.IsInRole(@"DOMAIN\HR-Admins"))
        {
            adminPanel.Visible = true;
        }
        else if (User.IsInRole(@"DOMAIN\HR-Managers"))
        {
            managerPanel.Visible = true;
        }
        else if (User.IsInRole(@"DOMAIN\HR-Employees"))
        {
            employeePanel.Visible = true;
        }
        else
        {
            Response.Write("❌ Access Denied");
        }
    }
}
