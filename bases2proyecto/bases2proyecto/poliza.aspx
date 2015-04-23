<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="poliza.aspx.cs" Inherits="bases2proyecto.poliza" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Poliza</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="left">
        <table style="width: 100%">
        <tr>
            <td><asp:Button ID="Button1" runat="server" Text="Nueva" OnClick="Button1_Click" /></td>
            <td>&nbsp;</td>
            <td><asp:Button ID="Button2" runat="server" Text="Modificar" /></td>
            <td>&nbsp;</td>
            <td><asp:Button ID="Button3" runat="server" Text="Eliminar" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="fecha,moneda_id_moneda" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing">
        <Columns>
            <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" SortExpression="fecha" />
            <asp:BoundField DataField="cambio" HeaderText="cambio" ReadOnly="True" SortExpression="cambio" />
            <asp:BoundField DataField="moneda_id_moneda" HeaderText="moneda_id_moneda" ReadOnly="True" SortExpression="moneda_id_moneda" Visible="False" />
            <asp:BoundField DataField="moneda" HeaderText="moneda" ReadOnly="True" SortExpression="moneda" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString2.ProviderName %>" SelectCommand="select tm.fecha, tm.cambio, tm.moneda_id_moneda,  m.moneda
from tipo_de_cambio tm, moneda m
where tm.moneda_id_moneda =  m.id_moneda"></asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
