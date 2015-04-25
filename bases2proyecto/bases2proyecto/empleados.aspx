<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="empleados.aspx.cs" Inherits="bases2proyecto.empleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        Empleados</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="text-align: center">
        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />

        &nbsp;

        <asp:Button ID="btnEditar" runat="server" OnClick="btnEditar_Click" Text="Editar" />

        &nbsp;

        <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_emp" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id_emp" HeaderText="id_emp" ReadOnly="True" SortExpression="id_emp" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" ReadOnly="True" SortExpression="nombre" />
            <asp:BoundField DataField="usuario" HeaderText="usuario" ReadOnly="True" SortExpression="usuario" />
            <asp:BoundField DataField="telefono" HeaderText="telefono" ReadOnly="True" SortExpression="telefono" />
            <asp:BoundField DataField="tipo" HeaderText="tipo" ReadOnly="True" SortExpression="tipo" />
            <asp:BoundField DataField="departamento" HeaderText="departamento" ReadOnly="True" SortExpression="departamento" />
            <asp:BoundField DataField="oficina" HeaderText="oficina" ReadOnly="True" SortExpression="oficina" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT empleado.id_emp, empleado.nombre, empleado.usuario, empleado.telefono, tipo_empleado.tipo, departamento.nombre AS departamento, oficina.nombre AS oficina FROM empleado INNER JOIN tipo_empleado ON empleado.id_te = tipo_empleado.id_te INNER JOIN oficina ON empleado.id_oficina = oficina.id_oficina INNER JOIN departamento ON empleado.id_dep = departamento.id_dep"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p>
        <strong>Seleccione una categoria:
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >Tipo de empleado</asp:LinkButton>
&nbsp;-
        <asp:LinkButton ID="LinkButton2" runat="server">Departamento</asp:LinkButton>
&nbsp;-
        <asp:LinkButton ID="LinkButton3" runat="server">Oficina</asp:LinkButton>
        </strong>
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
