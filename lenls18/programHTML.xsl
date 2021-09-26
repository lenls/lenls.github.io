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
		color: #FF0066;
		}
td {
		color:black;
		font-size:16px;
		font-family:Arial, Helvetica, sans-serif;
		}
h1 {	
		color: #d2b48c;
		font-size: 30px;}
h2 {	
		color: white;
		font-weight: bold;
		font-size: 18px;
#		background-image: url(http://www.is.ocha.ac.jp/~bekki/lenls/bar.gif);
#		background-image: url(bar.gif);
		background-color: #f0e68c;
		background-repeat: no-repeat;
		background-position: left bottom;
  		}
h3 {	
		color: CC3399;
		font-size: 16px;
		}
h4 {	
		color: CC66CC;
		font-size: 14px;
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
		background: white;
		}
.c1 {	
		background: #fffaf0;
		}
</xsl:comment>
</style>  
</head>
<body bgcolor="white" text="black">
      <center>
      <table border="0" cellspacing="10" cellpadding="10" width="800">
	<tr>
	<td bgcolor="#fffacd" valign="top" width="150">
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
            <xsl:if test="selectedpaper!=''"><tr><td class="c1"><a href="#selectedpapers">Selected Papers</a></td></tr></xsl:if>
            <xsl:if test="studentsession!=''"><tr><td class="c2"><a href="#studentsession">Student Session</a></td></tr></xsl:if>
            <xsl:if test="importantdates!=''"><tr><td class="c1"><a href="#dates">Important Dates</a></td></tr></xsl:if>
            <xsl:if test="registration!=''"><tr><td class="c2"><a href="#registration">Registration</a></td></tr></xsl:if>
            <xsl:if test="program!=''"><tr><td class="c2"><a href="#program">Program</a></td></tr></xsl:if>
            <xsl:if test="tutorial!=''"><tr><td class="c1"><a href="#tutorial">Tutorial Lecture</a></td></tr></xsl:if>
            <xsl:if test="sponsor!=''"><tr><td class="c2"><a href="#sponsor">Sponsor</a></td></tr></xsl:if>
            <xsl:if test="code!=''"><tr><td class="c1"><a href="#code">Conference Code of Conduct</a></td></tr></xsl:if>
            <tr><td class="c2"><a href="#committee">Organizing Committee</a></td></tr>
            <tr><td class="c1"><a href="#contact">Contact</a></td></tr>
            <tr><td class="c2">
              <table>
              <tr><td>Archives</td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;LENLS1</td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls2/index.html">LENLS2</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls3/index.html">LENLS3</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls4/index.html">LENLS4</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls5/index.html">LENLS5</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls6/index.html">LENLS6</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls7/index.html">LENLS7</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls8/index.html">LENLS8</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls9/index.html">LENLS9</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls10/index.html">LENLS10</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls11/index.html">LENLS11</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls12/index.html">LENLS12</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls13/index.html">LENLS13</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls14/index.html">LENLS14</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls15/index.html">LENLS15</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls16/index.html">LENLS16</a></td></tr>
              <tr><td>&#x20;&#x20;&#x20;&#x20;<a href="../lenls17/index.html">LENLS17</a></td></tr>
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

<xsl:template match="site">

</xsl:template>

<xsl:template match="summary">
<table border="0" cellspacing="0" cellpadding="0" >
<tr><td>**Online** only</td></tr>
<!--tr><td>
  <table border="0" cellspacing="0" cellpadding="5" >
  <td>
  <xsl:for-each select="//site">
  <table border="0" cellspacing="0" cellpadding="" >
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
  </xsl:for-each>
  </td></tr>
  </table>
</td></tr-->

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
  <xsl:for-each select="//organizer[@role='chair']">
    <li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
  </xsl:for-each>
  </ul>
  </td></tr>
<tr><td>
Co-chairs: 
  <ul>
  <xsl:for-each select="//organizer[@role='cochair']">
    <li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
  </xsl:for-each>
  </ul>
  </td></tr>
<tr><td>
Invited Speakers: 
  <ul>
  <xsl:for-each select="//invitedspeaker">
    <li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
  </xsl:for-each>
  </ul>
  </td></tr>
</table>
</xsl:template>

<xsl:template match="description">
<h2>Aim and Topics</h2>
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
<td>
A selection of the accepted/invited full papers will be published as a portion of a volume "JSAI-isAI selected papers" from 'Lecture Notes in Artificial Intelligence (LNAI)' series (Springer Verlag).
</td>
<td><a href="http://www.springer.com/lncs" target="blank"><img src="./cda_displayimage.jpg" /></a></td>
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

  <p>Please follow the link below and register yourself until <xsl:value-of select="@deadline" />.
     Note that the zoom URL of the workshop will be informed to the registered persons only.
  </p>

  <a>
    <xsl:attribute name="href"><xsl:value-of select="@site" /></xsl:attribute>
    <xsl:value-of select="@site" />
  </a>
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
<tr><td><xsl:value-of select="@name" /></td><td>:</td><td width="200">
<xsl:choose>
  <xsl:when test="@done='yes'"><s><xsl:value-of select="@date" /></s></xsl:when>
  <xsl:otherwise><xsl:value-of select="@date" /></xsl:otherwise>
</xsl:choose>
</td></tr>
</xsl:for-each>
</table>
<br/>
</xsl:template>

<xsl:template match="sponsor">
<h2>Sponsor</h2>
<a name="sponsor" />
<p><xsl:apply-templates /></p>
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

<xsl:template match="organizers">
<a name="committee" />
<h2>Organizing/Program Committee:</h2>
<ul>
<xsl:for-each select="organizer">
<li><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</li>
</xsl:for-each>
</ul>
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

<xsl:template match="talk">
  <li><xsl:value-of select="@author" /></li>
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

</xsl:stylesheet>
