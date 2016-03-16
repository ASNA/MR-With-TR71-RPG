<%@ Page Language="AVR" AutoEventWireup="false"  CodeFile="!EoJ.aspx.vr" Inherits="ASNA.Monarch.Support.EoJ"  MasterPageFile="~/Themes/Current/Plain.master" %>
<asp:Content ID="FileContent1" runat="server" ContentPlaceHolderID="HeaderPH">
    <style>
        body { background-color: #008800; }

        #product-image      { margin-top: 25px; }
        #product-image img  { border: 1px solid white; display:block; margin:auto; }
        #thank-you          { color: white; text-align:center; font-size:0.9em; font-family:verdana; padding-bottom:12px; margin-top:20px; }
        #instructions       { color: white; text-align:center; font-size:0.5em; font-family: verdana; padding-bottom: 12px; }
        .links              { color: white;  font-size:0.8em; }
    </style>
</asp:Content>

<asp:Content ID="FileContent2" runat="server" ContentPlaceHolderID="AppBody">

    <div style="text-align:center;">
        <div id="product-image">
            <img src="../themes/current/images/mobile-152x152.png" alt="">	
            <div id="thank-you">
                Thank you for using ASNA Mobile RPG<sup>&reg;</sup>
            </div>
        </div>
        <br />

        <asp:HyperLink cssClass="links" ID="HyperLink1" runat="server"  NavigateUrl="~/Monarch/SignOn.aspx">Restart App</asp:HyperLink>
        <br />
        <br />

        <asp:HyperLink cssClass="links" ID="HyperLink2" runat="server"  NavigateUrl="*AsnaGoHome">Switch to another App</asp:HyperLink>
        <br />
        <br />
        <br />
        <br />
        
        <div id="instructions" style="text-align:center;">
            For production work you can either replace the contents of this display with your own text and images or you can redirect the user back to a main menu.
        </div>
    </div>
</asp:Content>

    
