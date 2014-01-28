
#Signing up/in

Sign up is possible via Devise or Gmail(omniauth-google-oauth2)

Here are the paths, you may choose which one to use:

+ Email sign up:     <new_user_registration_path>
+ Email sign in:     <new_user_session_path>
+ Gmail:     <user_omniauth_authorize_path(:google_oauth2)>

#Making lunchgroups

Firstly, you need to make yourself in admin via the Rails Console or the seedfile.
Then your login will display the admin functionality.
You should go about it in this order:

1. Create a lunch (e.g. Thai Food).
2. Invite people to RSVP to the lunch. Last minute adjustments of participants you can also do manually.
3. Make groups. If needed you can edit them manually afterwards.
4. Email attendees their group.
