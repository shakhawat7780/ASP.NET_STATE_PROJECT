<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaticData.aspx.cs" Inherits="MyStaticFormData.StaticData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td>
                        <asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                            <asp:ListItem Text="male" Value="1"></asp:ListItem>
                            <asp:ListItem Text="female" Value="2"></asp:ListItem>
                            <asp:ListItem Text="others" Value="3"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:DropDownList ID="ddldepartment" runat="server">
                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Accounts" Value="1"></asp:ListItem>
                            <asp:ListItem Text="IT" Value="2"></asp:ListItem>
                            <asp:ListItem Text="HR" Value="3"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btninsert" runat="server" Text="Insert" OnClick="btninsert_Click" /></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="gvusers" runat="server" OnRowCommand="gvusers_RowCommand" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="User Id">
                                    <ItemTemplate>
                                        <%#Eval("id") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="User Name">
                                    <ItemTemplate>
                                        <%#Eval("name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="User Age">
                                    <ItemTemplate>
                                        <%#Eval("age") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="User Gender">
                                    <ItemTemplate>
                                        <%#Eval("gender").ToString()=="1" ? "Male" :Eval("gender").ToString()=="2" ? "Female" : "Others" %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="User Department">
                                    <ItemTemplate>
                                        <%#Eval("department").ToString()=="1" ? "Accounts" :Eval("department").ToString()=="2" ? "IT" : "HR"%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="A" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="B" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
