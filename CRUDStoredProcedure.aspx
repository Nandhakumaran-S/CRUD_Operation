<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDStoredProcedure.aspx.cs" Inherits="WebApplication4.CRUDStoredProcedure" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 70%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="5" cellspacing="5" class="auto-style1">
                <tr>
                    <td colspan="2">
            <asp:ValidationSummary ID="VS1" runat="server" ForeColor="Red"/>
                    </td>
                </tr>
                <tr>
                    <td>ID</td>
                    <td>
                        <asp:TextBox ID="IDText" runat="server" Width="232px" ReadOnly="True" AutoCompleteType="Disabled"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>NAME</td>
                    <td>
                        <asp:TextBox ID="NameText" runat="server" Width="232px" AutoCompleteType="Disabled"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RF1" runat="server" ControlToValidate="NameText" ErrorMessage="Please Enter name" Text="*" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>GENDER</td>
                    <td>
                        <asp:RadioButton ID="MaleRB" runat="server" GroupName="GenderSelect" Text="Male" />
                        <asp:RadioButton ID="FemaleRB" runat="server" GroupName="GenderSelect" Text="Female" />
                        <asp:CustomValidator ID="GenderValidate" runat="server" Display="Dynamic" Text="*" ErrorMessage="Please Select Gender" ForeColor="Red" OnServerValidate="GenderValidate_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>CLASS</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Text="Select Class"  Value="-1"></asp:ListItem>
                            <asp:ListItem Text="10" Value="1"></asp:ListItem>
                            <asp:ListItem Text="9" Value="2"></asp:ListItem>
                            <asp:ListItem Text="8" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RF3" runat="server" ControlToValidate="DropDownList1" SetFocusOnError="true" Text="*" ErrorMessage="Please Select Class" InitialValue="-1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="InsertBtn" runat="server" Text="Insert" OnClick="InsertBtn_Click" />
&nbsp;
                        <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
&nbsp;
                        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" OnClick="DeleteBtn_Click" />
&nbsp;
                        <asp:Button ID="ResetBtn" runat="server" Text="Reset" OnClick="ResetBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="IDLabel" runat ="server" Text= '<%# Eval("studentId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="NameLabel" runat="server" Text= '<%# Eval("studentName") %>'></asp:Label>
                                  </ItemTemplate>
                                 </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <asp:Label ID ="GenderLabel" runat="server" Text= '<%# Eval("gender") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Class">
                                    <ItemTemplate>
                                        <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("class") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
