<h1><%= link_to "Find on Github", "https://github.com/Bumbledebee/Debbie_go_lunch" %></a></h1>
<li><%= link_to 'Feedback', new_message_path %></li>
<li><%= link_to "Login with Email", new_user_session_path %></li>
<h1><%= link_to "Go Lunch", edit_user_path(current_user)%></a></h1>
<h1><%= link_to "View Groups", lunch_groups_path(Lunch.last)%></a></h1>
<li><%= link_to 'Login with Gmail', user_omniauth_authorize_path(:google_oauth2)%>

