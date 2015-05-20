<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="nuevapoliza.aspx.cs" Inherits="bases2proyecto.nuevapoliza" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Nueva Poliza</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table style="width: 100%">
        <tr>
            <td>Cliente</td>
            <td>
                <asp:DropDownList ID="ddlcliente" runat="server" DataSourceID="SqlDataSource4" DataTextField="nombre" DataValueField="id_cliente">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:proyectoBD2ConnectionString %>" ProviderName="<%$ ConnectionStrings:proyectoBD2ConnectionString.ProviderName %>" SelectCommand="consultar_cliente" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Fecha Inicio</td>
            <td>
                <asp:TextBox ID="txtfechainicio" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Fecha Final</td>
            <td>
                <asp:TextBox ID="txtfechafinal" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Meses</td>
            <td>
                <asp:TextBox ID="txtmeses" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Descripción</td>
            <td>
                <asp:TextBox ID="txtdescripcion" runat="server" TextMode="MultiLine" Width="318px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Tipo</td>
            <td>
                <asp:DropDownList ID="ddltiposeguro" runat="server" DataSourceID="SqlDataSource1" DataTextField="tipo" DataValueField="id_ts">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="User Id=postgres;Password=admin123;Host=localhost;Database=proyectoBD2;Initial Schema=public" ProviderName="Devart.Data.PostgreSql" SelectCommand="consultar_tipo_de_seguro" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>Estado</td>
            <td>
                <asp:DropDownList ID="ddlestado" runat="server" DataSourceID="SqlDataSource2" DataTextField="estado" DataValueField="id_estado">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="User Id=postgres;Password=admin123;Host=localhost;Database=proyectoBD2;Initial Schema=public" ProviderName="Devart.Data.PostgreSql" SelectCommand="consultar_estado_poliza" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Poliza vieja</td>
            <td>
                <asp:DropDownList ID="ddlpolizavieja" runat="server" DataSourceID="SqlDataSource3" DataTextField="poliza_vieja" DataValueField="poliza_vieja">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="User Id=postgres;Password=admin123;Host=localhost;Database=proyectoBD2;Initial Schema=public" ProviderName="Devart.Data.PostgreSql" SelectCommand="select distinct (poliza_vieja) from poliza"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>Aprobada</td>
            <td>
                <asp:DropDownList ID="ddlstatus" runat="server">
                    <asp:ListItem>Status 1</asp:ListItem>
                    <asp:ListItem>Status 2</asp:ListItem>
                </asp:DropDownList>
             </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>clausulas</td>
            <td>
                <asp:TextBox ID="txtclausulas" runat="server" Height="31px" TextMode="MultiLine" Width="172px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>Codigo de Venta</td>
            <td>
                <asp:TextBox ID="txtcodigoventa" runat="server"></asp:TextBox>
             </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>Coberturas Adicionales</td>
            <td>
                <asp:TextBox ID="txtcoveradicionales" runat="server" TextMode="MultiLine"></asp:TextBox>
             </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>condiciones particulares</td>
            <td>
                <asp:DropDownList ID="ddlcondicionesparticulares" runat="server" DataSourceID="SqlDataSource5" DataTextField="condicion" DataValueField="id_cp">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="User Id=postgres;Password=admin123;Host=localhost;Database=proyectoBD2;Initial Schema=public" ProviderName="Devart.Data.PostgreSql" SelectCommand="consultar_condiciones_particulares" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Vendedor</td>
            <td>
                <asp:DropDownList ID="ddlvendedor" runat="server" DataSourceID="SqlDataSource6" DataTextField="id_emp" DataValueField="id_carga">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="User Id=postgres;Password=admin123;Host=localhost;Database=proyectoBD2;Initial Schema=public" ProviderName="Devart.Data.PostgreSql" SelectCommand="select * from empleado"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Operador</td>
            <td>
                <asp:DropDownList ID="ddloperador" runat="server" DataSourceID="SqlDataSource6" DataTextField="id_emp" DataValueField="id_carga">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Negociador</td>
            <td>
                <asp:DropDownList ID="ddlnegociador" runat="server" DataSourceID="SqlDataSource6" DataTextField="id_emp" DataValueField="id_carga">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
                <tr>
            <td>Precio</td>
            <td>
                <asp:TextBox ID="txtprecio" runat="server"></asp:TextBox>
                    </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
                <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
                <tr>
            <td>Valor Seguro</td>
            <td>
                <asp:TextBox ID="txtvalorseguro" runat="server"></asp:TextBox>
                    </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
                <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Continuar Proceso</td>
            <td>
                <asp:Button ID="btnplanpagos" runat="server" Text="Crear plan de pagos" OnClick="btnplanpagos_Click" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnbienes" runat="server" Text="Asignar bienes" OnClick="btnbienes_Click" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
            <td style="height: 20px">
                <asp:Button ID="btnadjuntararchivos" runat="server" Text="Adjuntar Archivos" OnClick="btnadjuntararchivos_Click" />
            </td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnbeneficiarios" runat="server" Text="Añadir Beneficiarios" OnClick="btnbeneficiarios_Click" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnbienes0" runat="server" Text="Asignar Coberturas" OnClick="btncoberturas_Click" />
            </td>
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
