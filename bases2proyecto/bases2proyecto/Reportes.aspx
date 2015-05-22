<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="bases2proyecto.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Reportes</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <table style="width: 100%">
        <tr>
            <td style="width: 391px">Reporte(1) de Clientes</td>
            <td>
                <asp:Button ID="btnreporte1" runat="server" OnClick="btnreporte1_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(2) Montos por Tipo de Seguro</td>
            <td>
                <asp:Button ID="btnreporte2" runat="server" OnClick="btnreporte2_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(3) Búsqueda de Pólizas</td>
            <td>
                <asp:Button ID="btnreporte3" runat="server" OnClick="btnreporte3_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(4) Total asegurado, Total pagado y deuda total</td>
            <td>
                <asp:Button ID="btnreporte4" runat="server" OnClick="btnreporte4_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(5) Empleados con pólizas asociadas</td>
            <td>
                <asp:Button ID="btnreporte5" runat="server" OnClick="btnreporte5_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(6) sumarizado de coberturas</td>
            <td>
                <asp:Button ID="btnreporte6" runat="server" OnClick="btnreporte6_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px; height: 20px;">Reporte(7) sumarizado y agrupado por vendedor</td>
            <td style="height: 20px">
                <asp:Button ID="btnreporte7" runat="server" OnClick="btnreporte7_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(8) sumarizado de Agente del negocio</td>
            <td>
                <asp:Button ID="btnreporte8" runat="server" OnClick="btnreporte8_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(9) estadístico de nuestros 10 mejores clientes</td>
            <td>
                <asp:Button ID="btnreporte9" runat="server" OnClick="btnreporte9_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(10) flujo de inspecciones</td>
            <td>
                <asp:Button ID="btnreporte10" runat="server" OnClick="btnreporte10_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(11) Bitácora de transacciones</td>
            <td>
                <asp:Button ID="btnreporte11" runat="server" OnClick="btnreporte11_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(12) cuotas y deuda por cliente</td>
            <td>
                <asp:Button ID="btnreporte12" runat="server" OnClick="btnreporte12_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px; height: 20px;"></td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(13) Suma de coberturas por cliente</td>
            <td>
                <asp:Button ID="btnreporte13" runat="server" OnClick="btnreporte13_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">Reporte(14) Reporte de documentos subidos a la base de datos</td>
            <td>
                <asp:Button ID="btnreporte14" runat="server" OnClick="btnreporte14_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 391px; height: 20px;">Reporte(15) Reporte de usuarios</td>
            <td style="height: 20px">
                <asp:Button ID="btnreporte15" runat="server" OnClick="btnreporte15_Click" Text="Ver Reporte" Width="99px" />
            </td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="width: 391px">&nbsp;</td>
            <td>&nbsp;</td>
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
