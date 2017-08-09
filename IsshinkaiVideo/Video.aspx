<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Video.aspx.cs" Inherits="Video_Video" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issinkai - Videos</title>
</head>
<style type="text/css">
<!--
body {
	background-color: #993300;
}
-->
</style>
<script type="text/JavaScript">
<!--

    function MM_swapImgRestore() { //v3.0
        var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
    }

    function MM_preloadImages() { //v3.0
        var d = document; if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
        }
    }

    function MM_findObj(n, d) { //v4.01
        var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
        var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
            if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
    }
//-->
</script>
<style type="text/css">
<!--
p.MsoNormal {
margin:0in;
margin-bottom:.0001pt;
font-size:12.0pt;
font-family:"Times New Roman";
}
.style6 {
	font-family: "Times New Roman", Times, serif;
	font-size: 14px;
}
#Layer1 {
	position:absolute;
	left:604px;
	top:262px;
	width:226px;
	height:320px;
	z-index:1;
	clip: rect(auto,auto,auto,12);
}
.style13 {font-family: "Times New Roman", Times, serif; font-size: 12px; }
.style28 {
	font-family: "Times New Roman", Times, serif;
	font-size: 14px;
}
.style30 {font-family: "Times New Roman", Times, serif; font-size: 11px; font-style: italic; }
-->
</style>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('http://www.isshinkai.net/images/Issinkai-sideglo_05.gif','http://www.isshinkai.net/images/Issinkai-sideglo_07.gif','http://www.isshinkai.net/images/Issinkai-sideglo_09.gif','http://www.isshinkai.net/images/Issinkai-sideglo2_11.gif','http://www.isshinkai.net/images/Issinkai-sideglo_13.gif','http://www.isshinkai.net/images/Issinkai-sideglo2_15.gif','http://www.isshinkai.net/images/Issinkai-sideglo_17.gif','http://www.isshinkai.net/images/Issinkai-sideglo_19.gif','http://www.isshinkai.net/images/Issinkai-sideglo_21.gif','http://www.isshinkai.net/images/Issinkai-sideglo_25.gif','http://www.isshinkai.net/images/Issinkai-sideglo2_27.gif','http://www.isshinkai.net/images/Issinkai-sideglo_29.gif','http://www.isshinkai.net/images/Issinkai-sideglo_31.gif','http://www.isshinkai.net/images/Issinkai-sideglo2_33.gif','http://www.isshinkai.net/images/Issinkai-sideglo_37.gif','http://www.isshinkai.net/images/Issinkai-sideglo_39.gif','http://www.isshinkai.net/images/Issinkai-sideglo_43.gif','http://www.isshinkai.net/images/Issinkai-sideglo_45.gif','http://www.isshinkai.net/images/Issinkai-sideglo_47.gif','http://www.isshinkai.net/images/Issinkai-sideglo_11.gif','http://www.isshinkai.net/images/Issinkai-sidebar_13.gif','http://www.isshinkai.net/images/Issinkai-sideglo_15.gif','http://www.isshinkai.net/images/Issinkai-sideglo_06.gif')">
    <form id="form1" runat="server">
    <!-- ImageReady Slices (Issinkai-final2.psd) -->
