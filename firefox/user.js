// Firefox user.js - Preferences overrides
// See: https://kb.mozillazine.org/User.js_file

// Startup behavior: 0=blank, 1=home, 2=last session, 3=resume previous
user_pref("browser.startup.page", 1);

// Home page(s) - separate multiple URLs with | (pipe)
// To add a new URL: append |https://example.com at the end of the list
// Home page(s) - separate multiple URLs with | (pipe)
// -- mails --
//   https://mail01.orange.fr/appsuite/#!&app=io.ox/mail&folder=default0/INBOX
//   https://outlook.office.com
//   https://simplelogin.io/
// -- domotique --
//   http://www.machboboss.ovh/index.php
// -- my security parner --
//   https://gitlab.tech.orange/my-security-partner/scam-report/-/boards
//   https://webbotinterface.dev.assistantcyber.com/
//   https://rp.prod.assistantcyber.com/static/ac-monitoring-prod.html
// -- others --
//   https://gitlab.tech.orange/nicolas.bossard/opencode-tp
user_pref("browser.startup.homepage", "https://mail01.orange.fr/appsuite/#!&app=io.ox/mail&folder=default0/INBOX|https://outlook.office.com|https://simplelogin.io/|http://www.machboboss.ovh/index.php|https://gitlab.tech.orange/my-security-partner/scam-report/-/boards|https://webbotinterface.dev.assistantcyber.com/|https://rp.prod.assistantcyber.com/static/ac-monitoring-prod.html|https://gitlab.tech.orange/nicolas.bossard/opencode-tp");

// Open homepage in new tabs instead of replacing current tab
user_pref("browser.startup.homepage_override.mstone", "ignore");
