<%@ Page Language="AVR" AutoEventWireup="false" CodeFile="SmpLst.aspx.vr" Inherits="HelloDspf" MasterPageFile="~/Themes/Current/MasterPage.master" %>
<%@ Register TagPrefix="mdf" Assembly="ASNA.Monarch.WebDspF, Version=12.0.25.0, Culture=neutral, PublicKeyToken=71de708db13b26d3" Namespace="ASNA.Monarch.WebDspF" %>

<%--
    What you get with this Mobile RPG Application template:

    1. This source file that contains the DDS to be used by a RPG ILE program in the IBM i
    2. In the library you selected in the Wizard, in file QRPGLESRC, a member named HELLORPG with this as contents:        
    
       0001.00 FHELLODSPF CF   E             WORKSTN Handler('MOBILERPG')            
       0002.00                                                                       
       0003.00 C*********************************************************************
       0004.00 C* Use the RPG-Cycle to display the main menu, get out on IN03        
       0005.00 C*********************************************************************
       0006.00 C                   ExFmt     HomeMenu                                
       0007.00 C                   Select                                            
       0008.00 C                   When      *In03                                   
       0009.00 C                   Eval      *InLR = *On                             
       0010.00 C                   Return                                            
       0011.00 C                   EndSl                                             

    3. The HELLORPG compiled program.
    4. You are ready to run the mobile application from within Visual Studio 
       by pressing F5. (Visual Studio provides its own intrinsic Web server so you don't need 
       to worry about Web servers until you're ready to the deploy for others to use.)
--%>

<asp:Content runat="server" ContentPlaceHolderID="HeaderPH">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="AppBody">
    <%-- Invisible DdsFile control --%>
    <mdf:ddsfile ID="Ddsfile1" runat="server" BannerStyle="Invisible" DisplayErrorMessages="False" SrcDdsCcsid="37" PopUpWindows="false" SetDefaultFocus="false" />



    <%-- Home Record: Home Navigation bar and a simple label on the Page --%>
    <mdf:DdsRecord id="_CustList" runat="server" style="position: relative;" Alias="CustList" CssClass="DdsRecord" 
     NavigationBarControlID  ="HomeNavBar" FuncKeys="F1 *None;F3 *None;F4 *None;F5 *None;" EraseFormats="*ALL" >

        <mdf:DdsBar ID="HomeNavBar" runat="server" CssClass="DdsBar" >
            <mdf:DdsBarSegment ID="DdsBarSegment1" runat="server" Alignment="Left">
                <mdf:DdsButton ID="DdsButton1" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F3" Text="End" />
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment2" runat="server" Alignment="Center">
                <span class="PanelTitle" >Customer List</span>
            </mdf:DdsBarSegment>

            <mdf:DdsBarSegment ID="rightFiller" runat="server" Alignment="Right">
            </mdf:DdsBarSegment>
        </mdf:DdsBar>


        <!--
        <div style="text-align:center;">
        Customer list 
        </div>
        -->

        <mdf:DdsButton ID="DdsButton3" runat="server" Text="Next" CssClass="NavButton left-most-button" AidKey="F5"/>

        <br />            
        <mdf:DdsList ID="DdsList1" runat="server" ClearIndicator="99" CssClass="DdsList" CssClassChevron="DdsListChevron"
                     CssClassDetail="DdsListDetail" CssClassImage="DdsListImage" CssClassList="DdsListList" 
                     DetailField="CSTDTL" DetailFieldLength="50" IconColor="Red" NavigableField="*True" SelectChevronKey="F4" 
                     SelectedField="CSTSEL" SelectItemKey="F1" SubfileControlName="CSTCTRL" TextField="CSTTXT" TextFieldLength="70" 
                     ValueField="CSTVAL" ValueFieldLength="30" SortItems="Descending" SubfileName="CSTSBF" />
        <mdf:DdsCharField ID="DdsCharField4" runat="server" Alias="MOREROWS" CssClass="small-text" Usage="OutputOnly" />
        <br/>
    </mdf:DdsRecord>

    <mdf:DdsRecord id="_CUSTINFO" runat="server" style="position: relative;" Alias="CUSTINFO" CssClass="DdsRecord" 
        NavigationBarControlID="InfoNavBar" FuncKeys="F1 *None;F2 *None;F8 *None;" EraseFormats="*ALL" >

        <mdf:DdsBar ID="InfoNavBar" runat="server" CssClass="DdsBar">
            <mdf:DdsBarSegment ID="DdsBarSegment3" runat="server" Alignment="Left">
                <mdf:DdsButton ID="DdsButton2" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F2" Text="Back" />
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment5" runat="server" Alignment="Center">
                <span class="PanelTitle" >Customer Info</span>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment4" runat="server" Alignment="Right">
            </mdf:DdsBarSegment>
        </mdf:DdsBar>

        <br />
        
        <mdf:DdsCharField ID="DdsCharField3" runat="server" CssClass="DdsCharField" Alias="CUSTKEY" Usage="OutputOnly" Length="50" />
        
        <%--
        <br />
        <br />

        <mdf:DdsCharField ID="DdsCharField5" runat="server" CssClass="DdsCharField" Alias="CUST_NAME" Usage="OutputOnly" Length="40" />
        <br />

        --%>
        <br />
        <mdf:DdsCharField ID="DdsCharField5" runat="server" Alias="CMNAME" CssClass="DdsCharField" Length="40" Lower="True" Width="280px" />
        <br />

        <br />
        <mdf:DdsCharField ID="DdsCharField7" runat="server" Alias="CMADDR1" CssClass="DdsCharField" Length="35" Width="280px" />
        <br />

        <br />
        <mdf:DdsCharField ID="DdsCharField8" runat="server" Alias="CMCITY" CssClass="DdsCharField" Length="30" Width="280px" />
        <br />

        <br />
        <mdf:DdsCharField ID="DdsCharField9" runat="server" Alias="CMSTATE" CssClass="DdsCharField" Length="2" />
        <br />

        <br />
        <mdf:DdsCharField ID="DdsCharField10" runat="server" Alias="CMPOSTCODE" CssClass="DdsCharField" Length="10" />
        <br />


        <br />
        <mdf:DdsButton ID="DdsButton4" runat="server" Text="OK" CssClass="NavButton left-most-button" AidKey="F8" />
        <mdf:DdsButton ID="DdsButton5" runat="server" Text="Cancel" CssClass="NavButton left-most-button" AidKey="F2" />
        <br />
        <br />
   </mdf:DdsRecord>

    <mdf:DdsRecord id="_CustMap" runat="server" style="position: relative;" Alias="CUSTMAP" CssClass="DdsRecord" 
        NavigationBarControlID="MapNavBar" FuncKeys="F1 *None;F2 *None;F8 *None;" EraseFormats="*ALL" >

        <mdf:DdsBar ID="MapNavBar" runat="server" CssClass="DdsBar">
            <mdf:DdsBarSegment ID="DdsBarSegment6" runat="server" Alignment="Left">
                <mdf:DdsButton ID="DdsButton6" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F2" Text="Back" />
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment7" runat="server" Alignment="Center">
                <span class="PanelTitle" >Customer Map</span>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment8" runat="server" Alignment="Right">
            </mdf:DdsBarSegment>
        </mdf:DdsBar>

        <br />
       
        <mdf:DdsCharField ID="DdsCharField12" runat="server" Alias="CMNAME" CssClass="small-text" Length="40" Lower="True" Width="373px" Usage="OutputOnly" />
        <br />

        <mdf:DdsCharField ID="DdsCharField13" runat="server" Alias="CSZ" CssClass="small-text" Length="60" Width="375px" Usage="OutputOnly" />
        <br />
        <br />

        <mdf:DdsGMap ID="DdsGMap1" runat="server" AddressField="Location" AddressFieldLength="60" 
                     ClearIndicator="99" SubfileControlName="MapCtrl" SubfileName="MapSbf" Height="250px" Width="300px" />

        <br />
        <mdf:DdsButton ID="DdsButton7" runat="server" Text="OK" CssClass="NavButton left-most-button" AidKey="F8" />
        <br />
        <br />
   </mdf:DdsRecord>


</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageScriptPH"  >
    <script type="text/javascript" >
    </script>  
</asp:Content>
