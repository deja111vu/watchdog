## A simple Watchdog timer 
for tracking the normal operation of a PC.
It is useful for receiving notifications if the PC freezes or shuts down.

Script Installation

1. Download all files to your computer.

2. Create a new workflow in n8n. In the top right corner, click Import from file and select Watchdog_workflow.json.

3. Double-click the Setup node and fill in the fields:
delay - You need to specify the number of minutes for the delay in checking for pings from the PC. This should be the ping frequency time + 3 minutes (The ping is sent every 10 minutes by default, so 13 is specified in the field).
Bot_token - Enter the Telegram bot token that will send you a message if the PC goes offline.
Telegram_Chat_ID - Enter the ID of the chat with this bot.
Error_message - Has a pre-set error message indicating the name of the computer that stopped sending pings. You can change it to your own.

4. Run the trigger Click for setup and test to configure the timer's starting timestamp and check the availability of the Telegram bot.

5. Double-click the Webhook node, go to the Production URL tab, and copy the webhook address.

6. Activate the workflow.

7. On your PC, right-click on send_ping.vbs to open the context menu and select Edit. In the field for step 2 - strURL = "<SET_YOUR_WEBHOOK>", replace <SET_YOUR_WEBHOOK> with the webhook address you previously copied from n8n. Save the file.

8. Run Autostart_setup.bat to install the task in the Task Scheduler.
Settings: Pings are sent every 10 minutes by default.
To change the ping sending period, you must change the number in the /mo 10 key of the schtasks task installation command in step 8, and also adjust the settings of the Setup node in n8n.

9. If you need to stop the watchdog timer, run Autostart_stop.bat to remove the task from the Task Scheduler.