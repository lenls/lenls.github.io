<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8"/>

<xsl:template match="/">
  <xsl:apply-templates />
  </xsl:template>

<xsl:template match="workshop">
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8" />
<title>
<xsl:value-of select="//short" /> (<xsl:value-of select="//SndLine" /><xsl:text>&#x20;</xsl:text><xsl:value-of select="//TrdLine" />)
</title>
<link rel="stylesheet" type="text/css" />
<style>
<xsl:comment>
body {	
		color: black;
		font-size:16px;
		font-family:Century;
		}
A:link {
		color: gray;
		}
A:visited {
		color: gray;
		}
A:active {
		color: fuchsia;
		}
td {
		color:black;
		font-size:16px;
		font-family:Arial, Helvetica, sans-serif;
		}
.name {
		font-size:24px;
		text-align: center;
		}
.organization {
		font-size:18px;
		text-align: right;
		}
.title {
		font-size:20px;
		}
.email {
		text-align: right;
		}
.abstract { 
		border-style: dashed;
		border-width: thin;
		}
.tab {}
.c2 {	
		background: azure;
		}
.c1 {	
		background: aliceblue;
		}
.c0 {	
		background: lightskyblue;
		}
h1 {	
		color: skyblue;
		font-size: 30px;}
h2 {	
		color: white;
		font-weight: bold;
		font-size: 18px;
		background-color: skyblue;
		background-repeat: no-repeat;
		background-position: left bottom;
  		}
h3 {	
		color: lightskyblue;
		font-size: 16px;
		}
h4 {	
		color: #CC66CC;
		font-size: 14px;
		}
</xsl:comment>
</style>  
</head>
<body bgcolor="white" text="black">
      <center>
      <table border="0" cellspacing="10" cellpadding="10" width="800">
	<tr>
	<td class="c0" valign="top" width="150">
        <p><table border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td align="center">
             <img src="lambda.gif" width="142" height="197" />
             </td>
           </tr>
	   </table>
        </p>
        <br />
          <table border="0" cellspacing="5" cellpadding="5">
            <tr><td class="c1"><a href="#topics">Aim and Topics</a></td></tr>
            <xsl:if test="submission!=''"><tr><td class="c2"><a href="#submissions">Submission</a></td></tr></xsl:if>
            <xsl:if test="selectedpaper!=''"><tr><td class="c2"><a href="#selectedpapers">Selected Papers</a></td></tr></xsl:if>
            <xsl:if test="studentsession!=''"><tr><td class="c2"><a href="#studentsession">Student Session</a></td></tr></xsl:if>
            <xsl:if test="importantdates!=''"><tr><td class="c1"><a href="#dates">Important Dates</a></td></tr></xsl:if>
            <xsl:if test="registration!=''"><tr><td class="c2"><a href="#registration">Registration</a></td></tr></xsl:if>
            <xsl:if test="program!=''"><tr><td class="c1"><a href="#program">Program</a></td></tr></xsl:if>
            <xsl:if test="tutorial!=''"><tr><td class="c1"><a href="#tutorial">Tutorial Lecture</a></td></tr></xsl:if>
            <xsl:if test="sponsor!=''"><tr><td class="c2"><a href="#sponsor">Sponsor</a></td></tr></xsl:if>
            <xsl:if test="code!=''"><tr><td class="c1"><a href="#code">Conference Code of Conduct</a></td></tr></xsl:if>
            <tr><td class="c2"><a href="#committee">Program Committee</a></td></tr>
            <tr><td class="c1"><a href="#committee">Local Organizers</a></td></tr>
            <tr><td class="c2"><a href="#contact">Contact</a></td></tr>
            <tr><td class="c1">
              <table>
              <tr><td>Websites of the past editions</td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;LENLS1</td></tr>
              <xsl:for-each select="//archive">
                <tr><td>&#x20;&#x20;&#x20;&#x20;
                <a>
                <xsl:attribute name="href">../<xsl:value-of select="@website" />/index.html</xsl:attribute>
                <xsl:value-of select="@name" />
                </a>
                </td></tr>
              </xsl:for-each>
              </table>
            </td></tr>
            <tr><td class="c2">
              <a name="post-proceedings" />
              <table>
              <tr><td>Post-proceedings volumes</td></tr>
              <xsl:for-each select="//archive">
                <xsl:if test="@proceedings!=''">
                  <tr><td>&#x20;&#x20;&#x20;&#x20;
                  <a>
                  <xsl:attribute name="href"><xsl:value-of select="@proceedings" /></xsl:attribute>
                  <xsl:value-of select="@name" />
                  </a>
                  (<xsl:value-of select="@year" />)
                  </td></tr>
                  </xsl:if>
              </xsl:for-each>
              </table>
            </td></tr>
	    </table>
        </td>


        <td bgcolor="white" valign="top">
<h1><xsl:value-of select="//SndLine" /><xsl:text>&#x20;</xsl:text><xsl:value-of select="//TrdLine" /> (<xsl:value-of select="//short" />)</h1>

<xsl:apply-templates />

<a name="contact" />
<h2>Contact:</h2>
<xsl:value-of select="//email" />

</td>
</tr>
</table>
</center>
</body>
</xsl:template>

<xsl:template match="summary">
<table border="0" cellspacing="0" cellpadding="0" >
<tr><td>
  Venue(s): 
    <ul>
  <xsl:for-each select="site">
  <li>
    <table border="0" cellspacing="0" cellpadding="">
    <tr><td><xsl:value-of select="name" /></td></tr>
    <tr><td><xsl:value-of select="address" /></td></tr>
    <tr><td>
      <a>
      <xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
      <xsl:value-of select="url" />
      </a>
      <br />
      </td></tr>
    </table>
  </li>
  </xsl:for-each>
    </ul>
</td></tr>

<!--center-->
<!--table border="0" cellspacing="0" cellpadding="0" -->
<!--tr><td>Information/Registration：</td><td>5th Floor</td></tr-->
<!--tr><td>Conference Rooms：</td><td>5th and 6th Floor</td></tr-->
<!--/table-->
<!--/center-->

<tr><td>Dates: <xsl:value-of select="conferencedate" /></td></tr>

<tr><td>
Chair: 
  <ul>
  <xsl:for-each select="//pcmember[@role='chair']">
    <li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
  </xsl:for-each>
  </ul>
  </td></tr>
<tr><td>
Co-chairs: 
  <ul>
  <xsl:for-each select="//pcmember[@role='cochair']">
    <li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
  </xsl:for-each>
  </ul>
  </td></tr>
<tr><td>
Invited Speaker(s): 
  <ul>
  <xsl:for-each select="//invitedspeaker">
    <li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
  </xsl:for-each>
  </ul>
  </td></tr>
</table>
</xsl:template>

<xsl:template match="description">
<h2>Aim and topics</h2>
<a name="topics" />
<xsl:apply-templates />
</xsl:template>

<xsl:template match="p">
<p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="host">
<a>
  <xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
  <xsl:value-of select="." />
</a>
</xsl:template>

<xsl:template match="call">
<p><xsl:value-of select="." /></p>
</xsl:template>

<xsl:template match="topics">
<ul>
  <xsl:for-each select="topic">
  <li><xsl:value-of select="." /></li>
  </xsl:for-each>
</ul>
</xsl:template>

<xsl:template match="submission">
<a name="submissions" />
<h2>Submissions:</h2>
  <p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="url">
  <p>
  <a>
  <xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
  <xsl:value-of select="." />
  </a>
  </p>
</xsl:template>

<xsl:template match="selectedpaper">
<a name="selectedpapers" />
<h2>Selected Papers</h2>
<table>
<tr>
<td><xsl:value-of select="." /></td>
<td><a href="http://www.springer.com/lncs" target="blank"><img width="153" src="./LNCS-Logo.jpg" /></a></td>
</tr>
</table>
</xsl:template>

<xsl:template match="studentsession">
<a name="studentsession" />
<h2>Student Session</h2>
  <p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="registration">
<a name="registration" />
<h2>Registration:</h2>
  <p><xsl:value-of select="description1" /></p>
  <a>
    <xsl:attribute name="href"><xsl:value-of select="site" /></xsl:attribute>
    <xsl:value-of select="site" />
  </a>
  <p><xsl:value-of select="description2" /></p>
  <table>
  <xsl:for-each select="fee">
    <tr>
      <td><xsl:value-of select="@type" /></td>
      <td><b><xsl:value-of select="@price" /></b></td>
    </tr>
  </xsl:for-each>
  </table>
</xsl:template>

<xsl:template match="tutorial">
<a name="tutorial" />
<h2>Tutorial Lecture</h2>
<p>On <xsl:value-of select="@date" />, there will be a tutorial lecture at <xsl:value-of select="@venue" />.</p>

<h4>Lecturer</h4>
  <xsl:for-each select="lecturer">
    <xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)
  </xsl:for-each>

