<%@ Page Language="AVR" AutoEventWireup="false"  CodeFile="!Diagnose.aspx.vr" Inherits="ASNA.Monarch.Support.Diagnose" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml" >
  <head>
        <title>Diagnose</title>
  </head>
    <body>
      <form id="Form1" method="post" runat="server">
           <em>There has been an abnormal termination of the program.</em> 

        <p><strong>Exception</strong></p>
        <asp:panel id="Panel2" runat="server" BackColor="#FFFFC0" Height="32px">
           <asp:Label id="lblMessage" runat="server"> Message</asp:Label>
        </asp:panel>
        <p><strong>StackTrace</strong></p>
        <code>
          <asp:panel id="Panel1" runat="server" BackColor="#FFFFC0" BorderColor="Black" Height="256px" >
             <asp:Label id="lblStackTrace" runat="server">lbl Stack Trace</asp:Label>
          </asp:panel>
        </code>
      </form>
    </body>
</html>
