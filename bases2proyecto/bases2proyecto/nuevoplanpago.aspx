<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="nuevoplanpago.aspx.cs" Inherits="bases2proyecto.WebForm1" UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        Nuevo plan de pagos</p>
    <p style="font-size: xx-large">
        &nbsp;</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="text-align: center">
        <strong>Ingrese las opciones del plan de pagos</strong></p>
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
                <asp:TextBox ID="txtRecargo" runat="server" OnTextChanged="TextBox3_TextChanged" Width="190px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="txtRecargo" ErrorMessage="*Ingrese Valores Numericos"
                            ForeColor="Red"
                            ValidationExpression="^[0-9]+(.[0-9]+)*">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">Pago por cuota</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtPagoCuota" runat="server" ReadOnly="True" Width="190px"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-weight: 700">Deducible (%)</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtPorcentajeDeducible" runat="server" Width="190px" OnTextChanged="txtPorcentajeDeducible_TextChanged"></asp:TextBox>
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
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" />
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
        
</asp:Content>
