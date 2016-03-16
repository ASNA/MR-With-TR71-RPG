<%@ Page Language="AVR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<script runat="server">
    BegSr Page_Load Access(*Private) Event( *This.Load )
        DclSrParm sender Type(*Object)
        DclSrParm e Type(System.EventArgs)

        DclFld ds     Type( System.Data.DataSet ) 
        DclFld device Type( ASNA.Monarch.WebDevice ) 
        DclFld gv     Type( GridView ) 
        DclFld lit    Type( Literal ) 
                
        // Get a reference to the ASNA.Monarch.WebDevice resident in a session variable.
        device = Session[ "device" ] *As ASNA.Monarch.WebDevice

        // Get that device's dataset.
        ds = device.ActiveDisplayFile.DataSet       
        
        // Traverse over each table in that dataset.
        ForEach dt Type( System.Data.DataTable ) Collection( ds.Tables )
            lit = *new Literal()
            lit.Text = "<div class='tableName'>Display file/format: " + device.ActiveDisplayFile.FileName.Trim() + "/" + dt.TableName + "</div>"
            panel1.Controls.Add( lit )             

            If ( dt.Rows.Count > 0 ) 
                gv = *New GridView()
                gv.DataSource = dt
                gv.DataBind()         
                panel1.Controls.Add( gv ) 
            Else
                lit = *new Literal()
                lit.Text = "Nothing to display."
                panel1.Controls.Add( lit )             
            EndIf                
        EndFor
    EndSr
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Show display file data</title>
    
    <style type="text/css">
        body
        {
            font-family: Tahoma,Verdana, Arial, Helvetica, sans-serif;
            color: Black;
        }
      
        div.tableName
        {
            font-size: large;
            margin-top: 20px;
        }
      
        table
        {
            font-size:small;
        }
        
        table tr td 
        {
            text-align: right;
            padding-right: 3px;
        }
       
        .optionIndicatorsDisplay, .responseIndicatorsDisplay
        {
            cursor:pointer;
        }
       
        .indValue
        {           
           width: 80px;          
           border: solid black 1px;
        }
		
		.indicatorOn
		{
			background-color: #66FF66;
		}
       
        .jqifade{
              position: absolute;
              background-color: #aaaaaa;
        }
        div.jqi
        {
              width: 70%;
              font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
              position: absolute;
              background-color: #ffffff;
              font-size: 11px;
              text-align: left;
              border: solid 1px #eeeeee;
              -moz-border-radius: 10px;
              -webkit-border-radius: 10px;
              padding: 7px;
        }
        div.jqi .jqicontainer{
              font-weight: normal;
        }
        div.jqi .jqiclose{
              position: absolute;
              top: 4px; right: -2px;
              width: 18px;
              cursor: default;
              color: #bbbbbb;
              font-weight: bold;
        }
        div.jqi .jqimessage{
              padding: 10px;
              line-height: 20px;
              color: #444444;
        }
        div.jqi .jqibuttons{
              text-align: right;
              padding: 5px 0 5px 0;
              border: solid 1px #eeeeee;
              background-color: #f4f4f4;
        }
        div.jqi button{
              padding: 3px 10px;
              margin: 0 10px;
              background-color: #2F6073;
              border: solid 1px #f4f4f4;
              color: #ffffff;
              font-weight: bold;
              font-size: 12px;
        }
        div.jqi button:hover{
              background-color: #728A8C;
        }
        div.jqi button.jqidefaultbutton{
              background-color: #BF5E26;
        }
        .jqiwarning .jqi .jqibuttons{
              background-color: #BF5E26;
        }       
    </style>
<script type="text/javascript" src="<%=Page.ResolveUrl("~")%>Themes/Current/Scripts/jquery.min.js"></script>
  
<script type="text/javascript">

/*
 * jQuery Impromptu
 * By: Trent Richardson [http://trentrichardson.com]
 * Version 2.7
 * Last Modified: 6/7/2009 
 *
 * Copyright 2009 Trent Richardson
 * Dual licensed under the MIT and GPL licenses.
 * http://trentrichardson.com/Impromptu/GPL-LICENSE.txt
 * http://trentrichardson.com/Impromptu/MIT-LICENSE.txt
 *
 */
