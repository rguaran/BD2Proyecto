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
            <td><asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" /></td>
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
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id_poliza" HeaderText="id_poliza" ReadOnly="True" SortExpression="id_poliza" />
            <asp:BoundField DataField="id_estado" HeaderText="id_estado" ReadOnly="True" SortExpression="id_estado" />
            <asp:BoundField DataField="id_cp" HeaderText="id_cp" ReadOnly="True" SortExpression="id_cp" />
            <asp:BoundField DataField="fecha_inicio" HeaderText="fecha_inicio" ReadOnly="True" SortExpression="fecha_inicio" />
            <asp:BoundField DataField="fecha_fin" HeaderText="fecha_fin" ReadOnly="True" SortExpression="fecha_fin" />
            <asp:BoundField DataField="clausulas" HeaderText="clausulas" ReadOnly="True" SortExpression="clausulas" />
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="id_ts" HeaderText="id_ts" ReadOnly="True" SortExpression="id_ts" />
            <asp:BoundField DataField="poliza_vieja" HeaderText="poliza_vieja" ReadOnly="True" SortExpression="poliza_vieja" />
            <asp:BoundField DataField="meses" HeaderText="meses" ReadOnly="True" SortExpression="meses" />
            <asp:BoundField DataField="producto_descripcion" HeaderText="producto_descripcion" ReadOnly="True" SortExpression="producto_descripcion" />
            <asp:BoundField DataField="status" HeaderText="status" ReadOnly="True" SortExpression="status" />
            <asp:BoundField DataField="id_vendedor" HeaderText="id_vendedor" ReadOnly="True" SortExpression="id_vendedor" />
            <asp:BoundField DataField="id_operador" HeaderText="id_operador" ReadOnly="True" SortExpression="id_operador" />
            <asp:BoundField DataField="id_negociador" HeaderText="id_negociador" ReadOnly="True" SortExpression="id_negociador" />
            <asp:BoundField DataField="cod_venta" HeaderText="cod_venta" ReadOnly="True" SortExpression="cod_venta" />
            <asp:BoundField DataField="coberturas_adicionales" HeaderText="coberturas_adicionales" ReadOnly="True" SortExpression="coberturas_adicionales" />
            <asp:BoundField DataField="id_cargav" HeaderText="id_cargav" ReadOnly="True" SortExpression="id_cargav" />
            <asp:BoundField DataField="id_cargao" HeaderText="id_cargao" ReadOnly="True" SortExpression="id_cargao" />
            <asp:BoundField DataField="id_cargan" HeaderText="id_cargan" ReadOnly="True" SortExpression="id_cargan" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="consultar_poliza" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
