<%@ Control Language="C#" CodeFile="Testimonials.ascx.cs" Inherits="ASPNET.StarterKit.Portal.Testimonials" %>
<%@ Register TagPrefix="Portal" TagName="Title" Src="~/DesktopModuleTitle.ascx" %>
<%@ Import Namespace="System.Web.Services" %>
<Portal:Title EditText="Add" EditUrl="~/DesktopModules/EditTestimonial.aspx" runat="server"
    ID="Title1" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
      <Services>
    <asp:ServiceReference Path="~/WebServices/TestimonialsService.asmx" />
    </Services>
</asp:ScriptManager>
<table width="600" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <td id="HtmlHolder" runat="server" valign="top">
        </td>
        <td align="left" valign="top">
            <div id="divTestimonial" style="position:absolute;padding-right: 10px; display: none; padding-left: 10px;
                padding-bottom: 4px; padding-top: 4px;filter:progid:DXImageTransform.Microsoft.Wipe(GradientSize=1.0, wipeStyle=0, motion='forward');">
                <table cellspacing="0" width="300px" style="border-right: #920000 ridge; padding-right: 10px;
                    border-top: #920000 ridge; padding-left: 10px; padding-bottom: 4px; border-left: #920000 ridge;
                    padding-top: 4px; border-bottom: #920000 ridge">
                    <tr style="font-weight: bold; color: white; background-color: #920000; text-align: left">
                        <td width="90%" style="font-weight: bold; text-align: left">
                            Details</td>
                        <td width="100%" align="right">
                            <img align="right" style="cursor: hand" onclick="HideTestimonial()" src="images/delete.gif">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><div id="divTestimonialInner" style="overflow:auto; background-color:LightGrey;filter:alpha(opacity=90);">
                            <a id="aTestimonial"></a>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">

   function DoSearch()
   {
     var SrchElem = document.getElementById("SearchKey");
     ASPNET.StarterKit.Portal.WebServices.TestimonialsService.GetTestimonial(SrchElem.value,
       OnRequestComplete);
     //PageMethods.GetTestimonial(SrchElem.value, OnRequestComplete);
   }
  
   function OnRequestComplete(result)
   {
		ldivTestimonial = document.getElementById('divTestimonial');
		laTestimonial = document.getElementById('aTestimonial');
        ldivTestimonial.filters[0].apply();  
		ldivTestimonial.style.display='block';
		//aTestimonial.style.width="300px";
        laTestimonial.innerHTML = result;
        ldivTestimonial.style.display='block';
			ldivTestimonialInner = document.getElementById('divTestimonialInner');
            var liframeHeight;
            if (self.innerHeight)
	        {
		        liframeHeight = self.innerHeight;
	            }
	        else if (document.documentElement && document.documentElement.clientHeight)
	        {
		        liframeHeight = document.documentElement.clientHeight;
	        }
	        else if (document.body)
	        {
		        liframeHeight = document.body.clientHeight;
	        }
	        ldivTestimonialInner.style.height = (liframeHeight-100) + 'px';
            JSFX_FloatTopLeft();
             
            ldivTestimonial.filters[0].play(); 
   }

function JSFX_FloatTopLeft()
{
var liframeWidth;
var liframeHeight;
if (self.innerWidth)
	{
		liframeWidth = self.innerWidth;
		liframeHeight = self.innerHeight;
	}
	else if (document.documentElement && document.documentElement.clientWidth)
	{
		liframeWidth = document.documentElement.clientWidth;
		liframeHeight = document.documentElement.clientHeight;
	}
	else if (document.body)
	{
		liframeWidth = document.body.clientWidth;
		liframeHeight = document.body.clientHeight;
	}
	else return;
	var startX = liframeWidth-325, startY = 150;
	var ns = (navigator.appName.indexOf("Netscape") != -1);
	var d = document;
	var px = document.layers ? "" : "px";
	function ml(id)
	{
		var el=d.getElementById?d.getElementById(id):d.all?d.all[id]:d.layers[id];
		if(d.layers)el.style=el;
		el.sP=function(x,y){this.style.left=x+px;this.style.top=y+px;};
		el.x = startX; el.y = startY;
		return el;
	}
	window.stayTopLeft=function()
	{
		var pY = ns ? pageYOffset : document.documentElement && document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
		var dY = (pY > startY) ? pY : startY;
		ftlObj.y += (dY - ftlObj.y)/8;
		ftlObj.sP(ftlObj.x, ftlObj.y);
		setTimeout("stayTopLeft()", 20);
	}
	ftlObj = ml("divTestimonial");
	stayTopLeft();
}

		function DisplayTestimonial(liItemID, liSelectedRow)
		{
			ldivTestimonial = document.getElementById('divTestimonial');
            ASPNET.StarterKit.Portal.WebServices.TestimonialsService.GetTestimonial(liItemID, OnRequestComplete);
            //PageMethods.GetTestimonial(SrchElem.value, OnRequestComplete);
            
//            		ltblTestimonial = document.getElementById('tblTestimonialSummary');
//		ASPNET.StarterKit.Portal.WebServices.TestimonialsService.GetTestimonial(liItemID, OnRequestComplete);
//		if (ltblTestimonial != null && aTestimonial != null)
//		{
//			for (i=0;i < ltblTestimonial.rows.length;i++)
//			{
//				if (i == 2*liSelectedRow)
//				{
//					ltblTestimonial.rows[i].style.backgroundColor = "#920000";
//					ltblTestimonial.rows[i].style.color = "white";
//				}
//				else
//				{
//					ltblTestimonial.rows[i].style.backgroundColor = "transparent";
//					ltblTestimonial.rows[i].style.color = "black";
//				}
//			}	
//		}
//		else
//		{
//		window.alert("NotFound");
//		}
		}
		
		function HideTestimonial()
		{
			ldivTestimonial = document.getElementById('divTestimonial');
			ldivTestimonial.style.display='none';
		}
</script>