(function($){$.prompt=function(message,options){options=$.extend({},$.prompt.defaults,options);$.prompt.currentPrefix=options.prefix;var ie6=false;var $body=$(document.body);var $window=$(window);var msgbox='<div class="'+options.prefix+'box" id="'+options.prefix+'box">';if(options.useiframe&&(($('object, applet').length>0)||ie6)){msgbox+='<iframe src="javascript:false;" style="display:block;position:absolute;z-index:-1;" class="'+options.prefix+'fade" id="'+options.prefix+'fade"></iframe>';}else{if(ie6){$('select').css('visibility','hidden');}msgbox+='<div class="'+options.prefix+'fade" id="'+options.prefix+'fade"></div>';}msgbox+='<div class="'+options.prefix+'" id="'+options.prefix+'"><div class="'+options.prefix+'container"><div class="';msgbox+=options.prefix+'close">X</div><div id="'+options.prefix+'states"></div>';msgbox+='</div></div></div>';var $jqib=$(msgbox).appendTo($body);var $jqi=$jqib.children('#'+options.prefix);var $jqif=$jqib.children('#'+options.prefix+'fade');if(message.constructor==String){message={state0:{html:message,buttons:options.buttons,focus:options.focus,submit:options.submit}};}var states="";$.each(message,function(statename,stateobj){stateobj=$.extend({},$.prompt.defaults.state,stateobj);message[statename]=stateobj;states+='<div id="'+options.prefix+'_state_'+statename+'" class="'+options.prefix+'_state" style="display:none;"><div class="'+options.prefix+'message">'+stateobj.html+'</div><div class="'+options.prefix+'buttons">';$.each(stateobj.buttons,function(k,v){states+='<button name="'+options.prefix+'_'+statename+'_button'+k+'" id="'+options.prefix+'_'+statename+'_button'+k+'" value="'+v+'">'+k+'</button>';});states+='</div></div>';});$jqi.find('#'+options.prefix+'states').html(states).children('.'+options.prefix+'_state:first').css('display','block');$jqi.find('.'+options.prefix+'buttons:empty').css('display','none');$.each(message,function(statename,stateobj){var $state=$jqi.find('#'+options.prefix+'_state_'+statename);$state.children('.'+options.prefix+'buttons').children('button').click(function(){var msg=$state.children('.'+options.prefix+'message');var clicked=stateobj.buttons[$(this).text()];var forminputs={};$.each($jqi.find('#'+options.prefix+'states :input').serializeArray(),function(i,obj){if(forminputs[obj.name]===undefined){forminputs[obj.name]=obj.value;}else if(typeof forminputs[obj.name]==Array){forminputs[obj.name].push(obj.value);}else{forminputs[obj.name]=[forminputs[obj.name],obj.value];}});var close=stateobj.submit(clicked,msg,forminputs);if(close===undefined||close){removePrompt(true,clicked,msg,forminputs);}});$state.find('.'+options.prefix+'buttons button:eq('+stateobj.focus+')').addClass(options.prefix+'defaultbutton');});var ie6scroll=function(){$jqib.css({top:$window.scrollTop()});};var fadeClicked=function(){if(options.persistent){var i=0;$jqib.addClass(options.prefix+'warning');var intervalid=setInterval(function(){$jqib.toggleClass(options.prefix+'warning');if(i++>1){clearInterval(intervalid);$jqib.removeClass(options.prefix+'warning');}},100);}else{removePrompt();}};var keyPressEventHandler=function(e){var key=(window.event)?event.keyCode:e.keyCode;if(key==27){removePrompt();}if(key==9){var $inputels=$(':input:enabled:visible',$jqib);var fwd=!e.shiftKey&&e.target==$inputels[$inputels.length-1];var back=e.shiftKey&&e.target==$inputels[0];if(fwd||back){setTimeout(function(){if(!$inputels)return;var el=$inputels[back===true?$inputels.length-1:0];if(el)el.focus();},10);return false;}}};var positionPrompt=function(){$jqib.css({position:(ie6)?"absolute":"fixed",height:$window.height(),width:"100%",top:(ie6)?$window.scrollTop():0,left:0,right:0,bottom:0});$jqif.css({position:"absolute",height:$window.height(),width:"100%",top:0,left:0,right:0,bottom:0});$jqi.css({position:"absolute",top:options.top,left:"50%",marginLeft:(($jqi.outerWidth()/2)*-1)});};var stylePrompt=function(){$jqif.css({zIndex:options.zIndex,display:"none",opacity:options.opacity});$jqi.css({zIndex:options.zIndex+1,display:"none"});$jqib.css({zIndex:options.zIndex});};var removePrompt=function(callCallback,clicked,msg,formvals){$jqi.remove();if(ie6){$body.unbind('scroll',ie6scroll);}$window.unbind('resize',positionPrompt);$jqif.fadeOut(options.overlayspeed,function(){$jqif.unbind('click',fadeClicked);$jqif.remove();if(callCallback){options.callback(clicked,msg,formvals);}$jqib.unbind('keypress',keyPressEventHandler);$jqib.remove();if(ie6&&!options.useiframe){$('select').css('visibility','visible');}});};positionPrompt();stylePrompt();if(ie6){$window.scroll(ie6scroll);}$jqif.click(fadeClicked);$window.resize(positionPrompt);$jqib.bind("keydown keypress",keyPressEventHandler);$jqi.find('.'+options.prefix+'close').click(removePrompt);$jqif.fadeIn(options.overlayspeed);$jqi[options.show](options.promptspeed,options.loaded);$jqi.find('#'+options.prefix+'states .'+options.prefix+'_state:first .'+options.prefix+'defaultbutton').focus();if(options.timeout>0)setTimeout($.prompt.close,options.timeout);return $jqib;};$.prompt.defaults={prefix:'jqi',buttons:{Ok:true},loaded:function(){},submit:function(){return true;},callback:function(){},opacity:0.6,zIndex:999,overlayspeed:'slow',promptspeed:'fast',show:'fadeIn',focus:0,useiframe:false,top:"15%",persistent:true,timeout:0,state:{html:'',buttons:{Ok:true},focus:0,submit:function(){return true;}}};$.prompt.currentPrefix=$.prompt.defaults.prefix;$.prompt.setDefaults=function(o){$.prompt.defaults=$.extend({},$.prompt.defaults,o);};$.prompt.setStateDefaults=function(o){$.prompt.defaults.state=$.extend({},$.prompt.defaults.state,o);};$.prompt.getStateContent=function(state){return $('#'+$.prompt.currentPrefix+'_state_'+state);};$.prompt.getCurrentState=function(){return $('.'+$.prompt.currentPrefix+'_state:visible');};$.prompt.getCurrentStateName=function(){var stateid=$.prompt.getCurrentState().attr('id');return stateid.replace($.prompt.currentPrefix+'_state_','');};$.prompt.goToState=function(state){$('.'+$.prompt.currentPrefix+'_state').slideUp('slow');$('#'+$.prompt.currentPrefix+'_state_'+state).slideDown('slow',function(){$(this).find('.'+$.prompt.currentPrefix+'defaultbutton').focus();});};$.prompt.nextState=function(){var $next=$('.'+$.prompt.currentPrefix+'_state:visible').next();$('.'+$.prompt.currentPrefix+'_state').slideUp('slow');$next.slideDown('slow',function(){$next.find('.'+$.prompt.currentPrefix+'defaultbutton').focus();});};$.prompt.prevState=function(){var $next=$('.'+$.prompt.currentPrefix+'_state:visible').prev();$('.'+$.prompt.currentPrefix+'_state').slideUp('slow');$next.slideDown('slow',function(){$next.find('.'+$.prompt.currentPrefix+'defaultbutton').focus();});};$.prompt.close=function(){$('#'+$.prompt.currentPrefix+'box').fadeOut('fast',function(){$(this).remove();});};})(jQuery);
</script>
  
