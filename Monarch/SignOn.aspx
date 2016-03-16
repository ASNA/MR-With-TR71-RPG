<%@ Page Language="AVR" AutoEventWireup="false" CodeFile="SignOn.aspx.vr" Inherits="SignOn" MasterPageFile="~/Themes/Current/MasterPage.master" %>
<%@ Register TagPrefix="mdf" Assembly="ASNA.Monarch.WebDspF, Version=12.0.25.0, Culture=neutral, PublicKeyToken=71de708db13b26d3" Namespace="ASNA.Monarch.WebDspF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPH" runat="Server" >
</asp:Content>

    <asp:Content ID="FileContent2" runat="server" ContentPlaceHolderID="AppBody">
        <mdf:ddsfile id="SignOnControl" runat="server" DisplayErrorMessages="True" BannerStyle="Invisible"  />
            
        <mdf:DdsRecord id="_RSIGNON" runat="server" style="POSITION: relative;"  Alias="RSIGNON" CssClass="DdsRecord" NavigationBarControlID="HomeNavBar" AttnKeys="F3 03" EraseFormats="*ALL" >

            <mdf:DdsBar ID="HomeNavBar" runat="server" CssClass="DdsBar" Width="100%" >
                <mdf:DdsBarSegment ID="DdsBarSegment2" runat="server" Alignment="Left">
                    <mdf:DdsButton ID="DdsButton15" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F3" Text="End" />
                </mdf:DdsBarSegment>
                <mdf:DdsBarSegment ID="DdsBarSegment3" runat="server" Alignment="Center">
                    <span class="PanelTitle" >Sign On to Hello World</span>
                </mdf:DdsBarSegment>
                <mdf:DdsBarSegment ID="DdsBarSegment1" runat="server" Alignment="Center">
                </mdf:DdsBarSegment>
            </mdf:DdsBar>
            <br />

            <mdf:DdsPanel ID="Panel" runat="server"  VisibleCondition="!30" >
                <mdf:DdsConstant id="DdsConstant7" runat="server" Text="System:" CssClass="DdsConstant" Width="5em"   />
                <mdf:DdsCharField id="RSignon_System" runat="server" CssClass="DdsCharField" Alias="SYSTEM" Length="126" Usage="Both" Lower="True" Width="10em" />
                <br />
                <mdf:DdsConstant id="DdsConstant21" runat="server" Text="Port:" CssClass="DdsConstant" Width="5em" />
                <mdf:DdsCharField id="RSignon_Port" runat="server" CssClass="DdsDecField" Alias="Port" Length="5" Usage="Both" Width="10em" />
                <br />
            </mdf:DdsPanel>

            <mdf:DdsConstant id="DdsConstant1" runat="server" Text="User:" CssClass="DdsConstant" Width="5em" />
            <mdf:DdsCharField id="RSignon_User" runat="server" CssClass="DdsCharField" Alias="USER" Length="10" Usage="Both" Lower="True" Width="10em"  />
            <br />
            <mdf:DdsConstant id="DdsConstant2" runat="server" Text="Password:" CssClass="DdsConstant" Width="5em" />
            <mdf:DdsCharField id="RSignon_Password" runat="server" CssClass="DdsCharField" Alias="Password" Length="128" Usage="Both" Lower="True" InputStyle="Password" Width="10em" PositionCursor = "*True"/>
            <br />         
            <br /> 
            <div class="SignOnButton">
                <mdf:DdsButton ID="DdsButton1" ButtonStyle="Button" runat="server" AidKey="Enter" Text="Sign On" CssClass="NavButton" />
            </div>     
            <br />              
              
            <mdf:DdsCharField id="RSignon_Message" runat="server" CssClass="DdsSflMsgField" Alias="Message" Length="100" Usage="OutputOnly" Lower="True" />

        </mdf:DdsRecord >


    </asp:Content>

 <asp:Content ID="Content2" ContentPlaceHolderID="PageScriptPH" runat="server">
 </asp:Content>
