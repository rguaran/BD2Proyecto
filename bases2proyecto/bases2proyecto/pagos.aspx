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
     <p style="text-align: center">
        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />

        &nbsp;

        <asp:Button ID="btnEditar" runat="server" OnClick="btnEditar_Click" Text="Editar" />

        &nbsp;

        <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
     </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_poliza,id_ts" DataSourceID="dsPlanPagos" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="prima" HeaderText="prima" ReadOnly="True" SortExpression="prima" />
            <asp:BoundField DataField="numero_cuotas" HeaderText="numero_cuotas" SortExpression="numero_cuotas" ReadOnly="True" />
            <asp:BoundField DataField="recargo" HeaderText="recargo" SortExpression="recargo" ReadOnly="True" />
            <asp:BoundField DataField="pago_cuota" HeaderText="pago_cuota" SortExpression="pago_cuota" ReadOnly="True" />
            <asp:BoundField DataField="numero_cuotas_atrasadas" HeaderText="numero_cuotas_atrasadas" SortExpression="numero_cuotas_atrasadas" ReadOnly="True" />
            <asp:BoundField DataField="porcentaje_deducible" HeaderText="porcentaje_deducible" SortExpression="porcentaje_deducible" ReadOnly="True" />
            <asp:BoundField DataField="deducible" HeaderText="deducible" SortExpression="deducible" ReadOnly="True" />
            <asp:BoundField DataField="id_poliza" HeaderText="id_poliza" ReadOnly="True" SortExpression="id_poliza" />
            <asp:BoundField DataField="id_ts" HeaderText="id_ts" ReadOnly="True" SortExpression="id_ts" />
            <asp:BoundField DataField="tipo" HeaderText="tipo" ReadOnly="True" SortExpression="tipo" />
            <asp:BoundField DataField="moneda" HeaderText="moneda" ReadOnly="True" SortExpression="moneda" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsPlanPagos" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="SELECT plan_de_pagos.prima, plan_de_pagos.numero_cuotas, plan_de_pagos.recargo, plan_de_pagos.pago_cuota, plan_de_pagos.numero_cuotas_atrasadas, plan_de_pagos.porcentaje_deducible, plan_de_pagos.deducible, poliza.id_poliza, poliza.id_ts, tipo_de_pago.tipo, moneda.moneda FROM plan_de_pagos INNER JOIN poliza ON plan_de_pagos.id_poliza = poliza.id_poliza INNER JOIN tipo_de_pago ON plan_de_pagos.id_tp = tipo_de_pago.id_tp INNER JOIN moneda ON plan_de_pagos.id_moneda = moneda.id_moneda"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
    <p style="text-align: center">
    <strong>Otras páginas relacionadas:
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Moneda</asp:LinkButton>
&nbsp;-
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Tipo de cambio</asp:LinkButton>
    &nbsp;-
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Tipo de pago</asp:LinkButton>
    </strong> 
    
    </p>
</asp:Content>
