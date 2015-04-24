<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="mantenimiento.aspx.cs" Inherits="bases2proyecto.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <strong>Seleccione una tabla y una opción a realizar sobre ella</strong><br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <asp:Table ID="Table1" runat="server" CellPadding="0" BorderWidth="0">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center">
                    
                <asp:ImageButton ID="BtnNuevo" runat="server" AlternateText="Nuevo Registro" 
                    Height="35px" ImageAlign="AbsMiddle" ImageUrl="~/Images/New.png" 
                    onclick="BtnNuevo_Click" Width="35px" ToolTip="Nuevo Registro" />
                &nbsp;
                <asp:ImageButton ID="BtnModificar" runat="server" 
                    AlternateText="Modificar registros" Height="35px" ImageAlign="AbsMiddle" 
                    ImageUrl="~/Images/Modify.png" onclick="BtnModificar_Click" Width="35px" 
                        ToolTip="Modificar Registros" />
                &nbsp;
                <asp:ImageButton ID="BtnEliminar" runat="server" 
                    AlternateText="Eliminar Registros" Height="35px" ImageAlign="AbsMiddle" 
                    ImageUrl="~/Images/Delete.png" onclick="BtnEliminar_Click" Width="35px" 
                        ToolTip="Eliminar Registros" />
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="CmbItems" runat="server">
                    <asp:ListItem Selected="True" Value="tipo_de_seguro">Tipo de seguro</asp:ListItem>
                    <asp:ListItem Value="tipo_cliente">Tipo de cliente</asp:ListItem>
                    <asp:ListItem Value="pais">Pais</asp:ListItem>
                    <asp:ListItem Value="condiciones_particulares">Condiciones Particulares</asp:ListItem>
                    <asp:ListItem Value="estado_poliza">Estado Poliza</asp:ListItem>
                </asp:DropDownList>
                &nbsp;


            </asp:TableCell>
        </asp:TableRow>
    
    </asp:Table>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
