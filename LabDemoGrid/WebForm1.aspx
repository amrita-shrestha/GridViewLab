<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LabDemoGrid.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Id" ShowFooter="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Id") %>' ID="Label1"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Id") %>' ID="Label1"></asp:Label>
                        </ItemTemplate>
                        <%-- now add footer template by ui first select bound option to change in template --%>
                        <FooterTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Insert</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="name" SortExpression="name">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("name") %>' ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("name") %>' ID="Label2"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="NameDDl" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="course" SortExpression="course">
                        <EditItemTemplate>
                             <asp:DropDownList ID="GridDDLCourse" runat="server" Text='<%# Bind("course") %>'>
                                <asp:ListItem>Select Course</asp:ListItem>
                                <asp:ListItem>Pop</asp:ListItem>
                                <asp:ListItem>Python</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("course") %>' ID="Label3"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Select Course</asp:ListItem>
                                <asp:ListItem>Pop</asp:ListItem>
                                <asp:ListItem>Python</asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbgrid %>" DeleteCommand="DELETE FROM [Table] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Table] ([name], [course]) VALUES (@name, @course)" SelectCommand="SELECT * FROM [Table]" UpdateCommand="UPDATE [Table] SET [name] = @name, [course] = @course WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="course" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String"></asp:Parameter>
                    <asp:Parameter Name="course" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
