<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="pagos.aspx.cs" Inherits="bases2proyecto.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        Pagos</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="font-weight: 700">
        Seleccione una opción:</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
     <p>
         &nbsp;
     <a href="nuevoplanpago.aspx">Nuevo plan de pagos</a>

         &nbsp;</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_plan" DataSourceID="dsPlanPagos">
        <Columns>
            <asp:BoundField DataField="id_plan" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_plan" />
            <asp:BoundField DataField="prima" HeaderText="prima" SortExpression="prima" />
            <asp:BoundField DataField="numero_cuotas" HeaderText="numero cuotas" SortExpression="numero_cuotas" />
            <asp:BoundField DataField="recargo" HeaderText="recargo" SortExpression="recargo" />
            <asp:BoundField DataField="pago_cuota" HeaderText="pago por cuota" SortExpression="pago_cuota" />
            <asp:BoundField DataField="moneda_id_moneda" HeaderText="moneda" SortExpression="moneda_id_moneda" />
            <asp:BoundField DataField="numero_cuotas_atrasadas" HeaderText="cuotas atrasadas" SortExpression="numero_cuotas_atrasadas" />
            <asp:BoundField DataField="poliza_tipo_de_seguro_id_ts" HeaderText="Tipo seguro" ReadOnly="True" SortExpression="poliza_tipo_de_seguro_id_ts" />
            <asp:BoundField DataField="poliza_id_poliza" HeaderText="poliza" ReadOnly="True" SortExpression="poliza_id_poliza" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsPlanPagos" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM plan_de_pagos"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
    <p style="text-align: center">
    <strong>Otras páginas relacionadas:
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Moneda</asp:LinkButton>
&nbsp;-
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Tipo de cambio</asp:LinkButton>
    </strong> 
    
    </p>
</asp:Content>
