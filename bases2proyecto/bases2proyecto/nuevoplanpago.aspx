<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="nuevoplanpago.aspx.cs" Inherits="bases2proyecto.WebForm1" UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        Nuevo
        Plan de pagos</p>
    <p style="font-size: xx-large">
        &nbsp;</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="text-align: center">
        <strong>Ingrese las opciones del plan de pagos</strong></p>
    <p style="text-align: center">
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: large"></asp:Label>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    
    <table style="width:100%;">
        <tr>
            <td style="text-align: center"><strong style="text-align: center">Prima</strong></td>
            <td style="text-align: left">
                <asp:TextBox ID="txtPrima" runat="server" style="text-align: left" Width="190px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtPrima" ErrorMessage="*Ingrese Valores Numericos"
                            ForeColor="Red"
                            ValidationExpression="^[0-9]+(.[0-9]+)*">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">No. Cuotas</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtNoCuotas" runat="server" Width="190px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="txtNoCuotas" ErrorMessage="*Ingrese Valores Numericos"
                            ForeColor="Red"
                            ValidationExpression="^[0-9]+">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">Recargo (%)</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtRecargo" runat="server"  Width="190px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="txtRecargo" ErrorMessage="*Ingrese Valores Numericos"
                            ForeColor="Red"
                            ValidationExpression="^[0-9]+(.[0-9]+)*">
                </asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr>
            <td style="text-align: center; font-weight: 700">Deducible (%)</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtPorcentajeDeducible" runat="server" Width="190px" ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                            ControlToValidate="txtPorcentajeDeducible" ErrorMessage="*Ingrese Valores Numericos"
                            ForeColor="Red"
                            ValidationExpression="^[0-9]+(.[0-9]+)*">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">Deducible</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtDeducible" runat="server"  ReadOnly="True" Width="190px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">Moneda</td>
            <td style="text-align: left">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsMoneda" DataTextField="moneda" DataValueField="id_moneda">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsMoneda" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM MONEDA;"></asp:SqlDataSource>

            </td>
        </tr>
                <tr>
            <td style="text-align: center; font-weight: 700">Tipo de cuota</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtTipoCuota" runat="server" ReadOnly="True" Width="190px"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">Tipo de pago</td>
            <td style="text-align: left">
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="tipo" DataValueField="id_tp">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM tipo_de_pago" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">Detalle de pagos</td>
            <td style="text-align: left">
        <asp:Button ID="btnDetalle" runat="server" Text="Ver detalle" OnClick="btnDetalle_Click" />

            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p style="text-align: center">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
    &nbsp;<asp:Button ID="btnContinuar" runat="server" OnClick="btnContinuar_Click" Text="Continuar" />
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
        
</asp:Content>
