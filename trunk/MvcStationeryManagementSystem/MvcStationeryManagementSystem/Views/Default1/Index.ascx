<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MvcStationeryManagementSystem.Models.Account>" %>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.AccountId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.AccountId) %>
                <%= Html.ValidationMessageFor(model => model.AccountId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Username) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Username) %>
                <%= Html.ValidationMessageFor(model => model.Username) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Password) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Password) %>
                <%= Html.ValidationMessageFor(model => model.Password) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Email) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Email) %>
                <%= Html.ValidationMessageFor(model => model.Email) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.RegistrationNumber) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.RegistrationNumber) %>
                <%= Html.ValidationMessageFor(model => model.RegistrationNumber) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>


