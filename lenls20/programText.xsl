<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8"/>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="workshop">（重複して受け取られた場合はご容赦ください）

今年の<xsl:value-of select="@month" />に<xsl:value-of select="@place" />で開催される <xsl:value-of select="//short" /> 
国際ワークショップのご案内をお送り致します。皆様のご参加をお待ちし
ております。

戸次大介（お茶の水女子大学）
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="summary">[Apologies for multiple copies]
=================================================================
                      <xsl:value-of select="title" /><xsl:text disable-output-escaping="yes">&#xD;&#xA;&#xD;&#xA;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>

<xsl:value-of select="SndLine" /><xsl:text disable-output-escaping="yes">&#xD;&#xA;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;&#x20;</xsl:text>

<xsl:value-of select="TrdLine" /> (<xsl:value-of select="short" />)

Workshop Site : <xsl:for-each select="//site">
                  <xsl:value-of select="name" />
                  <xsl:for-each select="address">
                    　<xsl:value-of select="." />
                    </xsl:for-each>
                  <xsl:for-each select="url">
                    　<xsl:value-of select="." />
                    </xsl:for-each>
                  </xsl:for-each>
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

<xsl:template match="selectedpaper">Selected Papers:
================<xsl:value-of select="." /></xsl:template>

<xsl:template match="registration">Registration:
=============<xsl:value-of select="." />
  <xsl:value-of select="@site" />
  Deadline: <xsl:value-of select="@deadline" />


</xsl:template>

<xsl:template match="studentsession">
Student Session:
================<xsl:value-of select="." />
</xsl:template>

<xsl:template match="importantdates">Important dates:
================
<xsl:for-each select="importantdate">
<xsl:choose><xsl:when test="@done='yes'"></xsl:when><xsl:otherwise>  <xsl:value-of select="@name" />: <xsl:value-of select="@date" /><xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text></xsl:otherwise></xsl:choose></xsl:for-each></xsl:template>

<xsl:template match="program">Program:
========<xsl:apply-templates /></xsl:template>

<xsl:template match="day">
<xsl:value-of select="@date" />--------------------------<xsl:apply-templates /></xsl:template>

<xsl:template match="event">
<xsl:value-of select="@time" />:<xsl:value-of select="@name" /></xsl:template>

<xsl:template match="session">
<xsl:value-of select="@time" />:<xsl:value-of select="@name" /><xsl:apply-templates /></xsl:template>

<xsl:template match="talk">  * <xsl:value-of select="@author" />
      "<xsl:value-of select="@title" />"</xsl:template>

<xsl:template match="invitedtalk">  * <xsl:value-of select="@author" />
      "<xsl:value-of select="@title" />"</xsl:template>

<xsl:template match="alternates">Alternates
----------<xsl:apply-templates /></xsl:template>

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

<xsl:template match="sponsor">Sponsor:
========<xsl:apply-templates />
</xsl:template>

<xsl:template match="code">Code of Conduct:
================<xsl:apply-templates />
</xsl:template>

<xsl:template match="ct">
[<xsl:value-of select="." />] </xsl:template>

<xsl:template match="cp"><xsl:value-of select="." /></xsl:template>

<xsl:template match="studentsession">
Student Session:
================<xsl:value-of select="." />
</xsl:template>

<xsl:template match="pcmembers">Program Committee:
======================================
<xsl:for-each select="pcmember">  - <xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text></xsl:for-each></xsl:template>

<xsl:template match="localorganizers">Local Organizers:
======================================
<xsl:for-each select="localorganizer">  - <xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)<xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text></xsl:for-each></xsl:template>

<xsl:template match="bar"> | </xsl:template>

</xsl:stylesheet>
