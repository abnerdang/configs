# Configure postfix as relay for macOS Sierra
*Feb. 5, 2020: Not enough configs for working with office365.*
**source: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet** 

-   Source: http://www.developerfiles.com/how-to-send-emails-from-localhost-mac-os-x-el-capitan/
-   Source: http://budiirawan.com/install-mail-server-mac-osx/
-   Source: https://apple.stackexchange.com/questions/32228/whats-the-correctly-way-to-make-postfix-run-permanently-on-lion-not-server

## 1.  Edit postfix configuration file

1.  `sudo vi /etc/postfix/main.cf`
2.  Ensure that the following values are set:
    ```
    mail_owner = _postfix
    setgid_group = _postdrop
    ```
3.  Add the following lines at the end of the file:
    ```
    # Postfix as relay
    #
    #Gmail SMTP
    relayhost=smtp.gmail.com:587
    #Hotmail SMTP
    #relayhost=smtp.live.com:587
    #Yahoo SMTP
    #relayhost=smtp.mail.yahoo.com:465
    # Enable SASL authentication in the Postfix SMTP client.
    smtp_sasl_auth_enable=yes
    smtp_sasl_password_maps=hash:/etc/postfix/sasl_passwd
    smtp_sasl_security_options=noanonymous
    smtp_sasl_mechanism_filter=plain
    # Enable Transport Layer Security (TLS), i.e. SSL.
    smtp_use_tls=yes
    smtp_tls_security_level=encrypt
    tls_random_source=dev:/dev/urandom
    ```

## 2.  Create sasl_passwd file

1.  `sudo sh -c 'echo "\nsmtp.gmail.com:587 your_email@gmail.com:your_password" >> /etc/postfix/sasl_passwd'`
    Replace your_email@gmail.com and your_password with actual values.
2.  `sudo postmap /etc/postfix/sasl_passwd`

## 3.  Autorun postfix on boot and restart postfix

1.  Copy the postfix master plist out of System folder.
    ```
    sudo cp /System/Library/LaunchDaemons/com.apple.postfix.master.plist /Library/LaunchDaemons/org.postfix.custom.plist
    ```
2.  `sudo vi /Library/LaunchDaemons/org.postfix.custom.plist`
3.  Change the label value from `com.apple.postfix.master` to `org.postfix.custom`
    Remove these lines to prevent exiting after 60s
    ```
      <string>-e</string>
      <string>60</string>
    ```
    Add these lines before `</dict>`
    ```
      <key>KeepAlive</key>
      <true/>
    ```
6.  Relaunch the daemon.
    ```
    sudo launchctl unload /Library/LaunchDaemons/org.postfix.custom.plist
    sudo launchctl load /Library/LaunchDaemons/org.postfix.custom.plist
    ```
7.  Check that daemon has started.
    ```
    sudo launchctl list | grep org.postfix
    ```

## 4.  Turn on less secure apps for gmail

In Gmail we must switch on the option "[Access for less secure apps](https://www.google.com/settings/security/lesssecureapps)", otherwise we will get the error: 
`SASL authentication failed`

## 5.  Test

1.  `echo "Test sending email from Postfix" | mail -s "Test Postfix" youremail@domain.com`
2.  Check mail queue and possible delivery errors with `mailq`.
3.  Check mail log with `tail -f /var/log/mail.log`.
