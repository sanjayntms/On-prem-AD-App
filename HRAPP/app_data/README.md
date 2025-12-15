1. Confirm the application pool name
In IIS Manager:

Sites → select your site → Basic Settings → note the “Application pool” name.

Assume the real name is, for example, HRApp or DefaultAppPool (not HRAppPool).​

2. Grant permissions with the correct identity
From elevated CMD in C:\inetpub\HRApp:
icacls App_Data /grant "IIS AppPool\DefaultAppPool":(OI)(CI)M
