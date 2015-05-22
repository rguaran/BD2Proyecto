<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="archivos.aspx.cs" Inherits="bases2proyecto.archivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        Archivos</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="text-align: center; font-weight: 700">No. Poliza</td>
            <td style="text-align: center">
                <asp:TextBox ID="txtIdPoliza" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">Tipo de seguro</td>
            <td style="text-align: center">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="tipo" DataValueField="id_ts">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM TIPO_DE_SEGURO"></asp:SqlDataSource>
            </td>

        </tr>

    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <p>
        <strong>Archivos adjuntos (seleccione varios):
        <asp:FileUpload ID="FileUpload1" AllowMultiple="true"   runat="server" Width="245px" />
        </strong>
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p> 
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar archivos" OnClick="btnGuardar_Click" />&nbsp;<asp:Button ID="btnConsultar" runat="server" Text="Consultar archivos" OnClick="btnConsultar_Click" />
    &nbsp;<asp:Button ID="btnContinuar" runat="server" OnClick="btnContinuar_Click" Text="Continuar" />
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
    <p>
        <script type="text/javascript">
            function CallMe() {  __doPostBack('LinkButton1_Click', ''); }
    </script>
        <asp:Table ID="Table1" runat="server"></asp:Table>
        <!-- <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"  Visible="False"></asp:LinkButton>
        <asp:Label ID="lblFilename" runat="server" Visible="False"></asp:Label> -->
        <asp:Button ID="btnDescargarTodos" runat="server" Text="Descargar todos como ZIp" OnClick="btnDescargarTodos_Click" />
    </p>
</asp:Content>
