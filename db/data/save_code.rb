<% @group = group %>
<td>
  <!-- #this needs refactoring -->
  <!-- #end -->
</td>
<%= form_tag change_groups_lunch_path(@group), method: :put do %>
<% group.users.each do |user|%>
<td>  <%=user.name%>

  <%= check_box_tag "group[users][]", user.id %>
  <%= label_tag "group[users][]", ""%>
  <%end%>
</td>
<%end%>
<%= submit_tag 'Add to Group#{@group.id}', class: 'button'%>
