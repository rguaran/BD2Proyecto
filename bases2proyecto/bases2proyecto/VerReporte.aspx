<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="VerReporte.aspx.cs" Inherits="bases2proyecto.verReporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" EnableEventValidation="false">
    <p style="font-size: xx-large">
        <asp:Label ID="lblTitulo" runat="server" Text="Reporte "></asp:Label>
    </p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblFiltros" runat="server" style="font-weight: 700" Text="Seleccione los filtros que desee aplicar y presione el botón de actualización"></asp:Label>
                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar reporte" OnClick="btnActualizar_Click" />
            
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="height: 20px">&nbsp;<asp:Label ID="lblTipoSeguro" runat="server" Text="Tipo de seguro "></asp:Label>
                <asp:DropDownList ID="cmbTipoSeguro" runat="server" DataSourceID="SqlDataSource1" DataTextField="tipo" DataValueField="id_ts">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT tipo_de_seguro.* FROM tipo_de_seguro"></asp:SqlDataSource>
            </td>
            <td style="height: 20px">
                <asp:Label ID="lblTipoCliente" runat="server" Text="Cliente "></asp:Label>
                <asp:TextBox ID="txtCliente" runat="server"></asp:TextBox>
            </td>
            <td>

                <asp:Label ID="lblMoneda" runat="server" Text="Moneda"></asp:Label>
                <asp:DropDownList ID="cmbMoneda" runat="server" DataSourceID="SqlDataSource3" DataTextField="moneda" DataValueField="id_moneda">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT moneda.* FROM moneda"></asp:SqlDataSource>

            </td>
            <td>

                <asp:Label ID="lblPoliza" runat="server" Text="Número de póliza "></asp:Label>
                <asp:TextBox ID="txtPoliza" runat="server"></asp:TextBox>

            </td>
            <td>

                <asp:Label ID="lblAgente" runat="server" Text="Agente: "></asp:Label>
                <asp:TextBox ID="txtAgente" runat="server"></asp:TextBox>

            </td>
           <td>

               <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
               <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>

            </td>
            <td>

                <asp:Label ID="lblPolizaVieja" runat="server" Text="Póliza vieja"></asp:Label>
                <asp:DropDownList ID="cmbPolizaVieja" runat="server" DataSourceID="SqlDataSource4" DataTextField="poliza_vieja" DataValueField="poliza_vieja">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT distinct poliza_vieja FROM poliza where poliza_vieja IS NOT NULL"></asp:SqlDataSource>

            </td>
        </tr>

    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <table style="width:100%;">
        <tr>
            
            <td>

                <asp:Label ID="lblVendedor" runat="server" Text="Vendedor"></asp:Label>
                <asp:TextBox ID="txtVendedor" runat="server"></asp:TextBox>

            </td>
            <td>

                <asp:Label ID="lblTop" runat="server" Text="TOP 10"></asp:Label>

                <asp:CheckBoxList ID="chkTop" runat="server">
                    <asp:ListItem Selected="True" Value="1">Más pólizas</asp:ListItem>
                    <asp:ListItem Value="1">Más a pagar</asp:ListItem>
                    <asp:ListItem Value="1">Mayor cantidad asegurada</asp:ListItem>
                </asp:CheckBoxList>

            </td>
            <td>

                <asp:Label ID="lblFecha" runat="server" Text="Fecha"></asp:Label>
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>

            </td>
            <td>

                <asp:Label ID="lblAccion" runat="server" Text="Acción"></asp:Label>
                <asp:DropDownList ID="cmbAccion" runat="server" DataSourceID="SqlDataSource2" DataTextField="accion" DataValueField="accion">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT accion FROM bitacora"></asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnPDF" runat="server" OnClick="btnPDF_Click" Text="Exportar PDF" />
&nbsp;&nbsp;
                <asp:Button ID="btnExcel" runat="server" OnClick="btnExcel_Click" Text="Exportar Excel" />
            </td>

        </tr>
        <tr>
            <td>
                <asp:GridView ID="gridReporte" runat="server" style="text-align: center">
                </asp:GridView>
            </td>

        </tr>

    </table>
</asp:Content>
