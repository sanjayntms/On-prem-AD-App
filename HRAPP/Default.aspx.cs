using System;
using System.IO;
using System.Web;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Example: show current Windows user
        if (!IsPostBack)
        {
            lblUser.Text = Context.User != null ? Context.User.Identity.Name : "Unknown";

            // Simple demo logic: show Employee panel for everyone
            adminPanel.Visible = false;
            managerPanel.Visible = false;
            employeePanel.Visible = true;
        }
    }

    protected void btnQuickApplyLeave_Click(object sender, EventArgs e)
    {
        try
        {
            string userName = lblUser.Text;
            string leaveDate = DateTime.Now.ToString("yyyy-MM-dd");
            string timeStamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            string line = string.Format(
                "{0} | User: {1} | Leave Date: {2} | Type: QuickApply",
                timeStamp,
                userName,
                leaveDate
            );

            // Write to App_Data/LeaveRequests.txt
            string filePath = Server.MapPath("~/App_Data/LeaveRequests.txt");

            // Ensure directory exists
            string dir = Path.GetDirectoryName(filePath);
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }

            File.AppendAllText(filePath, line + Environment.NewLine);

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "leaveSaved",
                "alert('Leave request saved successfully.');",
                true
            );
        }
        catch
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "leaveError",
                "alert('Unable to save leave request. Please contact IT.');",
                true
            );
        }
    }
}
