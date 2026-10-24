<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8"/>
<xsl:strip-space elements="workshop program day session"/>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="workshop">（重複して受け取られた場合はご容赦ください）

今年の<xsl:value-of select="@month" />に<xsl:value-of select="@place" />で開催される <xsl:value-of select="//short" /> 国際学会の<xsl:choose><xsl:when test="program">参加案内</xsl:when><xsl:otherwise>ご案内</xsl:otherwise></xsl:choose>をお送り致します。
皆様のご参加をお待ちしております。

戸次大介（お茶の水女子大学）


<xsl:apply-templates/>
</xsl:template>

<xsl:template match="summary">[Apologies for multiple copies]
=================================================================
<!-- once a program is published, the mail is a call for participation -->
<xsl:choose><xsl:when test="ancestor::workshop/program"><xsl:text>                   CALL FOR PARTICIPATION</xsl:text></xsl:when>
<xsl:otherwise><xsl:text>                      </xsl:text><xsl:value-of select="title" /></xsl:otherwise></xsl:choose><xsl:text disable-output-escaping="yes">&#xD;&#xA;&#xD;&#xA;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>

<xsl:value-of select="SndLine" /><xsl:text disable-output-escaping="yes">&#xD;&#xA;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>

<xsl:value-of select="TrdLine" /> (<xsl:value-of select="short" />)

Workshop Site : <xsl:for-each select="ancestor::workshop/summary/site | site"><xsl:value-of select="name" />
<xsl:for-each select="address | url"><xsl:text>&#10;                </xsl:text><xsl:value-of select="." /></xsl:for-each></xsl:for-each>
Dates         : <xsl:value-of select="conferencedate" />
Contact Person: <xsl:value-of select="ancestor::workshop/pcmembers/pcmember[@role='chair']/@name" /> (<xsl:value-of select="ancestor::workshop/pcmembers/pcmember[@role='chair']/@affiliation" />)
Contact Email : <xsl:value-of select="email" />
Website       : <xsl:value-of select="website" />
=================================================================

Chair:  <xsl:for-each select="ancestor::workshop/pcmembers/pcmember[@role='chair']"><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</xsl:for-each>
Co-chair: <xsl:for-each select="ancestor::workshop/pcmembers/pcmember[@role='cochair']"><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)<xsl:text disable-output-escaping="yes">&#xD;&#xa;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>
</xsl:for-each>
Invited Speakers:<xsl:for-each select="invitedspeaker">
- <xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</xsl:for-each></xsl:template>

<xsl:template match="generaldescription"><xsl:apply-templates /></xsl:template>

<xsl:template match="host"><xsl:value-of select="text()" /> (<xsl:value-of select="@url" />)</xsl:template>

<xsl:template match="description"><xsl:apply-templates /></xsl:template>

<xsl:template match="p"><xsl:apply-templates /></xsl:template>

<xsl:template match="call">
Aims and topics:
================<xsl:value-of select="." />
</xsl:template>

<xsl:template match="topics">

<xsl:for-each select="topic">
- <xsl:value-of select="text()" />
</xsl:for-each>

</xsl:template>

<xsl:template match="submission">


Submissions:
============<xsl:apply-templates /></xsl:template>

<xsl:template match="category">[<xsl:value-of select="." />]</xsl:template>

<xsl:template match="selectedpaper">

Selected Papers:
================<xsl:value-of select="." /></xsl:template>

<xsl:template match="registration"><xsl:text>&#10;&#10;Registration:&#10;=============&#10;</xsl:text>
<xsl:value-of select="normalize-space(description1)" /><xsl:text>&#10;</xsl:text>
<xsl:value-of select="site" />
<xsl:value-of select="description2" />
<xsl:for-each select="fee"><xsl:text>&#10;  - </xsl:text><xsl:value-of select="@type" /><xsl:value-of select="@price" /></xsl:for-each>
<xsl:text>&#10;&#10;</xsl:text>
</xsl:template>

<xsl:template match="studentsession">
Student Session:
================<xsl:value-of select="." />
</xsl:template>

<xsl:template match="importantdates">

Important dates:
================
<xsl:for-each select="importantdate">
<xsl:choose><xsl:when test="@done='yes'"></xsl:when><xsl:otherwise>  <xsl:value-of select="@name" />: <xsl:value-of select="@date" /><xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text></xsl:otherwise></xsl:choose></xsl:for-each></xsl:template>

