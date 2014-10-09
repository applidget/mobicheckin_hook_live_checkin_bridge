mobicheckin_hook_live_checkin_bridge
====================================

3 env var must be setted in your env :  

- MOBICHECKIN_AUTH_TOKEN => to be authenticated on mobicheckin  
- PORT => to run application on this port  
- MOBICHECKIN_HOST => the url of mobicheckin  

  
Now you can start the application by running 'foreman start'  

Then set the new chenk ins API webHook on a mobicheckin event :  

url template : ":mobicheckin_hook_live_checkin_bridge_url/events/:event_id/guest_categories/:guest_category_id/guests/handle_hook"  
where :  
- :mobicheckin_hook_live_checkin_bridge_url = the url of your app  
- :event_id = the id of the target event which will store checked in guests  
- :guest_category_id = the default guest_category_id of your target event
