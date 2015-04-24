<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="tipoDeCambio.aspx.cs" Inherits="bases2proyecto.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        Tipo de cambio</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="text-align: center">
        <strong style="text-align: center">Seleccione la opción que desee realizar sobre los datos de las tipos de cambio ingresados.</strong></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="fecha,moneda_id_moneda" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
            <asp:BoundField DataField="cambio" HeaderText="cambio" SortExpression="cambio" />
            <asp:BoundField DataField="moneda_id_moneda"  HeaderText="moneda_id_moneda" InsertVisible="False" ReadOnly="True" SortExpression="moneda_id_moneda" Visible="False" />
            <asp:TemplateField HeaderText="moneda" SortExpression="moneda">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsMoneda" DataTextField="moneda" DataValueField="id_moneda" SelectedValue='<%# Bind("moneda_id_moneda", "{0}") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("moneda", "{0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT tipo_de_cambio.*, moneda.moneda  FROM tipo_de_cambio INNER JOIN moneda ON tipo_de_cambio .moneda_id_moneda = moneda.id_moneda">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsMoneda" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM MONEDA" OldValuesParameterFormatString="old_{0}"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
