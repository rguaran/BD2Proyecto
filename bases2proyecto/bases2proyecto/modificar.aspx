﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="modificar.aspx.cs" Inherits="bases2proyecto.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table align="center" style="width:100%;">
        <tr>
            <td class="style1" style="text-align: center"><strong>Modifique o agregue los datos que necesite y luego presione en guardar</strong></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <table align="center" style="width:100%;">
        <tr>
            <td align="left">&nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Button ID="BtnAgregar" runat="server" Height="75px" onclick="BtnAgregar_Click" Text="Agregar Registro" Width="150px" />
            </td>
        </tr>
        <tr>
            <td align="center" class="style1">
                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateDeleteButton="False" AutoGenerateEditButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" style="position:static" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Button ID="BtnGuardar" runat="server" Height="75px" onclick="BtnGuardar_Click" Text="Guardar" Width="80px" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