<script type="text/javascript">  
    $(document).ready(function(){

       $( "body" ).prepend("<div>Click any indicator to see the indicator value table. <a id='anchorRefresh' href='#'>Refresh page</a>.</div>");

       $( "#anchorRefresh" ).click( function()
    {
        window.location.reload( true );
    })

    // Find the last TD of every TR and add a class name.
    $("table tr").each(function () {
        var i = 0;

        $(this).find("td:gt(-3)").each(function () {
            if (!i) {
                $(this).addClass("optionIndicatorsDisplay");
            }
            else {
                $(this).addClass("responseIndicatorsDisplay");
            }

            i++;
        });
    })

    $(".optionIndicatorsDisplay").click(function () {
	var indicators = $(this).html();
	var html = writeIndicatorsHtml(indicators, 'Option Indicator values');
	$.prompt(html);
    });

    $(".responseIndicatorsDisplay").click(function () {
	var indicators = $(this).html();
	var html = writeIndicatorsHtml(indicators, 'Response Indicator values<br/>"x" means: will not change indicator');
	$.prompt(html);
    });

 });
 
 function writeIndicatorsHtml( indicators, title )
 {
    var i;
    var html = "<br/>" + title + "</br>"
	html = html + "<table style='border-collapse:collapse;font-size:small;width=96%'><tr>";
    var counter = 0;
    for ( i = 0; i<= 99; i++ )
    {
        if ( i % 10 == 0 && i != 0 )
        {
            html = html + "</tr><tr>";
        }
		if ( indicators.substring( i, i + 1 ) == "1" ) 
		{
			html = html + "<td class=\"indValue indicatorOn\">" + i + " = " + indicators.substring( i, i + 1 ) + "</td>";
		}
		else
		{
			html = html + "<td class=\"indValue\">" + i + " = " + indicators.substring( i, i + 1 ) + "</td>";
		}			
    }
    html = html + "</tr></table>";
    return html;
 }
 
 </script>     
    
    
</head>
<body>
    <div>    
        <form id="form1" runat="server">
            <asp:Panel ID="Panel1" runat="server" 
                style="z-index: 1; left: 10px; top: 34px; position: absolute; height: 19px; width: 1573px">
            </asp:Panel>
        </form>
    </div>
</body>
</html>
