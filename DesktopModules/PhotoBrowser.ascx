<%@ Control Language="C#" AutoEventWireup="true" Inherits="ASPNET.StarterKit.Portal.PhotoBrowser"
    CodeFile="PhotoBrowser.ascx.cs" CodeFileBaseClass="ASPNET.StarterKit.Portal.PortalModuleControl" %>
<%@ Register TagPrefix="ASPNETPortal" TagName="Title" Src="~/DesktopModuleTitle.ascx" %>
<ASPNETPortal:Title EditText="Administer Photos" EditUrl="~/DesktopModules/PhotoAdmin/AlbumAdmin.aspx"
    runat="server" ID="Title1" />

<script>
function ChangeSrc(PhotoID, lsPhotoCaption)
{
    divPhoto.style.display='block';
	limgPhoto = document.getElementById('imgPhoto');
	lancCaption = document.getElementById('ancCaption');
	if (limgPhoto != null)
	{
            limgPhoto.filters[0].apply();   
		lssrc = "desktopmodules\\Handler.ashx?PhotoID=" + PhotoID + "&Size=L";
		limgPhoto.alt = lsPhotoCaption;
        limgPhoto.src = lssrc;                     //Apply the transition effect
        lancCaption.innerText = lsPhotoCaption;
        limgPhoto.filters[0].play();                        //Play the effect and display the new image
    }
}
function Load(PageNumber)
{
    lhddnPhotoIDs = document.getElementById('hddnPhotoIDs');
//    lPhotoIDs = lHiddenField.Value;
window.alert(lhddnPhotoIDs.value);
    lPhotoIDsArray = lhddnPhotoIDs.value.split("|");
window.alert(lPhotoIDsArray);
    if (lPhotoIDsArray.Length > 1)
    {
	    limg11 = document.getElementById('img11');
	    limg11.src="desktopmodules\Handler.ashx?PhotoID=" + lPhotoIDsArray[0] + "&Size=S";
	    limg12 = document.getElementById('img12');
	    limg12.src="desktopmodules\Handler.ashx?PhotoID=" + lPhotoIDsArray[1] + "&Size=S";
	    
	}
}
function LoadCaptions(lPhotoCaptions)
{
	//Find and Update Values
	var lhdnValues = document.getElementById('hdnPhotoCaptionArray');
    lhdnValues.value = lPhotoCaptions;
}
function LoadIDs(lPhotoIDs)
{
	//Find and Update Values
	var lhdnValues = document.getElementById('hdnPhotoIDArray');
	var lhdnCaptionsValues = document.getElementById('hdnPhotoCaptionArray');
    lhdnValues.value = lPhotoIDs;
    
    //Select Tables
    var tblCurrentID = 'tbl2';
    var tblPreviousID = 'tbl1';
    var tblNextID = 'tbl3';
    
    //Convert into an array
	var lhdnValuesArray = lhdnValues.value.split("|");
	var lhdnCaptionsValuesArray = lhdnCaptionsValues.value.split("|");
	//Account for if there are less than or equal to 4 photos
	//window.alert(lhdnValuesArray + ' - ' + lhdnValuesArray.length);
	//window.alert(lhdnCaptionsValuesArray + ' - ' + lhdnCaptionsValuesArray.length);
	if (lhdnValuesArray.length <= 8)
	{
	    //Hide scroll
	    document.getElementById('imgLeft').style.display = 'none';
	    document.getElementById('imgRight').style.display = 'none';
	    var imageIDArray = new Array();
	    var imageIDCaptionArray = new Array();
	    if (lhdnValuesArray.length > 0 && lhdnValuesArray != ''){
	        imageIDArray[0] = lhdnValuesArray[0];
	        imageIDCaptionArray[0] = lhdnCaptionsValuesArray[0];}
	    else{
	        document.getElementById('tbl2img1').style.display = 'none';}
	    if (lhdnValuesArray.length > 1){
	        imageIDArray[1] = lhdnValuesArray[1];
	        imageIDCaptionArray[1] = lhdnCaptionsValuesArray[1];}
	    else{
	        document.getElementById('tbl2img2').style.display = 'none';}
	    if (lhdnValuesArray.length > 2){
	        imageIDArray[2] = lhdnValuesArray[2];
	        imageIDCaptionArray[2] = lhdnCaptionsValuesArray[2];}
	    else{
	        document.getElementById('tbl2img3').style.display = 'none';}
	    if (lhdnValuesArray.length > 3){
	        imageIDArray[3] = lhdnValuesArray[3];
	        imageIDCaptionArray[3] = lhdnCaptionsValuesArray[3];}
	    else{
	        document.getElementById('tbl2img4').style.display = 'none';}
	    if (lhdnValuesArray.length > 4){
	        imageIDArray[4] = lhdnValuesArray[4];
	        imageIDCaptionArray[4] = lhdnCaptionsValuesArray[4];}
	    else{
	        document.getElementById('tbl2img5').style.display = 'none';}
	    if (lhdnValuesArray.length > 5){
	        imageIDArray[5] = lhdnValuesArray[5];
	        imageIDCaptionArray[5] = lhdnCaptionsValuesArray[5];}
	    else{
	        document.getElementById('tbl2img6').style.display = 'none';}
	    if (lhdnValuesArray.length > 6){
	        imageIDArray[6] = lhdnValuesArray[6];
	        imageIDCaptionArray[6] = lhdnCaptionsValuesArray[6];}
	    else{
	        document.getElementById('tbl2img7').style.display = 'none';}
	    if (lhdnValuesArray.length > 7){
	        imageIDArray[7] = lhdnValuesArray[7];
	        imageIDCaptionArray[7] = lhdnCaptionsValuesArray[7];}
	    else{
	        document.getElementById('tbl2img8').style.display = 'none';}
	        
	    //Load availiable images
	    window.alert("HERE");
	    LoadImagePropertiesAction(tblCurrentID, imageIDArray);
	    
	}
	else
	{
	    //Load first values into current table
	    var imageIDArray = new Array();
	    var imageIDCaptionArray = new Array();
	    imageIDArray[0] = lhdnValuesArray[0];
	    imageIDCaptionArray[0] = lhdnCaptionsValuesArray[0];
	    imageIDArray[1] = lhdnValuesArray[1];
	    imageIDCaptionArray[1] = lhdnCaptionsValuesArray[1];
	    imageIDArray[2] = lhdnValuesArray[2];
	    imageIDCaptionArray[2] = lhdnCaptionsValuesArray[2];
	    imageIDArray[3] = lhdnValuesArray[3];
	    imageIDCaptionArray[3] = lhdnCaptionsValuesArray[3];
	    imageIDArray[4] = lhdnValuesArray[4];
	    imageIDCaptionArray[4] = lhdnCaptionsValuesArray[4];
	    imageIDArray[5] = lhdnValuesArray[5];
	    imageIDCaptionArray[5] = lhdnCaptionsValuesArray[5];
	    imageIDArray[6] = lhdnValuesArray[6];
	    imageIDCaptionArray[6] = lhdnCaptionsValuesArray[6];
	    imageIDArray[7] = lhdnValuesArray[7];
	    imageIDCaptionArray[7] = lhdnCaptionsValuesArray[7];
	    LoadImagePropertiesAction(tblCurrentID, imageIDArray, imageIDCaptionArray);
	    //Load other tables
	    LoadImageProperties(tblCurrentID, tblPreviousID, tblNextID);
	}
}
function ScrollLeft()
{
    //Select Tables
    var tblCurrentID = null;
    var tblPreviousID = null;
    var tblNextID = null;
    if (tbl1.style.display != 'none')
    {
    	tblCurrentID = 'tbl3';
    	tblPreviousID = 'tbl2';
    	tblNextID = 'tbl1';
    }
    else if (tbl2.style.display != 'none')
    {
    	tblCurrentID = 'tbl1';
    	tblPreviousID = 'tbl3';
    	tblNextID = 'tbl2';
    }
    else if (tbl3.style.display != 'none')
    {
    	tblCurrentID = 'tbl2';
    	tblPreviousID = 'tbl1';
    	tblNextID = 'tbl3';
    }
    LoadImageProperties(tblCurrentID, tblPreviousID, tblNextID);
    
    //Apply filter and show the new table
    rowphotos.filters[0].motion = 'forward';
    rowphotos.filters[0].apply();
    ShowCurrentTable(tblCurrentID, tblPreviousID, tblNextID);
    rowphotos.filters[0].play(); 
}
function ScrollRight()
{
            //Select Tables
			var tblCurrentID = null;
			var tblPreviousID = null;
			var tblNextID = null;
			if (tbl1.style.display != 'none')
			{
				tblCurrentID = 'tbl2';
				tblPreviousID = 'tbl1';
				tblNextID = 'tbl3';
			}
			else if (tbl2.style.display != 'none')
			{
				tblCurrentID = 'tbl3';
				tblPreviousID = 'tbl2';
				tblNextID = 'tbl1';
			}
			else if (tbl3.style.display != 'none')
			{
				tblCurrentID = 'tbl1';
				tblPreviousID = 'tbl3';
				tblNextID = 'tbl2';
			}
			LoadImageProperties(tblCurrentID, tblPreviousID, tblNextID);
			
            //Apply filter and show the new table
            rowphotos.filters[0].motion = 'reverse';
            rowphotos.filters[0].apply();
			ShowCurrentTable(tblCurrentID, tblPreviousID, tblNextID);
            rowphotos.filters[0].play();
}

		function ShowCurrentTable(tblCurrentID, tblPreviousID, tblNextID)
		{
			//Hides the next and previous tables and shows the current table
			document.getElementById(tblPreviousID).style.display = 'none';
			document.getElementById(tblCurrentID).style.display = 'block';
			document.getElementById(tblNextID).style.display = 'none';
		}
		function LoadImageProperties(tblCurrentID, tblPreviousID, tblNextID)
		{
			var liImagesPerPage = 8;
			//Loads the properties for the images depending on the currently selected point.
		
			//Find values
			var lhdnValues = document.getElementById('hdnPhotoIDArray');
			var lhdnCaptionValues = document.getElementById('hdnPhotoCaptionArray');
			//Convert into an array
			var lhdnValuesArray = lhdnValues.value.split("|");
			var lhdnCaptionValuesArray = lhdnCaptionValues.value.split("|");
			//window.alert(lhdnValuesArray.length);
			//Find current selected image ID
			var liCurrentImageID = document.getElementById(tblCurrentID + 'img' + 1).src;
			liCurrentImageID = liCurrentImageID.substring(liCurrentImageID.indexOf('PhotoID=') + 8, liCurrentImageID.indexOf('&Size'));
			//window.alert('liCurrentImageID - ' + liCurrentImageID);
			var liCurrentImageArrayID = -1;
			var i = 0;
			while (liCurrentImageArrayID == -1 && i <= lhdnValuesArray.length)
			{
				if (lhdnValuesArray[i] == liCurrentImageID)
					liCurrentImageArrayID = i;
				i++;
			}
			//window.alert('lhdnValuesArray - ' + lhdnValuesArray);
			//window.alert('liCurrentImageArrayID - ' + liCurrentImageArrayID);
			var imageIDArray = new Array();
			var imageCaptionArray = new Array();
			//Find and load previous images
			i = 0;
			while ((liImagesPerPage - i) > 0)
			{
				//If liCurrentImageArrayID - liImagesPerPage + i is negative wrap
				var liNewImageID = liCurrentImageArrayID - liImagesPerPage + i;
				if (liNewImageID < 0)
				{
				    var liWrapImageID = lhdnValuesArray.length + liNewImageID;
				    if (liWrapImageID < 0)
				    {
				        liWrapImageID = liWrapImageID.length + liNewImageID;
				    }
				   //window.alert(i + ' - ' + test);
					imageIDArray[i] = lhdnValuesArray[liWrapImageID];
					imageCaptionArray[i] = lhdnCaptionValuesArray[liWrapImageID];
				}
				else
				{
				    //window.alert(i + ' - ' + liNewImageID);
					imageIDArray[i] = lhdnValuesArray[liNewImageID];
					imageCaptionArray[i] = lhdnCaptionValuesArray[liNewImageID];
				}
				i++;
			}
			LoadImagePropertiesAction(tblPreviousID, imageIDArray, imageCaptionArray);
			//Find and load next images
			var imageIDArray = new Array();
			i = 0;
			while ((liImagesPerPage - i) > 0)
			{
				//If liCurrentImageArrayID + i is greater than or eqaul to lhdnValuesArray.length then wrap
				var liNewImageID = liCurrentImageArrayID + liImagesPerPage + i;
				if (liNewImageID >= lhdnValuesArray.length)
				{
				    var liWrapImageID = liNewImageID - lhdnValuesArray.length;
				    if (liWrapImageID >= lhdnValuesArray.length)
				    {
				        liWrapImageID = liWrapImageID - lhdnValuesArray.length;
				    }
				    //window.alert('Wrap ' + i + ' - ' + liWrapImageID);
					imageIDArray[i] = lhdnValuesArray[liWrapImageID];
					imageCaptionArray[i] = lhdnCaptionValuesArray[liWrapImageID];
				}
				else
				{
				    //window.alert('NoWrap ' + i + ' - ' + liNewImageID);
					imageIDArray[i] = lhdnValuesArray[liNewImageID];
					imageCaptionArray[i] = lhdnCaptionValuesArray[liNewImageID];
				}
				i++;
			}
			LoadImagePropertiesAction(tblNextID, imageIDArray, imageCaptionArray);
		}
		function LoadImagePropertiesAction(tblImagesID, imageIDArray, imageIDCaptionArray)
		{
			//window.alert(tblImagesID + ' - ' + imageIDArray);
			i = 1;
			limage = null;
			lianc = null;
			while (i <= imageIDArray.length)
			{
				//Find image to work on
				if (imageIDArray[i-1] != null)
				{
				    //window.alert(i + ' - ' + tblImagesID + 'img' + i + ' - ' + imageIDArray[i-1]);
				    limage = document.getElementById(tblImagesID + 'img' + i);
				    //Do not alter image if not required
				    var lsSrc = 'desktopmodules\\Handler.ashx?PhotoID=' + imageIDArray[i-1] + '&Size=S';
				    if (limage.src != lsSrc)
				    {
				        limage.alt = imageIDCaptionArray[i-1];
				        limage.src = lsSrc;
				        lianc = document.getElementById(tblImagesID + 'anc' + i);
				        //if NN6 then OK to use the standard setAttribute
				        if ((!document.all)&&(document.getElementById))
                        {
                            lianc.onclick = "ChangeSrc(" + imageIDArray[i-1] + ", '" + imageIDCaptionArray[i-1] + "');";
                        }
                        //workaround for IE 5.x
                        if ((document.all)&&(document.getElementById))
                        {
				            lianc.onclick = new Function("ChangeSrc(" + imageIDArray[i-1] + ", '" + imageIDCaptionArray[i-1] + "');");
                        }
                    }
                }
                else
                {
                    //window.alert('Error: - ' + i + ' - ' + imageIDArray + ' - ' + tblImagesID + 'img' + i + ' - ' + imageIDArray[i-1]);
                }
                
				i++;
			}
		}