<table width="790" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" background="http://www.isshinkai.net/images/Issinkai-sidebar_49.gif"><table width="800" border="0" cellpadding="0" cellspacing="0" background="../../Sidebar 2/images/Issinkai-sidebar_49a.gif" id="Table_01">
      <tr>
        <td><table width="800" border="0" cellpadding="0" cellspacing="0" background="../../Sidebar 2/images/Issinkai-sidebar_49a.gif" id="Table_01">
          <tr>
            <td><img src="http://www.isshinkai.net/images/Issinkai-sidebar_01.gif" width="170" height="86" alt=""></td>
            <td><img src="http://www.isshinkai.net/images/Issinkai-sidebar_02.gif" alt="" width="630" height="86"></td>
          </tr>
        </table></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td width="170" valign="top" background="http://www.isshinkai.net/images/Issinkai-sidebar_49.gif"><table width="96" height="514" border="0" cellpadding="0" cellspacing="0" background="http://www.isshinkai.net/images/Issinkai-sidebar_49.gif" id="Table_">
      <tr>
        <td valign="top"><img src="../images/Issinkai-sidebar-VideoLogIn.jpg" width="170" height="96" alt=""></td>
      </tr>
      
      <tr>
        <td><img src="http://www.isshinkai.net/images/Issinkai-sidebar_49.gif" width="170" height="4" alt=""></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      
    </table></td>
    <td width="630" valign="top" bgcolor="#FFFFCC"><br>
      <table width="560" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="560" valign="top"><br>
          <table width="548" border="0" cellspacing="0" cellpadding="2">
            <tr>
              <td><p align="center" class="style28"><img src="http://www.isshinkai.net/artwork/Issinkai-Video-Logo.gif" width="213" height="164"></p>
                  <p align="center" class="style28"><b>
                      Isshin-ryu kata performed by Arcenio Advincula</b>
</p>
                  <p align="left" class="style28">"In early 1973 I attended a seminar at Dixie National 
                      Karate Dojo in Bossier City, La. I was a green belt at the time &amp; had been 
                      training there about a year. I was the only non-black belt in attendance. I was 
                      alone in the dressing room &amp; I heard what I thought was a gunshot in the workout 
                      area. I momentarily froze. I heard it 10 or 12 more times. Then all of a sudden 
                      it was like someone ripping a cloth or a sheet. Only it was loud....real loud. 
                      It was so fast I couldn&#39;t distinguish one shot from another. It had to be a 
                      machine gun! After a few seconds, I eased to the doorway &amp; peeked through the 
                      curtain to see what was going on. To my amazement, I saw this little man 
                      standing in front of the mirror. He had really short hair &amp; was wearing black 
                      rimmed glasses held on by an elastic strap. I noticed that the sleeves on his 
                      new looking gi were frayed. He placed his fists on his hips &amp; started 
                      punching.That was the sound I heard....his sleeves snapping as he punched. That 
                      was my very first experience with Sensei Advincula. He made quite an impression 
                      on me. What I witnessed that day motivated me to continue my training for 30 
                      years &amp; counting!" </br>--- Clyde Stanley 
                      </br>
                      <span class="style13">*from <a href="http://sports.groups.yahoo.com/group/isshinkaiKarate" target="_blank">sports.groups.yahoo.com/group/isshinkaiKarate</a> Message #4871, Sat Dec 29, 2001 2:47 pm</span>

</p>
                  <p align="left" class="style28">“Shimabuku Tatsuo Sensei tell me, watch Gancho. He number-one kata.” 
                  </br>--- Kensho Tokumura a student of Sensei Tatsuo Shimabuku (1958-1961). 
</p>
                  <p align="left" class="style28">Tokumura explained that Shimabuku Tatsuo Sensei used to call Advincula 
