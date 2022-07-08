<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8"/>

<xsl:template match="/">
  <xsl:apply-templates />
  </xsl:template>

<xsl:template match="workshop">
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=shift-jis" />
<title>
<xsl:value-of select="//short" /> (<xsl:value-of select="//SndLine" /><xsl:text>&#x20;</xsl:text><xsl:value-of select="//TrdLine" />)
</title>
<link rel="stylesheet" type="text/css" />
<style>
<xsl:comment>
body {		color: black;
		font-size:16px;
		font-family:Century;}
A:link {	color: gray;}
A:visited {	color: gray;}
A:active {	color: #FF0066;}
td {		color:black;
		font-size:16px;
		font-family:Arial, Helvetica, sans-serif;}
		}
h1 {		color: #CC99FF;
		font-size: 30px;}
h2 {		color: white;
		font-weight: bold;
		font-size: 18px;
#		background-image: url(http://www.is.ocha.ac.jp/~bekki/lenls/bar.gif);
		background-image: url(bar.gif);
		background-repeat: no-repeat;
		background-position: left bottom;
  		}
h3 {		color: CC3399;
		font-size: 16px;
		}
h4 {		color: CC66CC;
		font-size: 14px;
		}
.name {		font-size:24px;
		text-align: center;}
.organization {	font-size:18px;
		text-align: right;}
.title {	font-size:20px;}
.email {	text-align: right;}
.abstract { border-style: dashed;
			border-width: thin;}
.tab {}
.c1 {		background: #FFE4E1;}
.c2 {		background: #FFFFF0;}
</xsl:comment>
</style>  
</head>
<body bgcolor="skyblue" text="black">
      <center>
      <table border="0" cellspacing="10" cellpadding="10" width="750">
	<tr>
        <td bgcolor="white" valign="top">

<h1 align="center"><xsl:value-of select="//short" /></h1>
<blockquote>
<xsl:apply-templates select="program" />
<xsl:apply-templates select="alternates" />
</blockquote>

</td>
</tr>
</table>
</center>
</body>
</xsl:template>

<xsl:template match="talk">
  <a>
  <xsl:attribute name="href"><xsl:value-of select="//short" />_paper_<xsl:value-of select="@number" />.pdf</xsl:attribute>
  <xsl:value-of select="@title" />
  </a>
  <br />
  <i><xsl:value-of select="@author" /></i>
  <br />
  <br />
  </xsl:template>

<xsl:template match="invitedtalk">
  <a>
  <xsl:attribute name="href"><xsl:value-of select="@number" />.pdf</xsl:attribute>
  <xsl:value-of select="@title" />
  </a> (Invited Talk)
  <br />
  <i><xsl:value-of select="@author" /></i>
  <br />
  <br />
  </xsl:template>

</xsl:stylesheet>
