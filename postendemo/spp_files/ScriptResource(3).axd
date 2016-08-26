if(typeof PostNord=="undefined")window.PostNord={};if(typeof PostNord.Common=="undefined")window.PostNord.Common={};if(typeof PostNord.Common.Login=="undefined")window.PostNord.Common.Login={};PostNord.Common.Login=new function(){var c=this,g="",f=false,d,a,b,e=null,h=c;c.Init=function(h){var c=".loginNavigationItem";g=h;b=jQuery(c);d=jQuery(b).find("#LoginFrame");a=jQuery("[id$='loginInfoContainer']");e=jQuery("#LoginErrorMessage");var f=a.is(":visible");if(f)jQuery(c).hide();else i()};c.Success=function(c){if(c.length>0){j(c);b.hide();a.find("> *").hide();openDropDown(b);a.show()}else{b.show();a.hide()}};c.Failed=function(){d.attr("src","");f=false;d.hide();e.show()};c.SetLoginFrame=function(){if(!f&&b.hasClass("active")){e.hide();d.attr("src",g);f=true;d.show()}};c.ReadAuthCookie=function(b,c){var a=k(b);if(a.length>0)h.Success(a);else c&&h.DisplayLogoutOnly()};c.DisplayLogoutOnly=function(){b.show();a.show();a.find("> *").hide();a.find(".logout").show()};function j(b){a.find("a[class='theme']").each(function(){var a=jQuery(this),c=a.text();switch(c){case "{Username}":a.text(b);a.attr("href","#");break;case "{Organization}":a.text("");a.attr("href","#")}})}function i(){var a=".loginNavigationItem > a";jQuery(a).click(PostNord.Common.Login.SetLoginFrame);jQuery(a).hover(PostNord.Common.Login.SetLoginFrame)}function k(e){for(var c,d,b=document.cookie.split(";"),a=0;a<b.length;a++){c=b[a].substr(0,b[a].indexOf("="));d=b[a].substr(b[a].indexOf("=")+1);c=c.replace(/^\s+|\s+$/g,"");if(c==e)return unescape(d)}return ""}};window.PostNordCommonFlyouts=new function(){var c="onhiding",a="active",i="onshowing",b="flyoutTimeout",h=".showing",d=".active",g="focusFlyout",e=this,k=e;function f(a){return a.data(g)}function j(e,g){var c=f(e);if(jQuery(e).is(d)||jQuery(c).is(h)){var a=c.data(b);a&&window.clearTimeout(a);a=window.setTimeout(function(){k.hideFlyout(e);c.data(b,null)},g);c.data(b,a)}}e.cancelAutoFadeOut=function(c){var a=c.data(b);a&&window.clearTimeout(a)};e.showFlyout=function(c){var b=f(c);if(!(jQuery(c).is(d)||jQuery(b).is(h))){this.hideAllFlyouts();var e=jQuery(b).data(i);e&&e();jQuery(b).addClass("showing");jQuery(b).fadeIn("fast",function(){jQuery(c).addClass(a);jQuery(b).addClass(a).removeClass("showing")})}};e.hideFlyout=function(g){var e=f(g);if(jQuery(g).is(d)&&!jQuery(e).is(".hiding")){var i=jQuery(e).data(c);i&&i();jQuery(e).addClass("hiding");jQuery(e).fadeOut("fast",function(){jQuery(g).removeClass(a);jQuery(e).removeClass(a).removeClass("hiding")});var h=e.data(b);h&&window.clearTimeout(h)}};e.hideAllFlyouts=function(){jQuery("#GlobalMenu .dropDownFocus.active").removeClass(a);jQuery(".flyout-focus").each(function(){var h=jQuery(this),d=f(h),g=jQuery(d).data(c);g&&g();jQuery(d).hide();jQuery(h).removeClass(a);jQuery(d).removeClass(a);var e=d.data(b);e&&window.clearTimeout(e)})};e.addFlyout=function(f){var d="both",a=f.flyout,e=f.focus,h=f.timeout,b=f.timeoutBoundary,l=f.onhiding,k=f.onshowing;if(!b)b=d;a.addClass("flyout");e.addClass("flyout-focus");e.data(g,a);l&&jQuery(a).data(c,l);k&&jQuery(a).data(i,k);if(h){if(b=="focus"||b==d){jQuery(e).mouseleave(function(){j(e,h)});jQuery(e).mouseenter(function(){PostNordCommonFlyouts.cancelAutoFadeOut(jQuery(a));return false})}if(b=="flyout"||b==d){jQuery(a).mouseleave(function(){j(e,h)});jQuery(a).mouseenter(function(){PostNordCommonFlyouts.cancelAutoFadeOut(jQuery(a));return false})}}}};function escapeRegExp(a){return a.replace(/([.*+?^=!:${}()|\[\]\/\\])/g,"\\$1")}function setupPortalNavigation(){if(jQuery("#TopBar #TopMenu a.selected").length>0)return;var d=window.location.pathname.replace(new RegExp(escapeRegExp("//"),"g"),"/"),b=window.location.href.replace(new RegExp(escapeRegExp("//"),"g"),"/");b=b.replace(new RegExp(escapeRegExp(":/"),"g"),"://");var e=jQuery("#GlobalMenu");if(e.find("div.globalnavcurrentactive").length>0)return;for(var f=e.find("div.dropDownFocus a"),a="",c=0;c<f.length;c++){var g=jQuery(f[c]);a=g.attr("href");if(a&&a.length>3){a=a.replace(new RegExp(escapeRegExp("//"),"g"),"/").replace(new RegExp(escapeRegExp(":/"),"g"),"://");if(a.endsWith(d)||d.startsWith(a)||b.startsWith(a)){g.closest("div.dropDownFocus").addClass("globalnavcurrentactive");break}}}}PortalNavigationUserPanel=function(a){var b="#UserInfo";if(a.length<1)return;jQuery(b).length>0&&jQuery(b).html(a).attr("title",a);jQuery("#WelcomePnl").show();jQuery("#Login").hide()};jQuery(function(){jQuery(".accordion .menu a").click(function(){var a="active",c=":visible",b=jQuery(this).closest("li"),d=jQuery(".quickFinder .PWP-inputWrapper.button"),e=[];d.each(function(){if(jQuery(this).is(c)){jQuery(this).hide();e.push(this)}});b.siblings("li:not(.menu)").slideUp(400,function(){jQuery.each(d,function(){jQuery(this).show()})});b.siblings("li").removeClass(a);if(b.next().is(c))b.removeClass(a);else{b.next().slideDown();b.addClass(a)}return false})});var g_searchtype="";function ValidateForm(){var c=false,b="",a=document.forms[0];if(a.streetName.value==b&&a.number.value==b&&a.letter.value==b&&a.placeName.value==b&&a.zipcode.value==b&&a.cityName.value==b){alert("Et eller flere af felterne skal udfyldes inden s\u00f8gning startes");a.streetName.focus();return c}if(a.number.value!="Husnr")if(a.number.value!=b&&a.number.value.match(/^\d{1,5}$/)==null){alert("Husnummer skal kun best\u00e5 af 1 - 5 cifre");a.number.select();return c}if(a.letter.value!=b&&a.letter.value!="Bogstav"){var d=/^[a-z\u00e6\u00f8\u00e5]$/i,e=d.test(a.letter.value);if(!e){alert("Husbogstav m\u00e5 kun best\u00e5 af bogstaver");a.letter.select();return c}if(a.number.value==b){alert("Husnummer skal udfyldes, n\u00e5r husbogstav er udfyldt.");a.number.select();return c}}if(a.letter.value!=b&&a.number.value==b&&a.streetName.value==b||a.letter.value==b&&a.number.value!=b&&a.streetName.value==b||a.letter.value!=b&&a.number.value!=b&&a.streetName.value==b){alert("Gadenavn, husnummer og husbogstav skal alle udfyldes");a.streetName.select();return}if(a.streetName.value!=b||a.placeName.value!=b)g_searchtype="street";if(a.cityName.value!=b)if(a.streetName.value==b)if(a.placeName.value==b)g_searchtype="cityToZip";if(a.cityName.value!=b&&a.zipcode.value!=b)g_searchtype="street";return true}function ZipCodeRedirectToIframe(i,d,h,e,j,c,f,g){var b=false;if(ValidateForm()){var a=document.forms[0];SetDefaultText(a.streetName,"Gade",b);SetDefaultText(a.number,"Husnr",b);SetDefaultText(a.letter,"Bogstav",b);SetDefaultText(a.placeName,"Stednavn",b);SetDefaultText(a.cityName,"By",b);fullUrl=i+"?"+d+"="+h+"&"+c+"="+f+"&searchType="+g_searchtype+"&"+e+"="+j;fullUrl=fullUrl+"&zipcode="+a.zipcode.value+"&streetName="+a.streetName.value+"&number="+a.number.value+"&letter="+a.letter.value+"&placeName="+a.placeName.value+"&cityName="+a.cityName.value+"&__method=GET&_cos2fields="+d+","+e+","+c+",zipcode,streetName,number,letter,placeName,cityName";if(g)window.open(fullUrl);else document.location=fullUrl}}function SetDefaultText(a,b,c){if(c){if(a.value=="")a.value=b}else if(a.value==b)a.value=""}function ShowHideHelp(c){var b="track_trace_main",a="track_trace_help";if(c){document.getElementById(a).style.display="block";document.getElementById(b).style.display="none"}else{document.getElementById(a).style.display="none";document.getElementById(b).style.display="block"}}var _TRACK_TRACE_POST_URL="";function GetTrackingId(){return GetTextBoxElement("txtTrackingId")}function GetTextBoxElement(a){return document.getElementById(a).value}function OpenWindow(c,b){var a="&__method=GET";UpdateUrl();if(b)window.open(_TRACK_TRACE_POST_URL+a);else document.location=_TRACK_TRACE_POST_URL+a}function PostIndlandUdland(e,a,c,f,b,d){_TRACK_TRACE_POST_URL=e+"?"+a+"="+GetTrackingId()+"&"+c+"="+f+"&"+b+"="+d+"&_cos2fields="+a+","+c+","+b;document.getElementById("txtTrackingId").value="Indtast forsendelsesnummer";ToggleDiv("indland_help","udland_help,postexpres_help,reference_help");Toggle_lblIndlandHeader(true)}function PostKurerUdland(d,c,f,a,e,b){_TRACK_TRACE_POST_URL=d+"?"+c+"="+f+"&"+a+"="+e+"&"+b+"="+GetTrackingId()+"&_cos2fields="+c+","+a+","+b;ToggleDiv("indland_help","udland_help,postexpres_help,reference_help");document.getElementById("txtTrackingId").value="";ToggleDiv("udland_help","indland_help,postexpres_help,reference_help");Toggle_lblIndlandHeader(false)}function PostExpress(e,b,c,f,a,d){_TRACK_TRACE_POST_URL=e+"?"+b+"="+GetTrackingId()+"&"+c+"="+f+"&"+a+"="+d+"&_cos2fields="+b+","+c+","+a;ToggleDiv("postexpres_help","udland_help,indland_help,reference_help");document.getElementById("txtTrackingId").value="Indtast stregkodenummer";Toggle_lblIndlandHeader(false)}function PostReference(f,c,d,g,b,e,a){_TRACK_TRACE_POST_URL=f+"?"+a+"="+GetTextBoxElement("txtCustomerNumber")+"&"+d+"="+g+"&"+b+"="+e+"&"+c+"="+GetTextBoxElement("txtRereference")+"&_cos2fields="+c+","+d+","+b+","+a;ToggleDiv("reference_help","udland_help,indland_help,postexpres_help");document.getElementById("txtTrackingId").value="";Toggle_lblIndlandHeader(false)}function SetInputForm(c){var b="ByReference",a="TrackbyId";if(c.id!="rbtnReference"){document.getElementById(a).style.display="inline";document.getElementById(b).style.display="none"}else{document.getElementById(a).style.display="none";document.getElementById(b).style.display="inline"}ResetForm(c)}function UpdateUrl(){for(var c=["rbtnDestination","rbtnCourierAbroad","rbtnPostExpres","rbtnReference"],b=0;b<c.length;b++){var a=document.getElementById(c[b]);if(a!=null)a.checked&&a.click()}}function ToggleDiv(e,d){if(b!="")for(var b=e.split(","),a=0;a<b.length;a++)if(document.getElementById(b[a])!=null)document.getElementById(b[a]).style.display="inline";if(c!="")for(var c=d.split(","),a=0;a<c.length;a++)if(document.getElementById(c[a])!=null)document.getElementById(c[a]).style.display="none"}function Toggle_lblIndlandHeader(c){var a="lblIndlandHeader",b=document.getElementById(a);if(b!=null)if(c)document.getElementById(a).style.display="inline";else document.getElementById(a).style.display="none"}jQuery(function(){ToggleDiv("indland_help","udland_help,postexpres_help,reference_help")});function SetDefaultText(a,b,c){if(c){if(a.value=="")a.value=b}else if(a.value==b)a.value=""}function SearchPrice(){EnsureValidValues();document.forms[0].triggerEvent.value="NY"}function SetFormAction(d,c){var b="rbtnBrev_div",a="rbtnPakke_div";document.forms[0].action=d;if(c.id+"_div"==a){document.getElementById(a).style.display="inline";document.getElementById(b).style.display="none"}else{document.getElementById(a).style.display="none";document.getElementById(b).style.display="inline"}document.forms[0].btnFindPrisen.onclick="WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;btnFindPrisen&quot;, &quot;&quot;, true, &quot;&quot;, document.forms[0].action, false, false));";ResetForm(c);EnsureValidValues();document.forms[0].triggerEvent.value="NY"}function EnsureValidValues(){if(document.forms[0].rbtnBrev.checked){document.forms[0].skift[0].value="breve";document.forms[0].typeID.value="1";document.forms[0]._cos2fields.value="gadgetMode,fakePO,triggerEvent,sprog,skift,typeID,vaegtID,brevPriszoneID"}else{document.forms[0].skift[1].value="pakke";document.forms[0].typeID.value="0";document.forms[0]._cos2fields.value="gadgetMode,triggerEvent,sprog,skift,typeID,vaegtID,pakkevaegtID,destinationID"}}jQuery(function(){if(jQuery(".quickFinderFooter .ms-SPZoneLabel").length==0){jQuery(".quickFinderFooter .campaign").addClass("campaign-viewmode");jQuery(".quickFinderFooter .campaign img").addClass("campaignimage-viewmode");Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function(){var a=jQuery(".quickFinderFooter .campaign-viewmode DIV.module").height();jQuery(".quickFinderFooter DIV.campaign.campaign-viewmode").first().css("height",a).css("bottom","-1px")})}else jQuery(".quickFinderFooter DIV.module").addClass("box");jQuery("#QuickFinder").find("input[type='text'], textarea").each(function(){jQuery(this).keypress(function(a){if((a.which?a.which:a.keyCode)==13){a.preventDefault();if(jQuery())var b=jQuery(this).parents("li").find(":submit, :button");b.click()}})})});var aspnetform=document.forms[0];function RedirectToLocationFinderIFrame(j,e,c,d,b,i,f,g,h){var k=encodeURIComponent(document.getElementById(h).value),a=j+"?"+e+"="+c+"&"+d+"="+b+"&"+i+"="+k+"&pstrAction=Find&"+f+"=&_cos2fields=city,overskrift,searchtype&__method=GET";if(g)window.open(a);else document.location=a}function RemoveFindPostenFields(){jQuery(".findposten_servicestallen").remove();jQuery(".findposten_soktext").remove();jQuery(".findposten_valj").remove()}function RemoveSokBrevladaFields(){jQuery(".sokbrevlada_brevlador").remove();jQuery(".sokbrevlada_soktext").remove();jQuery(".sokbrevlada_valj").remove()}function ResetForm(d){var e=null,b="class",h="radio";if(d.type==h&&d.checked&&d.defaultChecked)return;var f=d;if(d.type==h)f=document.getElementById(d.id).parentNode;var g="";if(f.attributes[b]!=e&&f.attributes[b].value!=undefined&&f.attributes[b].value!=""){var j=f.attributes[b].value.split(" ");for(i=0;i<j.length;i++)if(j[i].indexOf("reset_except_")!=-1){g=j[i];break}}var a=jQuery("input");if(a!=undefined&&a.length>0)for(i=0;i<a.length;i++)if(a[i].type=="text"){if(a[i].attributes[b]!=e&&a[i].attributes[b].value.indexOf(g)==-1){a[i].value=a[i].defaultValue;a[i].onblur!=e&&a[i].onblur!=""&&SetDefaultText(a[i],a[i].defaultValue,true)}}else if(a[i].type==h)if(a[i].parentNode.attributes[b]!=e&&a[i].parentNode.attributes[b].value.indexOf(g)==-1&&a[i].parentNode.attributes[b].value.indexOf("group_default")!=-1){a[i].checked=true;a[i].click()}var c=document.getElementsByTagName("select");if(c!=undefined&&c.length>0)for(i=0;i<c.length;i++)if(c[i].attributes[b]!=e&&c[i].attributes[b].value.indexOf(g)==-1&&c[i].options.length>0)if(c[i].id=="brevPriszoneID"||c[i].id=="destinationID")c[i].selectedIndex=47;else c[i].selectedIndex=0}function HandleTrackTraceSubmitOnEnter(){var a="#btnFind",d="#txtRereference",c="#txtCustomerNumber",b="#txtTrackingId";$(b).focus(function(){var a=this;if(a.value=="Indtast forsendelsesnummer")a.value="";if(a.value=="Indtast stregkodenummer")a.value=""});$(c).focus(function(){if(this.value=="Indtast kundenummer")this.value=""});$(d).focus(function(){if(this.value=="Indtast reference")this.value=""});$(b).keydown(function(c){if(!c)var c=window.event;var d=c.keyCode||c.which;if(d==13){$(b).blur();setTimeout(function(){$(a).click()},0);if(c.preventDefault)c.preventDefault();else c.returnValue=false}});$(c).keydown(function(b){if(!b)var b=window.event;var c=b.keyCode||b.which;if(c==13){$(a).click();if(b.preventDefault)b.preventDefault();else b.returnValue=false}});$(d).keydown(function(b){if(!b)var b=window.event;var c=b.keyCode||b.which;if(c==13){$(a).click();if(b.preventDefault)b.preventDefault();else b.returnValue=false}})}if(typeof PostNord=="undefined")window.PostNord={};if(typeof window.PostNord.Common=="undefined")window.PostNord.Common={};window.PostNord.Common.GlobalSearchRequestHandler=null;function dosearch(){if(this.doSearchFlag)return;document.forms[1].k.value=document.getElementById("forGlobalSearch").value;this.doSearchFlag=true;document.forms[1].submit()}function extendeddosearch(c){var b=jQuery(c);document.getElementById("forGlobalSearch").value=b.find("div").attr("threedots");var a=b.parents("#GlobalSearch");a.find("#forGlobalSearchSuggestion").hide();a.find("#indent").hide();dosearch()}function detectkey(a,b,c,d){if(!a)var a=window.event;var e=a.keyCode||a.which;if(e==13){dosearch();if(a.preventDefault)a.preventDefault();else a.returnValue=false}else b&&setTimeout(function(){var a=".indent",g=jQuery(c).val(),b=jQuery("#GlobalSearch"),f=b.find("#forGlobalSearchSuggestion"),e=f.find("#searchbody");if(g.length>=3){window.PostNord.Common.GlobalSearchRequestHandler!=null&&window.PostNord.Common.GlobalSearchRequestHandler.readyState!=4&&window.PostNord.Common.GlobalSearchRequestHandler.abort();window.PostNord.Common.GlobalSearchRequestHandler=jQuery.ajax({async:true,dataType:"json",cache:false,url:"/_vti_bin/PostNordCommon/httphandler/SearchSuggestion.ashx?locale="+d+"&keyword="+encodeURIComponent(g),success:function(g){var d=g.length;if(d>0){for(var c=0;c<d;c++)e.append('<li><a href="javascript:" onclick="extendeddosearch(this)"><div class="text_here"><span class="ellipsis_text">'+g[c].Keyword+"</span></div></a></li>");f.show();e.find(".text_here").ThreeDots({max_rows:2});b.children(a).show().width(b.width())}else f.fadeOut("fast",function(){b.children(a).hide();e.html("")})},error:function(){}});return}f.fadeOut("fast",function(){b.children(a).hide();e.html("")})},5)}window.PostNordIFrame=new function(){this.monitorResize=function(){var c="__action=",a="src",b="iframe.applicationFrame",d=jQuery(b),g,e;if(d.attr(a))e=d.attr(a).split("/")[0]+"//"+d.attr(a).split("/")[2];else{var f=jQuery(b).siblings("div").children(0).attr(a);iframe_action=f.substring(f.indexOf(c)+(new String(c)).length);e=iframe_action.split("/")[0]+"//"+iframe_action.split("/")[2]}jQuery.receiveMessage(function(b){var a=Number(b.data.replace(/.*if_height=(\d+)(?:&|$)/,"$1"));if(!isNaN(a)&&a==0)jQuery("#s4-workspace")[0].scrollTop=0;!isNaN(a)&&a>0&&a!==g&&d.height(g=a)},e)}};function ExecuteLink(a,b){if(b=="True")window.open(a,"_blank");else window.location.href=a}if(typeof PostNord=="undefined")window.PostNord={};if(typeof PostNord.Common=="undefined")window.PostNord.Common={};window.PostNord.Common.TabWidget=function(b){var d="isBlank",c=this,a=c;c.tabCount=-1;c.MAX_TAB_COUNT=b.maxTabCount;c._addElement=null;c._allTabHandles=null;c._allTabContentPanels=null;c._tabElemGroups=[];c.updateAddVisibility=function(){var a=this;if(a.tabCount==a.MAX_TAB_COUNT)a._addElement.hide();else a._addElement.show()};c.showTab=function(b){var a=this._tabElemGroups[b-1];a.handle.show();a.handleLink.click()};c.syncTabName=function(g){var a=this._tabElemGroups[g-1];if(b.editMode){var c=a.nameInput.val(),f=a.handleLink.text();if(!a.handleLink.data(d)||c!=f){var e=c=="";a.handleLink.text(e?"-":c);a.handleLink.data(d,e?"yes":"no")}}else{var c=a.handleLink.text().replace(/(\s|\u00A0)/g,""),e=""+c=="";a.handleLink.data(d,e?"yes":"no")}};c.removeTab=function(h){var d=this;for(var f=[],e=h;e<=d.MAX_TAB_COUNT;e++){var i=d._tabElemGroups[e-1];i.handle.is(":visible")&&f.push(e)}var b=[];for(var c in f){var e=f[c];b.push({tabNum:e,tabg:a._tabElemGroups[e-1]})}for(var c=0;c<b.length-1;c++){b[c].tabg.nameInput.val(b[c+1].tabg.nameInput.val());b[c].tabg.contentInput.val(b[c+1].tabg.contentInput.val());b[c].tabg.handleLink.text(b[c+1].tabg.handleLink.text())}var g=b[b.length-1];g.tabg.nameInput.val("");g.tabg.contentInput.val("");d._tabElemGroups[d.tabCount-1].handle.hide();d.tabCount--;g.tabNum==h&&d.showTab(h-1)};c.init=function(){var f="num",c=this;c._addElement=jQuery(b.tabAddSelector);c._allTabHandles=jQuery(b.tabSelector);c._allTabContentPanels=jQuery(b.tabContentSubSelector);for(var e=1;e<=c.MAX_TAB_COUNT;e++){var g={};g.handle=c._allTabHandles.eq(e-1);g.handleLink=jQuery("a",g.handle);g.contentPanel=jQuery(c._allTabContentPanels[e-1]);g.removeLink=jQuery(b.tabRemoveSubSelector,g.contentPanel);g.nameInput=jQuery(b.tabNameInputSubSelector,g.contentPanel);g.contentInput=jQuery(b.tabContentInputSubSelector,g.contentPanel);c._tabElemGroups.push(g)}for(var e=1;e<=c.MAX_TAB_COUNT;e++){var h=c._tabElemGroups[e-1];h.handleLink.data(f,e);h.handleLink.click(function(){var d=jQuery(this).data(f),c=a._tabElemGroups[d-1];a._allTabContentPanels.hide();a._allTabHandles.removeClass(b.selectedClass);c.contentPanel.show();c.handle.addClass(b.selectedClass)});h.removeLink.data(f,e);h.removeLink.click(function(){if(a.tabCount>1){var b=jQuery(this).data(f);a.removeTab(b);a.updateAddVisibility()}return false});h.nameInput.data(f,e);h.nameInput.keyup(function(){var b=jQuery(this).data(f);a.syncTabName(b)})}c._addElement.click(function(){if(a.tabCount<a.MAX_TAB_COUNT){a.tabCount++;a.showTab(a.tabCount);a.syncTabName(a.tabCount);a.updateAddVisibility()}return false});for(var e=1;e<=c.MAX_TAB_COUNT;e++){var h=c._tabElemGroups[e-1];c.syncTabName(e);var i;if(c.editMode)i=h.nameInput.val()==""&&h.contentInput.val()=="";else i=h.handleLink.data(d)=="yes";if(a.tabCount==-1&&i){a.tabCount=e-1;break}}if(c.tabCount==-1)c.tabCount=c.MAX_TAB_COUNT;if(c.tabCount==0)c.tabCount=1;c._allTabHandles.hide();for(var e=1;e<=c.tabCount;e++)c.showTab(e);c.showTab(1);if(b.editMode){c.updateAddVisibility();jQuery(b.tabRemoveSubSelector,c._allTabContentPanels).show()}else{c._addElement.hide();jQuery(b.tabRemoveSubSelector,c._allTabContentPanels).hide();c.tabCount==1&&c._allTabHandles.hide()}var j=0;c._allTabHandles.each(function(d,b){var a=jQuery("span",b),c=jQuery(b);a.height()>c.height()&&a.css("line-height","20px");if(a.text()!="")j+=1})}};(function(a){var d="disabled",e="select",h=".PWP-tooltipWrapper",g="center",f="undefined",c="checked",b=".PWP-inputWrapper",j=function(){var e=a(this),d=e.parent(b);if(e.prop(c))d.addClass(c);else d.removeClass(c)},i=function(){var e=a(this),d=e.parent(b);if(e.prop(c))d.addClass(c);else d.removeClass(c)},l=function(i){var c=this;i.preventDefault();var h=a(c),g=h.parent(b),d=g.children("input");if(typeof d.get()[0].Validators!==f)c.Validators=d.get()[0].Validators;d.click();a('.PWP-inputWrapper > input[name="'+d.attr("name")+'"]').each(function(){a(this).triggerHandler("change")});if(typeof c.Validators!==f)for(var e=0;e<c.Validators.length;e++)ValidatorEnable(c.Validators[e],c.Validators[e].enabled)},n=function(b){if(b.which=="32"){b.preventDefault();a(this).click()}},v=function(f){var b="active";f.preventDefault();var c=a(this),d=c.closest(".PWP-tabsWrapper"),g=a("#"+c.attr("rel"));d.find("> div, > ul > li").removeClass(b);c.parent().addClass(b);g.addClass(b);var e=d.find("> ul > li").index(c.parent());d.trigger("activetabchanged",[e])},s=function(c,i,d){var b=true,f=d.relative?c.position().top:c.offset().top,h=d.relative?c.position().left:c.offset().left,e=d.position[0];f-=i.outerHeight(b)-d.offset[0];h+=c.outerWidth(b)+d.offset[1];if(/iPad/i.test(navigator.userAgent))f-=a(window).scrollTop();var j=i.outerHeight(b)+c.outerHeight(b);if(e==g)f+=j/2;if(e=="bottom")f+=j;e=d.position[1];var k=i.outerWidth(b)+c.outerWidth(b);if(e==g)h-=k/2;if(e=="left")h-=k;return {top:f,left:h}},t=function(b){var a=b.data("tooltip");if(!a){a=b.next();a.detach().appendTo(document.body);b.data("tooltip",a)}return a},q=function(){var c=a(this),b=t(c);a(h).hide();var d=s(c,b,{position:[g,"right"],offset:[0,15],relative:false});b.css({position:"absolute",top:d.top,left:d.left});b.fadeIn()},r=function(){a(h).fadeOut()},o=function(f){var b=a(this),g=b.children("ul"),c=b.children(e);if(c.prop(d))return;g.toggle();f.stopPropagation()},k=function(){var c="selected",d=this,f=a(d),e=f.closest(b),g=e.find('ul a[data-index="'+d.selectedIndex+'"]').closest("li");e.find("li.selected").removeClass(c);g.addClass(c);e.find("> span > span").html(d.options[d.selectedIndex].text)},p=function(){var g=a(this),h=g.closest(b),c=h.children(e);if(c.prop(d))return;c.get(0).selectedIndex=g.data("index");if(typeof c.get()[0].Validators!==f)this.Validators=c.get()[0].Validators;c.change()},m=function(g,f){var c=a(this),e=c.closest(b);if(f){c.removeClass(d);e.removeClass(d)}else{c.addClass(d);e.addClass(d)}},u=function(){a(".PWP-inputWrapper.PWP-dropdownlist > ul").hide()};a(function(){var c=".PWP-inputWrapper.PWP-dropdownlist",b="sync";a(".PWP-inputWrapper.checkbox > input").change(j).bind(b,j).each(function(){a(this).triggerHandler(b)});a(".PWP-inputWrapper.radiobutton > input").change(i).bind(b,i).each(function(){a(this).triggerHandler(b)});a(".PWP-inputWrapper.checkbox > a, .PWP-inputWrapper.checkbox > label, .PWP-inputWrapper.radiobutton > a, .PWP-inputWrapper.radiobutton > label").click(l);a(".PWP-inputWrapper.checkbox > a, .PWP-inputWrapper.radiobutton > a").keydown(n);a(".PWP-tabsWrapper > ul > li > a").click(v);a(".PWP-tooltip").mouseenter(q).mouseleave(r);a(c).click(o);a(c).on("change",e,k).on(b,e,k).each(function(){this.selectedIndex>0&&a(this).triggerHandler(b)});a(".PWP-inputWrapper.PWP-dropdownlist > ul a").click(p);a(".PWP-inputWrapper.button > input").bind("enabledchanged",m);a(document.body).click(u)})})(jQuery);function openDialog(e){var a=null,c={allowMaximize:false,showClose:true,dialogReturnValueCallback:Function.createDelegate(a,function(c,b){if(c==SP.UI.DialogResult.OK)if(b==a){SP.UI.Notify.addNotification("Operation successful");SP.UI.ModalDialog.RefreshPage(SP.UI.DialogResult.OK)}else location.href=b})},b=$.extend(c,e);d();function d(){if(b.url==a)throw"The option 'url' needs to be set";if(b.title==a)throw"The option 'title' needs to be set"}SP.UI.ModalDialog.showModalDialog(b)}
jQuery(function(){var d=".consoleMenu .consoles .body";jQuery(".consoleMenu .consoles .head").click(function(){window.location=jQuery(this).find("a").attr("href");return false});for(var e=18,f=4,b=0;b<=f;b++){var a=0;jQuery(".consoleMenu .consoles .content").each(function(){var c=jQuery(this).find("li").eq(b-1);if(c.height()>e&&c.height()>a)a=c.height()});a&&jQuery(".consoleMenu .consoles .content li:nth-child("+b+")").height(a)}var c=0;jQuery(d).each(function(){if(jQuery(this).height()>c)c=jQuery(this).height()});jQuery(d).css("height",c)});jQuery(function(){var b="activeglobalsearch",a="#GlobalSearch";jQuery(".search input[type='text']").focus(function(){var c=jQuery(this);c.closest(a).addClass(b);this.select();c.prev().hide()}).blur(function(){var c=jQuery(this);c.closest(a).removeClass(b);this.value.length==0&&c.prev().show()});if(window.navigator.userAgent.indexOf("MSIE")!=-1&&document.documentMode==8){$("#GlobalSearch button.search").remove();$(a).append($('<button type="button" onclick="dosearch();" class="search"></button>'))}});jQuery(document).keyup(function(a){a.keyCode==27&&PostNordCommonFlyouts.hideAllFlyouts()});jQuery(function(){var d=".consoleMenu .consoles .body";jQuery(".consoleMenu .consoles .head").click(function(){window.location=jQuery(this).find("a").attr("href");return false});for(var e=18,f=4,b=0;b<=f;b++){var a=0;jQuery(".consoleMenu .consoles .content").each(function(){var c=jQuery(this).find("li").eq(b-1);if(c.height()>e&&c.height()>a)a=c.height()});a&&jQuery(".consoleMenu .consoles .content li:nth-child("+b+")").height(a)}var c=0;jQuery(d).each(function(){if(jQuery(this).height()>c)c=jQuery(this).height()});jQuery(d).css("height",c);jQuery(".treeView li.selected").parents("ul").css("display","block").parent().addClass("active");jQuery(".treeView li li:has(ul) > a").addClass("with-children")});function IsFlyout(a){return jQuery(a).parent().children().length>1}jQuery(function(){var a=false,b=".consoleMenu .content .foot",c=".consoleMenu .flyout",g=c,h=b,d="#GlobalMenu .dropDown",e="#GlobalMenu .dropDownFocus > a",f;jQuery("#GlobalMenu .dropDownFocus").each(function(){var b="active",d="div.dropDownFocus",c=jQuery(this),f=jQuery(this).find(".dropDown"),e=jQuery(this).children("a");if(f.length>0){jQuery(e).click(function(){if(IsFlyout(this)==true){PostNordCommonFlyouts.showFlyout(jQuery(e));jQuery(this).closest(d).addClass(b);return a}});PostNordCommonFlyouts.addFlyout({flyout:f,focus:e,onshowing:function(){c.children(".indent").show().width(c.width())},onhiding:function(){c.removeClass(b);c.children(".indent").hide()},timeout:null});c.find("a.flyout-focus").click(function(){if(f.is(jQuery(".active")))PostNordCommonFlyouts.hideAllFlyouts();else{PostNordCommonFlyouts.showFlyout(jQuery(e));jQuery(this).closest(d).addClass(b)}})}else jQuery(e).click(function(){if(IsFlyout(this)==true){PostNordCommonFlyouts.hideAllFlyouts();return a}});c.find(".close").click(function(){PostNordCommonFlyouts.hideAllFlyouts();return a})});jQuery(b).each(function(e){var b=jQuery(this),d=jQuery(c).eq(e);if(d.length>0){PostNordCommonFlyouts.addFlyout({flyout:d,focus:b,timeout:null});jQuery(b).click(function(){if(jQuery(this).is(".active"))PostNordCommonFlyouts.hideFlyout(jQuery(b));else{PostNordCommonFlyouts.cancelAutoFadeOut(jQuery(d));PostNordCommonFlyouts.showFlyout(jQuery(b))}return a})}else jQuery(b).click(function(){PostNordCommonFlyouts.hideAllFlyouts();return a})});jQuery(".consoleMenu .close").click(function(){PostNordCommonFlyouts.hideFlyout(jQuery(b))})});jQuery(function(){jQuery(".colspanManagerToggle").click(function(){jQuery(".colspanManager").toggle()})});jQuery(function(a){var b="active";function g(h){var b="<br/>",c=a("<span/>");c.text(h);var f=new RegExp("(&lt;br/&gt;)","gi"),e=c.html(),d=e.replace(f,b),g=e.replace(f," ");if(d.indexOf(b)!=-1){c.html(d);c.addClass("twoLiner")}else c.prepend(b);return {spanobj:c,tooltiptext:g}}var c=a(".ms-formfieldcontainer",a("#tabs")).length>0;if(!c){var f=a("#tabHandles");a(".tab-name-container").each(function(){a(this).hide();var d=a(this).attr("id").replace("tabcref","tab"),c=a(this).text().replace(/^\s*/,"").replace(/\s*$/,""),b=g(c);f.append(a('<div class="gradientPrimary"/>').append(a("<a/>").attr("href","javascript:void(0)").attr("title",b.tooltiptext).append(b.spanobj)))});f.append(a('<div class="gradientPrimary tab-add"><a href="javascript:void(0)">+</a></div>'))}else a("#tabs").removeClass();if(!c){var h=new window.PostNord.Common.TabWidget({maxTabCount:5,selectedClass:b,tabSelector:"#tabHandles > .gradientPrimary",tabAddSelector:".tab-add",tabRemoveSubSelector:".tab-remove",tabNameInputSubSelector:"input",tabContentSubSelector:"#tabContents > .body > div:not(.tab-name-container)",tabContentInputSubSelector:"textarea",editMode:false});h.init();var d=function(){var b=window.location.hash;b!=""&&b!="#"&&a(".tabs .gradientPrimary > a[href='"+b+"']").click()};d();a(window).bind("hashchange",d)}Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(i);function i(){c&&a("#MSOTlPn_ToolPaneCaption").html()!=null&&setTimeout(function(){a("#s4-workspace").animate({scrollTop:0},0);a("#MSOTlPn_MainTD").find("input:first").focus()},1e3)}var e=$("#searchandfindtabs");e.closest(".inner").css("width","100%");e.find(".tab-link").click(function(){var f="tab-active",g="img.inactive",d="active-icon",c="#e1e3e6",a="background",e=$(this);if(e.hasClass(b))return;var m=e.data("link"),h=$("#searchandfindtabs .tab-link"),l=e.prevAll().length,j=$(".color-plate.left"),i=$(".color-plate.right");if(l==0){j.css(a,"#f9f9f9");i.css(a,c)}else if(l==h.length-1){i.css(a,"#f9f9f9");j.css(a,c)}else{i.css(a,c);j.css(a,c)}h.removeClass(b);h.find("img.active-icon").removeClass(d);h.find(g).addClass(d);e.addClass(b);e.find("img.active").addClass(d);e.find(g).removeClass(d);var k=$("#searchandfindtabs .tab-content");k.removeClass(f);k.each(function(){var a=$(this);a.data("tab")===m&&a.addClass(f)})})});function initFlyouts(){var e="#MainMenu li.flyout-active",d=".menuflyout:visible",a="flyout-active",c=".dropDown.flyout:visible",h=$(".menuflyout"),f=null,b=function(){$(c).hide();$("#GlobalMenu a.flyout-focus.flyout-active").removeClass(a);$("#GlobalMenu div.dropDownFocus.active").removeClass("active");$("#GlobalMenu a.flyout-focus.active").removeClass("active");$(d).hide();$(e).removeClass(a)};if(typeof window.PostNordCommonFlyouts==="object"){f=window.PostNordCommonFlyouts.hideAllFlyouts;window.PostNordCommonFlyouts.hideAllFlyouts=function(){f();b()}}window._closeAllFlyouts=b;window.resizeFlyout=function(a){var b=$("#"+$(e).data("flyoutid")).find("iframe");b.height(a)};$("#Frame .menuflyout .inner a.close, .dropDown.flyout a.close").click(function(){b()});$(document).click(function(a){$(d).find(a.target).length===0&&$(c).find(a.target).length===0&&b()});function g(a){var b=a.find("iframe");b.length>0&&a.css("left","-"+a.width()*2+"px");a.show();if(b.length>0){b.height($(".menuflyout:first",b.contents()).height());a.css("left","0px")}}$("#MainMenu li").click(function(f){var c=$(this),d=$("#"+c.attr("data-flyoutid"));if(d.length!==0){var e=c.hasClass(a);b();if(e==false){c.addClass(a);g(d)}}f.stopPropagation()})}jQuery(document).ready(function(){initFlyouts();var a=jQuery("#MainMenu div.flyoutsContainer");a.contents().insertBefore("#Body");a.remove()});jQuery(window).load(function(){jQuery(".menuflyout > .inner > iframe").each(function(){var b=jQuery(this),a=b.closest(".menuflyout");a.css("left","-"+a.width()*2+"px");b.attr("src",b.attr("srcTemp"));a.show()})});jQuery(document).ready(function(){$(".anzery-small").addClass("box colspan-1")});jQuery("#s4-workspace").scroll(function(){var f="position",e="stickyCompensation",c="top",i=123,k=2,b=jQuery("#MainMenuContainer"),g=jQuery("#Head"),j=jQuery(this),h=j.scrollTop(),d=j.offset().top,a=$(".menuflyout");if(h>=i){b.addClass("sticky");d>0&&b.css(c,d+"px");g.addClass(e);a.css(c,d+b.outerHeight()+"px");a.css(f,"fixed");a.css("z-index","1340")}else if(h<i-k){b.removeClass("sticky");a.css(f,"absolute");d>0&&b.css(c,"0px");a.css(c,"");a.css("z-index","");g.removeClass(e)}})
jQuery(document).ready(function(){var a="form:first";if(window.parent==window.top){jQuery("body").find(a).attr("action",jQuery(window.parent.document).find("body").find(a).attr("action"));jQuery("#heading a.close").click(function(){window.parent._closeAllFlyouts()});jQuery("head").find("base").attr("href",document.referrer)}});(function(){var b="onresize",c=document.attachEvent,d=navigator.userAgent.match(/Trident/),e=function(){var a=function(a){return window.setTimeout(a,2)};return function(b){return a(b)}}(),f=function(){var a=window.clearTimeout;return function(b){return a(b)}}();function a(b){var a=b.target||b.srcElement;a.__resizeRAF__&&f(a.__resizeRAF__);a.__resizeRAF__=e(function(){var c=a.__resizeTrigger__;$.each(c.__resizeListeners__,function(d,a){a.call(c,b)})})}function g(){this.contentDocument.defaultView.__resizeTrigger__=this.__resizeElement__;this.contentDocument.defaultView.addEventListener("resize",a)}window.addResizeListener=function(e,h){if(!e.__resizeListeners__){e.__resizeListeners__=[];if(c){e.__resizeTrigger__=e;e.attachEvent(b,a)}else{if(getComputedStyle(e).position=="static")e.style.position="relative";var f=e.__resizeTrigger__=document.createElement("object");f.setAttribute("style","display: block; position: absolute; top: 0; left: 0; height: 100%; width: 100%; overflow: hidden; pointer-events: none; z-index: -1;");f.__resizeElement__=e;f.onload=g;f.type="text/html";d&&e.appendChild(f);f.data="about:blank";!d&&e.appendChild(f)}}e.__resizeListeners__.push(h)};window.removeResizeListener=function(d,e){d.__resizeListeners__.splice(d.__resizeListeners__.indexOf(e),1);if(!d.__resizeListeners__.length)if(c)d.detachEvent(b,a);else{d.__resizeTrigger__.contentDocument.defaultView.removeEventListener("resize",a);d.__resizeTrigger__=!d.removeChild(d.__resizeTrigger__)}}})();jQuery(document).ready(function(){var a=".menuflyout";addResizeListener($(a)[0],function(){window.parent.resizeFlyout($(a).height())})})
if(typeof(Sys)!=='undefined')Sys.Application.notifyScriptLoaded();