<h4>Venue</h4>
  <xsl:value-of select="@venue" />, <xsl:value-of select="@address" /> <a><xsl:attribute name="href"><xsl:value-of select="@map" /></xsl:attribute>[map]</a>

<h4>Time Table</h4>
<table>
 <tr><td>10:00-12:00</td><td>Session 1</td></tr>
 <tr><td>12:00-14:00</td><td>Lunch</td></tr>
 <tr><td>14:00-16:00</td><td>Session 2</td></tr>
</table>

<h4>Title</h4>
  <xsl:value-of select="title" />

<h4>Abstract</h4>
<xsl:copy-of select="//abstract" />
</xsl:template>

<xsl:template match="importantdates">
<a name="dates" />
<h2>Important dates:</h2>
<table border="0" cellspacing="4" cellpadding="0" >
<xsl:for-each select="importantdate">
<tr><td><xsl:value-of select="@name" /></td><td>:</td><td width="300">
<xsl:choose>
  <xsl:when test="@done='yes'"><s><xsl:value-of select="@date" /></s></xsl:when>
  <xsl:otherwise><xsl:value-of select="@date" /></xsl:otherwise>
</xsl:choose>
</td></tr>
</xsl:for-each>
</table>
<br/>
</xsl:template>

<xsl:template match="sponsors">
<h2>Sponsor</h2>
<a name="sponsor" />
<p>LENLS is being organized by an alliance of the following sponsors.</p>
<ul>
<xsl:for-each select="sponsor">
<li><xsl:value-of select="." /> <a><xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>[URL]</a></li>
</xsl:for-each>
</ul>
</xsl:template>

