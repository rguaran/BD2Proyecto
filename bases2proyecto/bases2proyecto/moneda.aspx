<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="moneda.aspx.cs" Inherits="bases2proyecto.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        <strong>Monedas</strong></p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="text-align: center">
        <strong>Seleccione la opción que desee realizar sobre los datos de las monedas ingresadas.</strong></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
        <p style="text-align: center">
        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />

        &nbsp;

        <asp:Button ID="btnEditar" runat="server" OnClick="btnEditar_Click" Text="Editar" />

        &nbsp;

        <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p>
        <div style="text-align: center">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_moneda" DataSourceID="dsMoneda">
            <Columns>
                <asp:BoundField DataField="id_moneda" HeaderText="ID" ReadOnly="True" SortExpression="id_moneda" />
                <asp:BoundField DataField="moneda" HeaderText="Moneda" SortExpression="moneda" />
            </Columns>
        </asp:GridView>
            <asp:SqlDataSource ID="dsMoneda" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM MONEDA;"></asp:SqlDataSource>
            </div>
    </p>
    </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
