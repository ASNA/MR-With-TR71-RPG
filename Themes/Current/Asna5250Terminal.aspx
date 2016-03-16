<%@ Page Language="AVR" AutoEventWireup="false"  CodeFile="Asna5250Terminal.aspx.vr" Inherits="Display" MasterPageFile="~/Themes/Current/MasterPage.master" %>
<%@ Register TagPrefix="mdf" Assembly="ASNA.Monarch.WebDspF, Version=12.0.25.0, Culture=neutral, PublicKeyToken=71de708db13b26d3" Namespace="ASNA.Monarch.WebDspF" %>

<asp:Content ID="HeaderArea" ContentPlaceHolderID="HeaderPH" runat="Server">
    <title>ASNA 5250 Terminal Emulator</title>
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
</asp:Content>

<asp:Content ID="CentralArea" runat="server" ContentPlaceHolderID="AppBody">
    <mdf:AsnaTerm5250 runat="server" />
</asp:Content>

<asp:Content ID="PageScriptArea" runat="server" ContentPlaceHolderID="PageScriptPH">

    <script type="text/javascript">
        if (ASNA.Vendor.IsDesktop()) {
            var w = document.getElementById('wrapper');
            if (w) {
                w.style.width = '100%';
            }
        }

        WingsTerminal.Render(function () { // Note: this is ignored by WingsTerminal for Mobile browsers (the window.screen object is used).
            var usingjQuery = typeof ($) !== 'undefined';
            var newWidth = 800;

            if (usingjQuery) {
                newWidth = ($(window).width() * 0.85) - $("#left-column").width(); // 85% of Browser's width.
                $("#right-column").width(newWidth);
            }

            return { "width": newWidth, "height": newWidth * 0.75 }; // 4:3 ratio
        });
    </script>

</asp:Content>
