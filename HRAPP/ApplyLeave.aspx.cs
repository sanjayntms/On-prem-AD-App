using System;
using System.IO;
using System.Web;

public partial class ApplyLeave : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblUser.Text = Context.User != null ? Context.User.Identity.Name : "Unknown";

            // Default dates: today
            txtFrom.Text = DateTime.Today.ToString("yyyy-MM-dd");
            txtTo.Text = DateTime.Today.ToString("yyyy-MM-dd");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string userName = lblUser.Text;
            string fromDate = txtFrom.Text;
            string toDate = txtTo.Text;
            string leaveType = ddlType.SelectedValue;
            string reason = txtReason.Text.Replace(Environment.NewLine, " ");

            string timeStamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            string line = string.Format(
                "{0} | User: {1} | From: {2} | To: {3} | Type: {4} | Reason: {5}",
                timeStamp,
                userName,
                fromDate,
                toDate,
                leaveType,
                reason
            );

            string filePath = Server.MapPath("~/App_Data/LeaveRequests.txt");
            string dir = Path.GetDirectoryName(filePath);
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }

            File.AppendAllText(filePath, line + Environment.NewLine);

            lblStatus.Text = "Leave request saved successfully.";
        }
        catch
        {
            lblStatus.Text = "Error: Unable to save leave request.";
        }
    }
}
