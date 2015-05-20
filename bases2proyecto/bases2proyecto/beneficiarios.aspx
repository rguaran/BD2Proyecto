<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="beneficiarios.aspx.cs" Inherits="bases2proyecto.beneficiarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Beneficiarios</h1>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table style="width: 100%">
        <tr>
            <td>&nbsp;</td>
            <td>No. Poliza</td>
            <td>
                <asp:TextBox ID="txtnopoliza" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Tipo Seguro</td>
            <td>
                <asp:DropDownList ID="ddltiposeguro" runat="server"  DataSourceID="SqlDataSource1" DataTextField="tipo" DataValueField="id_ts">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="consultar_tipo_de_seguro" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            
        </tr>
        <tr>
            
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            
            <td>
                Nombre</td>
            <td>
                <asp:TextBox ID="txtnombre" runat="server" Width="204px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px">&nbsp;</td>
            
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>Telefono</td>
            <td>
                <asp:TextBox ID="txttelefono" runat="server"></asp:TextBox>
            </td>
            
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            
        </tr>
        <tr>
            
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnagregarbenef" runat="server" Text="Agregar" OnClick="btnagregarbenef_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
