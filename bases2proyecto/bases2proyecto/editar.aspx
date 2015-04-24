<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="editar.aspx.cs" Inherits="bases2proyecto.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="font-size: xx-large">
        <asp:Label ID="Label1" runat="server" Text="Editar"></asp:Label>
    </p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="text-align: center">
        Modifique o agregue los campos que desee</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
   <p style="text-align: center">
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar registro" OnClick="btnAgregar_Click" />
   </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    
        <asp:GridView ID="GridView1" runat="server" OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" >
            <Columns>
                <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" InsertText="Insertar" ShowEditButton="True" UpdateText="Actualizar"  />
            </Columns>
        </asp:GridView>
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
    <p style="text-align: center">
        <asp:Button ID="btnGuardar" runat="server" style="text-align: center; width: 68px;" Text="Guardar" OnClick="btnGuardar_Click" />
    </p>
</asp:Content>
