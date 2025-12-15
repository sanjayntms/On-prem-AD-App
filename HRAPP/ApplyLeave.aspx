<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplyLeave.aspx.cs" Inherits="ApplyLeave" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Apply Leave - NTMS HR Portal</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #0f172a;
            color: #e5e7eb;
        }

        .wrapper {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .card {
            background: #111827;
            border-radius: 12px;
            padding: 22px 24px 20px;
            width: 360px;
            box-shadow: 0 20px 40px rgba(15, 23, 42, 0.9);
            border: 1px solid rgba(148, 163, 184, 0.35);
        }

        .card h1 {
            margin: 0 0 4px;
            font-size: 20px;
        }

        .subtitle {
            font-size: 13px;
            color: #9ca3af;
            margin-bottom: 16px;
        }

        .form-row {
            margin-bottom: 10px;
        }

        label {
            display: block;
            font-size: 13px;
            margin-bottom: 3px;
        }

        input[type="date"],
        textarea,
        select {
            width: 100%;
            border-radius: 6px;
            border: 1px solid #4b5563;
            background: #020617;
            color: #e5e7eb;
            padding: 6px 8px;
            font-size: 13px;
        }

        textarea {
            resize: vertical;
            min-height: 60px;
        }

        .button-row {
            margin-top: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-primary {
            padding: 8px 16px;
            border-radius: 999px;
            border: none;
            background: linear-gradient(135deg, #22c55e, #16a34a);
            color: #fff;
            font-size: 13px;
            cursor: pointer;
        }

        .btn-secondary {
            font-size: 12px;
            color: #9ca3af;
            text-decoration: none;
        }

        .status {
            font-size: 12px;
            margin-top: 8px;
            color: #a5f3fc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="card">
                <h1>Apply Leave</h1>
                <div class="subtitle">
                    User: <asp:Label ID="lblUser" runat="server" />
                </div>

                <div class="form-row">
                    <label for="txtFrom">From date</label>
                    <asp:TextBox ID="txtFrom" runat="server" TextMode="Date" />
                </div>

                <div class="form-row">
                    <label for="txtTo">To date</label>
                    <asp:TextBox ID="txtTo" runat="server" TextMode="Date" />
                </div>

                <div class="form-row">
                    <label for="ddlType">Leave type</label>
                    <asp:DropDownList ID="ddlType" runat="server">
                        <asp:ListItem Text="Casual" Value="Casual" />
                        <asp:ListItem Text="Sick" Value="Sick" />
                        <asp:ListItem Text="Earned" Value="Earned" />
                    </asp:DropDownList>
                </div>

                <div class="form-row">
                    <label for="txtReason">Reason</label>
                    <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" />
                </div>

                <div class="button-row">
                    <asp:Button ID="btnSubmit"
                                runat="server"
                                CssClass="btn-primary"
                                Text="Submit Leave"
                                OnClick="btnSubmit_Click" />
                    <a class="btn-secondary" href="Default.aspx">← Back to portal</a>
                </div>

                <asp:Label ID="lblStatus" runat="server" CssClass="status" />
            </div>
        </div>
    </form>
</body>
</html>