<xsl:template match="code">
<h2>Conference Code of Conduct</h2>
<a name="code" />
<xsl:apply-templates />
</xsl:template>

<xsl:template match="ct">
<h3><xsl:apply-templates /></h3>
</xsl:template>

<xsl:template match="cp">
<p><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="pcmembers">
<a name="committee" />
<h2>Program Committee:</h2>
<ul>
<xsl:for-each select="pcmember">
<li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
</xsl:for-each>
</ul>
</xsl:template>

<xsl:template match="localorganizers">
<a name="localorganizers" />
<h2>Local Organizers:</h2>
<ul>
<xsl:for-each select="localorganizer">
<li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
</xsl:for-each>
</ul>
</xsl:template>

<xsl:template match="lunchmap">
  <a name="lunchmap" />
  <h2>Lunch Map: </h2>
  <a>
  <xsl:attribute name="href">
    <xsl:value-of select="@url" />
  </xsl:attribute><xsl:value-of select="@url" />
  </a>
  </xsl:template>

<xsl:template match="onlineproceedings">
  <a name="onlineproceedings" />
  <h2>Online Proceedings</h2>
  Download from <a>
  <xsl:attribute name="href">
    <xsl:value-of select="@url" />
  </xsl:attribute>here</a>.
  </xsl:template>

<xsl:template match="program">
  <a name="program" />
  <h2>Program</h2>
  
  <!--a href="lenls13/LENLS13webproceedings.pdf">Proceedings of LENLS13</a-->
  <xsl:apply-templates />
  </xsl:template>

<xsl:template match="day">
<h3><xsl:value-of select="@date" /></h3>
  <xsl:apply-templates />
  </xsl:template>

<xsl:template match="event">
  <xsl:value-of select="@time" />
  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
  <xsl:value-of select="@name" />
  <br />
  </xsl:template>

<xsl:template match="session">
  <xsl:value-of select="@time" />
  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
  <xsl:value-of select="@name " />
  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
  <xsl:if test="@chair!=''">(Chair: <xsl:value-of select="@chair" />)</xsl:if>
  <ul>
  <xsl:apply-templates />
  </ul>
  </xsl:template>

<xsl:template match="zoom">
  <table>
  <tr><td>Zoom URL:</td><td>
    <a>
    <xsl:attribute name="href">
      <xsl:value-of select="@url" />
    </xsl:attribute>
    <xsl:value-of select="@url" />
    </a></td></tr>
  <tr><td>Meeting ID: </td><td><xsl:value-of select="@id" /></td></tr>
  <tr><td>Zoom password:</td><td><xsl:value-of select="." /></td></tr>
  </table><br />
  </xsl:template>

<xsl:template match="talk">
  <li>
    <xsl:choose>
      <xsl:when test="@format='online'">
        <b>[online]</b>
        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@exabst='none'">
        <b><span style='color:red'>[No abstract]</span></b>
        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:value-of select="@author" />
  </li>
  "<xsl:value-of select="@title" />"
  </xsl:template>

<xsl:template match="invitedtalk">
  <li><xsl:value-of select="@author" /></li>
    "<xsl:value-of select="@title" />"
  </xsl:template>

<xsl:template match="alternates">
<h4>Alternates</h4>
  <ul>
  <xsl:apply-templates />
  </ul>
  </xsl:template>

<xsl:template match="category">
  <b>[<xsl:value-of select="." />]</b>
  </xsl:template>

<xsl:template match="bar">|</xsl:template>

</xsl:stylesheet>