‘Gancho’ which means glasses in Okinanawn language and explained that Shimabuku Tatsuo Sensei also called Advincula, Katagwa. Katagwa meaning Kata-man, because he was excellent in kata. The ‘gwa’ meaning ‘small in size’ compared to other Americans. 
</p>
                <table width="500" border="1" align="center" valign="top">
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Seisan</div>
                            Sensei Advincula demonstrates Seisan kata.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSEISAN', 'Test', 'width=730,height=630,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSEISAN', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Seiunchin</div>
                            Sensei Advincula demonstrates Seiunchin kata.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSeiunchin', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSeiunchin', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Naihanchi</div>
                            Sensei Advincula demonstrates Naihanchi kata.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoNaihanchi', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoNaihanchi', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Wansu</div>
                            Sensei Advincula demonstrates Wansu kata.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoWansu', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoWansu', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Chinto</div>
                            Sensei Advincula demonstrates Chinto kata.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoChinto', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoChinto', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Kusanku</div>
                            Sensei Advincula demonstrates Kusanku kata.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoKusanku', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoKusanku', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Sunsu</div>
                            Sensei Advincula demonstrates Sunsu kata.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSUNUSU', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSUNUSU', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>


		    <tr>
                        <td valign="top"><div style="text-decoration:underline">Seisan PISC</div>
                            Advincula performs Seisan 1973, Laurel Bay, SC
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSEISANPISC', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSEISANPISC', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Seiunchin PISC</div>
                            Advincula performs Seiunchin 1973, Laurel Bay, SC
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSEIUNCHINPISC', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSEIUNCHINPISC', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Naihanchi PISC</div>
                            Advincula performs Naihanchi 1973, Laurel Bay, SC
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoNAIHANCHIPISC', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoNAIHANCHIPISC', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Wansu PISC</div>
                            Advincula performs Wansu 1973, Laurel Bay, SC
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoWANSUPISC', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoWANSUPISC', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Sanchin 1973</div>
                            Advincula performs Sanchin 1973, Laurel Bay, SC
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSANCHIN1973', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSANCHIN1973', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Sanchin PISC 1973</div>
                            Advincula performs Sanchin, PISC 1973
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSANCHIN', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoSANCHIN', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Chinto 2011</div>
                            Chinto 2011 Miyagi Atsushi's Shorin-Ryu students perform Chinto Kata at Uezu, Uruma City, Okinawa. This is through Kaneshi, Eiko's lineage.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoChinto2011', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoChinto2011', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Advincula Teaches the USMC - Leading Marines In Demonstration</div>
                            Advincula Teaches the USMC - Leading Marines In Demonstration.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=LeadingMarinesInDemonstration', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=LeadingMarinesInDemonstration', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Advincula Teaches the USMC - Sensei Walks Over A Marine</div>
                            Advincula Teaches the USMC - Sensei Walks Over A Marine.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=SenseiWalksOverAMarine', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=SenseiWalksOverAMarine', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Advincula Teaches the USMC - Sensei Demonstrates Defense Against Two Marines</div>
                            Advincula Teaches the USMC - Sensei Demonstrates Defense Against Two Marines.
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=SenseiDemonstratesDefenseAgainstTwoMarines', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=SenseiDemonstratesDefenseAgainstTwoMarines', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Advincula and Ciso Shimabuku presentation of Tatsuo Shimabuku's Bo cover</div>
                            Interview between Advincula and Ciso Shimabuku where Ciso presents Tatsuo Shimabuku's Bo cover to Advincula
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=VideoBoCoverLargeStreamed', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=VideoBoCoverLargeStreamed', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><div style="text-decoration:underline">Advincula Sensei interview with Nakazato Sensei (1997)</div>
                            Interview between Advincula Sensei and Nakazato Sensei in 1997
                        </td>
                        <td>
                        <div align="center"><img src="../images/windows_media_player.png" style="cursor:pointer" width="50" height="50" alt="" onclick="window.open('VideoStreaming.aspx?VideoName=AdvinculaSenseiInterviewWithNakazatoSensei', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');"/> 
                        <br /><a class="style30"  href="#" onclick="window.open('VideoStreaming.aspx?VideoName=AdvinculaSenseiInterviewWithNakazatoSensei', 'Test', 'width=680,height=530,scrollbars=yes,resizable=yes');">(Click to play)</a></div>
                        </td>
                    </tr>

                </table>
                <br>
                <table width="500" align="center">
                <!--<tr><td align="center"><asp:LinkButton ID="lbLogoff" class="style30" 
                  runat="server" onclick="lbLogoff_Click">(logoff)</asp:LinkButton></td></tr>-->
          <tr><td align="center"><a href="http://www.isshinkai.net/" class="style30">(back) </a></td></tr></table>
          
                <p align="center" class="style28">
                All Videos are Copyrighted by A.J. Advincula. <br>
                Any unauthorized use of these Videos is Expressly Prohibited.</p></td>
            </tr>
            </table>
                    
          <p align="center" class="style6"><span class="style13">A.J.Advincula &copy; 2012 -  All Rights Reserved.</span><br>
            <br>
            <br>
          </p></td>
        </tr>
    </table></td>
  </tr>
</table>
    </form>
</body>
</html>
