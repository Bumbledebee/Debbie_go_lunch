<div class="wrapper">
  <% group_num = (@lunch.users.count/5)+1 %>
  <% @users = @lunch.users %>
  <% groupes = @lunch.groups[0...group_num] %>
  <% groupes.each do |group| %>
    <table>
      <thead>
        <tr>
          <th>group.name</th>
          <th>group.id</th>
          <th>lunchgroupleader</th>
          <th>name</th>
          <th>name</th>
          <th>name</th>
          <th>name</th>
          <th>name</th>
          <th>name</th>
        </tr>
    </thead>
    <tbody>
      <tr>
        <td><%= group.name %></td>
        <td><%= group.id %></td>
        <td><%= group.lunchgroupleader%></td>
        <% @group = group %>
        <%= form_tag change_lunch_groups_path(@lunch), method: :put do %>
          <% group.users.each do |user|%>
            <td><%=user.name%>
            <%= check_box_tag "group[users][]", user.id %>
            <%= label_tag "group[users][]", ""%>
          <%end%>
          </td>
          <%= submit_tag "Add to group #{@group.name}", class: 'button'%>
        <%end%>
      </tr>
    </tbody>
  </table>
  <%end%>
</div>