<!-- program: one blank line between items; <program status="tentative"> adds "(tentative)" and a note -->
<xsl:template match="program">
<xsl:choose>
<xsl:when test="@status='tentative'"><xsl:text>Program (tentative):&#10;====================&#10;The program is tentative and may be subject to change.&#10;</xsl:text></xsl:when>
<xsl:otherwise><xsl:text>Program:&#10;========&#10;</xsl:text></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates /></xsl:template>

<xsl:template match="day"><xsl:text>&#10;</xsl:text><xsl:value-of select="@date" /><xsl:text>&#10;--------------------------&#10;</xsl:text><xsl:apply-templates /></xsl:template>

<xsl:template match="event"><xsl:text>&#10;</xsl:text><xsl:value-of select="@time" />: <xsl:value-of select="@name" /><xsl:text>&#10;</xsl:text></xsl:template>

<xsl:template match="session"><xsl:text>&#10;</xsl:text><xsl:value-of select="@time" />:<xsl:if test="@name!=''"><xsl:text> </xsl:text><xsl:value-of select="@name" /></xsl:if><xsl:text>&#10;</xsl:text><xsl:apply-templates /></xsl:template>

<xsl:template match="talk | invitedtalk"><xsl:text>    * </xsl:text><xsl:value-of select="@author" /><xsl:text>&#10;      "</xsl:text><xsl:value-of select="@title" /><xsl:text>"&#10;</xsl:text></xsl:template>

<xsl:template match="alternates">Alternates
----------<xsl:apply-templates /></xsl:template>

<xsl:template match="archives" />

<xsl:template match="code" />

<xsl:template match="tutorial">Tutorial Lecture:
=================
  On <xsl:value-of select="@date" />, there will be a tutorial lecture at 
  <xsl:value-of select="@venue" />.

Lecturer: <xsl:for-each select="lecturer"><xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)</xsl:for-each>

Venue: <xsl:value-of select="@venue" /> 
  <xsl:value-of select="@address" />
  (<xsl:value-of select="@map" />)

Time Table:
  10:00-12:00 Session 1
  12:00-14:00 Lunch
  14:00-16:00 Session 2

Title: <xsl:value-of select="title" />

Abstract
--------<xsl:value-of select="//abstract" />
</xsl:template>

<xsl:template match="satelliteevent">

Pre-conference Event:
=====================
<xsl:value-of select="@name" />

  Date: <xsl:value-of select="@date" />
  Venue: Takigawa Memorial Hall 2F, Large Conference Room, Kobe University (+ Zoom)
  Language: English

  Registration: free of charge; separate registration required
  (deadline: <xsl:value-of select="@regdeadline" />)

  This symposium is held as a pre-conference event of LENLS22 at the
  same venue. Participation does not require LENLS22 registration, and
  those who are not participating in LENLS22 are also welcome. Whether
  online or in person, please register separately via the official
  page:
  <xsl:value-of select="@url" />
</xsl:template>

<xsl:template match="sponsors">

Sponsors:
=========
LENLS is being organized by an alliance of the following sponsors.
<xsl:for-each select="sponsor">
- <xsl:value-of select="." />
</xsl:for-each>
</xsl:template>

<!-- the AI use policy is for submitting authors; omitted from the call for participation -->
<xsl:template match="aipolicy[ancestor::workshop/program]" />

<xsl:template match="aipolicy">

AI Use Policy:
==============
<xsl:apply-templates />
</xsl:template>

<xsl:template match="code">


Code of Conduct:
================<xsl:apply-templates />
</xsl:template>

<xsl:template match="ct">
[<xsl:value-of select="." />] </xsl:template>

<xsl:template match="cp"><xsl:value-of select="." /></xsl:template>

<xsl:template match="studentsession">
Student Session:
================<xsl:value-of select="." />
</xsl:template>

<xsl:template match="pcmembers">

Program Committee:
==================
<xsl:for-each select="pcmember">  - <xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text></xsl:for-each>
</xsl:template>

<xsl:template match="localorganizers">

Local Organizers:
=================
<xsl:for-each select="localorganizer">  - <xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text></xsl:for-each></xsl:template>

<xsl:template match="bar"> | </xsl:template>

</xsl:stylesheet>
