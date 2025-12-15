<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>NTMS HR Portal</title>

    <style>
        :root {
            --bg: #0f172a;
            --bg-alt: #020617;
            --accent: #38bdf8;
            --accent-soft: rgba(56, 189, 248, 0.1);
            --accent-2: #22c55e;
            --accent-3: #f97316;
            --text: #e5e7eb;
            --text-muted: #9ca3af;
            --card-bg: #111827;
            --border-soft: rgba(148, 163, 184, 0.25);
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: "Segoe UI", -apple-system, BlinkMacSystemFont, system-ui, sans-serif;
            background: radial-gradient(circle at top left, #1e293b, #020617 55%);
            color: var(--text);
        }

        a {
            color: inherit;
        }

        .app-shell {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            background: linear-gradient(120deg, var(--bg-alt), #0b1120);
            border-bottom: 1px solid rgba(148, 163, 184, 0.4);
            box-shadow: 0 16px 40px rgba(15, 23, 42, 0.8);
            position: sticky;
            top: 0;
            z-index: 20;
        }

        .header-inner {
            max-width: 1100px;
            margin: 0 auto;
            padding: 18px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .logo-pill {
            width: 40px;
            height: 40px;
            border-radius: 14px;
            background: radial-gradient(circle at 30% 0, #e5e7eb, #38bdf8 55%, #1e40af 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 30px rgba(56, 189, 248, 0.55);
            font-size: 20px;
        }

        .header-title h1 {
            margin: 0;
            font-size: 22px;
            letter-spacing: 0.03em;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .portal-chip {
            padding: 2px 10px;
            border-radius: 999px;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            background: rgba(15, 118, 110, 0.18);
            border: 1px solid rgba(45, 212, 191, 0.5);
            color: #a5f3fc;
        }

        .user-meta {
            margin-top: 4px;
            font-size: 13px;
            color: var(--text-muted);
        }

        .user-meta b {
            color: #f9fafb;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .session-pill {
            font-size: 11px;
            padding: 4px 10px;
            border-radius: 999px;
            background: rgba(15, 23, 42, 0.7);
            border: 1px solid rgba(148, 163, 184, 0.4);
            color: var(--text-muted);
        }

        .switch-user {
            background: linear-gradient(135deg, #ef4444, #b91c1c);
            color: white;
            padding: 8px 16px;
            border-radius: 999px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 10px 25px rgba(248, 113, 113, 0.45);
            border: 1px solid rgba(248, 250, 252, 0.06);
            transition: transform 0.12s ease, box-shadow 0.12s ease, opacity 0.12s ease;
        }

        .switch-user span.icon {
            font-size: 14px;
        }

        .switch-user:hover {
            transform: translateY(-1px);
            box-shadow: 0 16px 40px rgba(248, 113, 113, 0.65);
            opacity: 0.94;
        }

        .main {
            flex: 1;
        }

        .container {
            max-width: 1100px;
            margin: 26px auto 32px auto;
            padding: 0 24px 32px;
            display: grid;
            grid-template-columns: minmax(0, 2fr) minmax(260px, 1fr);
            gap: 20px;
        }

        @media (max-width: 900px) {
            .header-inner {
                flex-direction: column;
                align-items: flex-start;
            }
            .container {
                grid-template-columns: minmax(0, 1fr);
            }
            .header-right {
                align-self: stretch;
                justify-content: space-between;
            }
        }

        .note {
            background: radial-gradient(circle at top left, rgba(56, 189, 248, 0.16), rgba(15, 23, 42, 0.95));
            border-radius: 16px;
            padding: 16px 18px;
            border: 1px solid rgba(56, 189, 248, 0.4);
            font-size: 13px;
            color: var(--text-muted);
            box-shadow: 0 14px 35px rgba(8, 47, 73, 0.7);
            position: relative;
            overflow: hidden;
        }

        .note::before {
            content: "";
            position: absolute;
            inset: 0;
            background: radial-gradient(circle at 120% 0, rgba(56, 189, 248, 0.18), transparent 55%);
            opacity: 0.9;
            pointer-events: none;
        }

        .note-inner {
            position: relative;
            z-index: 1;
        }

        .note-title {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.12em;
            color: #bae6fd;
            margin-bottom: 4px;
        }

        .note-title span.icon {
            font-size: 16px;
        }

        .note b {
            color: #e5e7eb;
        }

        .note p {
            margin: 0;
            line-height: 1.5;
        }

        .note-footer {
            margin-top: 8px;
            font-size: 12px;
            opacity: 0.9;
        }

        .cards-layout {
            margin-top: 18px;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .card {
            background: radial-gradient(circle at top left, rgba(148, 163, 184, 0.12), var(--card-bg));
            border-radius: 14px;
            padding: 16px 16px 14px;
            border: 1px solid var(--border-soft);
            box-shadow: 0 18px 40px rgba(15, 23, 42, 0.85);
            position: relative;
            overflow: hidden;
        }

        .card::before {
            content: "";
            position: absolute;
            inset: 0;
            opacity: 0.5;
            background: radial-gradient(circle at 120% 0, rgba(56, 189, 248, 0.22), transparent 55%);
            pointer-events: none;
        }

        .card-inner {
            position: relative;
            z-index: 1;
        }

        .card-header {
            display: flex;
            align-items: baseline;
            justify-content: space-between;
            gap: 10px;
        }

        .card h2 {
            margin: 0;
            font-size: 17px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .card h2 span.role-pill {
            font-size: 11px;
            padding: 3px 10px;
            border-radius: 999px;
            text-transform: uppercase;
            letter-spacing: 0.12em;
            border: 1px solid rgba(148, 163, 184, 0.6);
            color: var(--text-muted);
        }

        .card-meta {
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.14em;
            color: var(--text-muted);
        }

        .card ul {
            margin: 10px 0 6px;
            padding-left: 18px;
            font-size: 13px;
            color: var(--text-muted);
        }

        .card ul li {
            margin-bottom: 4px;
        }

        .card-badge-strip {
            position: absolute;
            inset-inline-start: 0;
            top: 0;
            bottom: 0;
            width: 3px;
            opacity: 0.9;
        }

        .admin .card-badge-strip {
            background: linear-gradient(to bottom, #f97316, #dc2626);
        }

        .manager .card-badge-strip {
            background: linear-gradient(to bottom, #38bdf8, #2563eb);
        }

        .employee .card-badge-strip {
            background: linear-gradient(to bottom, #22c55e, #16a34a);
        }

        .role-dot {
            width: 8px;
            height: 8px;
            border-radius: 999px;
        }

        .admin .role-dot {
            background: #fb923c;
            box-shadow: 0 0 0 4px rgba(248, 113, 113, 0.25);
        }

        .manager .role-dot {
            background: #38bdf8;
            box-shadow: 0 0 0 4px rgba(56, 189, 248, 0.25);
        }

        .employee .role-dot {
            background: #22c55e;
            box-shadow: 0 0 0 4px rgba(34, 197, 94, 0.25);
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 9px 16px;
            background: linear-gradient(135deg, #22c55e, #16a34a);
            color: white;
            text-decoration: none;
            border-radius: 999px;
            margin-top: 8px;
            font-size: 13px;
            font-weight: 500;
            border: 1px solid rgba(34, 197, 94, 0.5);
            box-shadow: 0 12px 30px rgba(22, 163, 74, 0.55);
            transition: transform 0.12s ease, box-shadow 0.12s ease, opacity 0.12s ease;
        }

        .btn span.icon {
            margin-right: 6px;
            font-size: 14px;
        }

        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 18px 40px rgba(21, 128, 61, 0.85);
            opacity: 0.96;
        }

        .side-panel {
            background: linear-gradient(160deg, rgba(15, 23, 42, 0.98), #020617);
            border-radius: 18px;
            border: 1px solid rgba(148, 163, 184, 0.35);
            padding: 16px 18px;
            box-shadow: 0 20px 50px rgba(15, 23, 42, 0.95);
        }

        .side-panel-title {
            font-size: 13px;
            letter-spacing: 0.14em;
            text-transform: uppercase;
            color: var(--text-muted);
            margin-bottom: 6px;
        }

        .side-panel h3 {
            margin: 0 0 12px;
            font-size: 16px;
        }

        .side-panel p {
            margin: 0;
            font-size: 13px;
            color: var(--text-muted);
            line-height: 1.5;
        }

        .side-highlight {
            margin-top: 12px;
            padding: 10px 12px;
            border-radius: 12px;
            background: radial-gradient(circle at top left, rgba(34, 197, 94, 0.18), rgba(15, 23, 42, 0.85));
            border: 1px solid rgba(74, 222, 128, 0.45);
            font-size: 12px;
            color: #bbf7d0;
        }

        .side-highlight span.icon {
            margin-right: 6px;
        }

        .side-list {
            margin-top: 12px;
            padding-left: 16px;
            font-size: 12px;
            color: var(--text-muted);
        }

        .side-list li {
            margin-bottom: 4px;
        }
    </style>
</head>

<body>
<form runat="server">
    <div class="app-shell">

        <header class="header">
            <div class="header-inner">
                <div class="header-left">
                    <div class="logo-pill">
                        🏢
                    </div>
                    <div class="header-title">
                        <div>
                            <h1>NTMS HR Portal
                                <span class="portal-chip">Internal • Secure</span>
                            </h1>
                            <div class="user-meta">
                                Signed in as <b><asp:Label ID="lblUser" runat="server" /></b>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="header-right">
                    <div class="session-pill">
                        Windows Authentication • Domain Session
                    </div>
                    <a class="switch-user" href="Logout.aspx">
                        <span class="icon">⇄</span>
                        Switch User
                    </a>
                </div>
            </div>
        </header>

        <main class="main">
            <div class="container">

                <div>
                    <div class="note">
                        <div class="note-inner">
                            <div class="note-title">
                                <span class="icon">🔐</span>
                                SECURE ACCESS NOTICE
                            </div>
                            <p>
                                This application uses <b>Windows Authentication</b> and your current domain session to sign you in.
                            </p>
                            <div class="note-footer">
                                To sign in as a different user, close all browser windows or launch a new InPrivate/Incognito window.
                            </div>
                        </div>
                    </div>

                    <div class="cards-layout">

                        <asp:Panel ID="adminPanel" runat="server" CssClass="card admin" Visible="false">
                            <div class="card-badge-strip"></div>
                            <div class="card-inner">
                                <div class="card-header">
                                    <h2>
                                        <span class="role-dot"></span>
                                        HR Admin
                                        <span class="role-pill">Full control</span>
                                    </h2>
                                    <div class="card-meta">ADMINISTRATOR</div>
                                </div>
                                <ul>
                                    <li>Manage employee records</li>
                                    <li>Update salary and compensation</li>
                                    <li>Run HR audits and compliance checks</li>
                                </ul>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="managerPanel" runat="server" CssClass="card manager" Visible="false">
                            <div class="card-badge-strip"></div>
                            <div class="card-inner">
                                <div class="card-header">
                                    <h2>
                                        <span class="role-dot"></span>
                                        HR Manager
                                        <span class="role-pill">Team oversight</span>
                                    </h2>
                                    <div class="card-meta">MANAGER</div>
                                </div>
                                <ul>
                                    <li>Approve leave and requests</li>
                                    <li>View and manage team members</li>
                                </ul>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="employeePanel" runat="server" CssClass="card employee" Visible="false">
                            <div class="card-badge-strip"></div>
                            <div class="card-inner">
                                <div class="card-header">
                                    <h2>
                                        <span class="role-dot"></span>
                                        Employee
                                        <span class="role-pill">Self service</span>
                                    </h2>
                                    <div class="card-meta">EMPLOYEE</div>
                                </div>
                                <ul>
                                    <li>View your profile and details</li>
                                    <li>Submit and track leave requests</li>
                                </ul>

                                <a class="btn" href="ApplyLeave.aspx">
                                    <span class="icon">➕</span>
                                    Apply for Leave
                                </a>

                                <br /><br />

                                <asp:Button ID="btnQuickApplyLeave"
                                            runat="server"
                                            CssClass="btn"
                                            Text="Quick Apply (Today)"
                                            OnClick="btnQuickApplyLeave_Click" />
                            </div>
                        </asp:Panel>

                    </div>
                </div>

                <aside class="side-panel">
                    <div class="side-panel-title">Environment overview</div>
                    <h3>NTMS HR – Single Sign-On</h3>
                    <p>
                        Your access level is determined by your <b>domain group membership</b> and mapped automatically to the HR roles above.
                    </p>
                    <div class="side-highlight">
                        <span class="icon">💡</span>
                        Tip: Keep your Windows session locked when away from your desk to protect HR data.
                    </div>
                    <ul class="side-list">
                        <li>Role changes are driven by AD groups.</li>
                        <li>All actions are auditable for compliance.</li>
                        <li>Use corporate network or VPN for best experience.</li>
                    </ul>
                </aside>

            </div>
        </main>

    </div>
</form>
</body>
</html>