</script>

<table width="600px" align="center">
    <tr>
        <td>
            <img id="imgLeft" src="images\lt.gif" alt='Scroll Left' onclick="ScrollLeft();" /></td>
        <td align="center" id="rowphotos" style="filter: progid:DXImageTransform.Microsoft.Wipe(GradientSize=1.0, wipeStyle=0, motion='reverse', duration=2)">
            <table id="tbl1" style="display: none" width="550px">
                <tr>
                    <td>
                        <table id="tbl11" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl1anc1" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl1img1" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl12" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl1anc2" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl1img2" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl13" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl1anc3" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl1img3" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl14" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl1anc4" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl1img4" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="tbl15" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl1anc5" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl1img5" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl16" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl1anc6" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl1img6" alt='Thumbnail of Photo Number 1' class="photo_198" src="" style="border: 4px solid white" /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl17" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl1anc7" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl1img7" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl18" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl1anc8" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl1img8" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!--<p><%# Server.HtmlEncode(Eval("Caption").ToString()) %></p>-->
            </table>
            <table id="tbl2" style="display: block" width="550px">
                <tr>
                    <td>
                        <table id="tbl21" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl2anc1" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl2img1" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl22" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl2anc2" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl2img2" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl23" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl2anc3" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl2img3" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl24" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl2anc4" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl2img4" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="tbl25" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl2anc5" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl2img5" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl26" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl2anc6" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl2img6" alt='Thumbnail of Photo Number 1' class="photo_198" src="" style="border: 4px solid white" /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl27" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl2anc7" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl2img7" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl28" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl2anc8" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl2img8" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!--<p><%# Server.HtmlEncode(Eval("Caption").ToString()) %></p>-->
            </table>
            <table id="tbl3" style="display: none" width="550px">
                <tr>
                    <td>
                        <table id="tbl31" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl3anc1" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl3img1" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl32" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl3anc2" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl3img2" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl33" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl3anc3" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl3img3" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl34" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl3anc4" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl3img4" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="tbl35" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl3anc5" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl3img5" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl36" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl3anc6" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl3img6" alt='Thumbnail of Photo Number 1' class="photo_198" src="" style="border: 4px solid white" /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl37" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl3anc7" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl3img7" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="tbl38" border="0" cellpadding="0" cellspacing="0" class="photo-frame"
                            align="center">
                            <tr>
                                <td>
                                    <a id="tbl3anc8" style="cursor: hand" onclick='ChangeSrc(1);'>
                                        <img id="tbl3img8" src="" class="photo_198" style="border: 4px solid white" alt='Thumbnail of Photo Number 1' /></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!--<p><%# Server.HtmlEncode(Eval("Caption").ToString()) %></p>-->
            </table>
        </td>
        <td>
            <img id="imgRight" src="images\rt.gif" alt='Scroll Right' onclick="ScrollRight();" /></td>
    </tr>
    <tr>
        <td align="center" colspan="5">
            <div id="divPhoto" style="display: none;">
                <img id="imgPhoto" src="images\TOMAT-ShirtLogo.jpg" class="photo_198" style="border: 4px solid white;
                    filter: progid:DXImageTransform.Microsoft.Fade(duration=2,overlap=0.5)" alt='Photo Number 1' /><!--style="filter:progid:DXImageTransform.Microsoft.Fade(duration=2,overlap=0.5)"-->&nbsp;</div>
        </td>
    </tr>
    <tr><td align="center" colspan="5"><a id="ancCaption"></a></td></tr>
</table>
<input type="hidden" id="hdnPhotoIDArray" name="hdnPhotoIDArray" value="1|2|3|4|5|6">
<input type="hidden" id="hdnPhotoCaptionArray" name="hdnPhotoCaptionArray" value="a|b|c|d|e|f">