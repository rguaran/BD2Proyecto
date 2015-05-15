<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="bien.aspx.cs" Inherits="bases2proyecto.bien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        Bien</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="text-align: center">
        <strong>Modifique o agregue los campos que desee</strong></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
   <p style="text-align: center">
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar registro" OnClick="btnAgregar_Click" />
   </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    
        <asp:GridView ID="GridView1" runat="server" OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging" >
            <Columns>
                <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" InsertText="Insertar" ShowEditButton="True" UpdateText="Actualizar"  />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
    <p style="text-align: center">
        <asp:Button ID="btnGuardar" runat="server" style="text-align: center; width: 68px;" Text="Guardar" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnInspeccion" runat="server" OnClick="btnInspeccion_Click" Text="Ir a inspecciones" />
    </p>
</asp:Content>
