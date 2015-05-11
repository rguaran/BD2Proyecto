<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="clientesmantenimiento.aspx.cs" Inherits="bases2proyecto.clientesmantenimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <strong>Seleccione una tabla y una opción a realizar sobre ella</strong><br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
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
                    <asp:ListItem Value="tipo_cliente">Tipo de cliente</asp:ListItem>
                    <asp:ListItem Value="pais">Pais</asp:ListItem>
                </asp:DropDownList>
                &nbsp;


            </asp:TableCell>
        </asp:TableRow>
    
    </asp:Table>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <asp:Table ID="Table2" runat="server" CellPadding="0" BorderWidth="0">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center">
                    
                <asp:ImageButton ID="BtnNuevo2" runat="server" AlternateText="Nuevo Registro" 
                    Height="35px" ImageAlign="AbsMiddle" ImageUrl="~/Images/New.png" 
                    onclick="BtnNuevo2_Click" Width="35px" ToolTip="Nuevo Registro" />
                &nbsp;
                &nbsp;&nbsp;&nbsp;
                Cliente
                &nbsp;


            </asp:TableCell>
        </asp:TableRow>
    
    </asp:Table>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" AllowPaging="true" AllowSorting="true">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" ReadOnly="True" SortExpression="nombre" />
            <asp:BoundField DataField="domicilio" HeaderText="domicilio" ReadOnly="True" SortExpression="domicilio" />
            <asp:BoundField DataField="id1" HeaderText="id1" ReadOnly="True" SortExpression="id1" Visible="False" />
            <asp:BoundField DataField="id_pais" HeaderText="id_pais" ReadOnly="True" SortExpression="id_pais" Visible="False" />
            <asp:BoundField DataField="id_tc" HeaderText="id_tc" ReadOnly="True" SortExpression="id_tc" Visible="False" />
            <asp:BoundField DataField="tipo" HeaderText="tipo" ReadOnly="True" SortExpression="tipo" />
            <asp:BoundField DataField="id_pais2" HeaderText="id_pais2" ReadOnly="True" SortExpression="id_pais2" Visible="False" />
            <asp:BoundField DataField="pais" HeaderText="pais" ReadOnly="True" SortExpression="pais" />
            <asp:ButtonField Text="eliminar" CommandName="eliminar" />
            <asp:ButtonField Text="modificar" CommandName="modificar" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="consultar_cliente" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
