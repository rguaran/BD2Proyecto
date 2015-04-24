<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="poliza.aspx.cs" Inherits="bases2proyecto.poliza" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Poliza</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="left">
        <table style="width: 100%">
        <tr>
            <td><asp:Button ID="Button1" runat="server" Text="Nueva" OnClick="Button1_Click" /></td>
            <td>&nbsp;</td>
            <td><asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" /></td>
            <td>&nbsp;</td>
            <td><asp:Button ID="Button3" runat="server" Text="Eliminar" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>
