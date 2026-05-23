<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
  <xsl:apply-templates />
</xsl:template>

<!-- ════════════════════════════════════════════════════
     workshop: ページ全体の骨格
     ════════════════════════════════════════════════════ -->
<xsl:template match="workshop">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>
  <xsl:value-of select="//short" />
  <xsl:text> — </xsl:text>
  <xsl:value-of select="//SndLine" />
  <xsl:text> </xsl:text>
  <xsl:value-of select="//TrdLine" />
</title>
<!-- Google Fonts: Playfair Display (見出し) + Inter (本文) -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&amp;family=Inter:wght@400;500;600&amp;display=swap" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<!-- チェックボックスハック: モバイルドロワー開閉 -->
<input type="checkbox" id="nav-toggle" class="nav-toggle-input" />
<label for="nav-toggle" class="nav-overlay"></label>

<!-- モバイルドロワー（右からスライドイン） -->
<nav class="mobile-drawer">
  <div class="mobile-drawer-header">
    <span class="drawer-conf-name"><xsl:value-of select="//short" /></span>
    <label for="nav-toggle" class="nav-close-btn" aria-label="Close">&#x2715;</label>
  </div>
  <div class="mobile-drawer-links">
    <a href="#topics">Aim &amp; Topics</a>
    <xsl:if test="submission!=''"><a href="#submissions">Submission</a></xsl:if>
    <xsl:if test="selectedpaper!=''"><a href="#selectedpapers">Selected Papers</a></xsl:if>
    <xsl:if test="onlineproceedings">
      <xsl:if test="onlineproceedings/@url!=''"><a href="#onlineproceedings">Online Proceedings</a></xsl:if>
    </xsl:if>
    <xsl:if test="importantdates!=''"><a href="#dates">Important Dates</a></xsl:if>
    <xsl:if test="registration!=''"><a href="#registration">Registration</a></xsl:if>
    <xsl:if test="program!=''"><a href="#program">Program</a></xsl:if>
    <xsl:if test="sponsors!=''"><a href="#sponsors">Sponsors</a></xsl:if>
    <xsl:if test="code!=''"><a href="#code">Code of Conduct</a></xsl:if>
    <a href="#committee">Program Committee</a>
    <a href="#localorganizers">Local Organizers</a>
    <a href="#contact">Contact</a>
  </div>
  <div class="mobile-drawer-archives">
    <div class="drawer-archive-label">Past Editions</div>
    <div class="chip-group">
      <span class="chip-dead">LENLS1</span>
      <xsl:for-each select="//archive">
        <a>
          <xsl:attribute name="href">../<xsl:value-of select="@website" />/index.html</xsl:attribute>
          <xsl:value-of select="@name" />
        </a>
      </xsl:for-each>
    </div>
  </div>
</nav>

<!-- トップナビゲーションバー -->
<header class="site-header">
  <div class="site-header-inner">
    <a href="#" class="header-logo">
      <svg xmlns="http://www.w3.org/2000/svg" width="26" height="32" viewBox="0 0 68 84" aria-hidden="true">
        <text x="34" y="70" text-anchor="middle" font-size="78"
              font-family="Georgia,'Times New Roman',serif"
              font-style="italic" fill="rgba(255,255,255,0.9)">&#955;</text>
      </svg>
      <span><xsl:value-of select="//short" /></span>
    </a>
    <nav class="header-nav">
      <a href="#topics">Topics</a>
      <xsl:if test="importantdates!=''"><a href="#dates">Dates</a></xsl:if>
      <xsl:if test="registration!=''"><a href="#registration">Registration</a></xsl:if>
      <xsl:if test="program!=''"><a href="#program">Program</a></xsl:if>
      <a href="#committee">Committee</a>
      <a href="#contact">Contact</a>
    </nav>
    <label for="nav-toggle" class="nav-toggle-btn" aria-label="Open navigation">&#x2261;</label>
  </div>
</header>

<!-- ヒーローセクション -->
<section class="hero">
  <div class="hero-content">
    <p class="hero-eyebrow"><xsl:value-of select="//short" /></p>
    <h1 class="hero-title">
      <xsl:value-of select="//SndLine" />
      <br />
      <xsl:value-of select="//TrdLine" />
    </h1>
    <p class="hero-meta">
      <xsl:value-of select="//conferencedate" />
      <xsl:if test="//site/name != ''">
        <xsl:text> · </xsl:text>
        <xsl:value-of select="//site/name" />
      </xsl:if>
    </p>
    <xsl:if test="//invitedspeaker">
      <div class="hero-speakers">
        <span class="hero-speakers-label">Invited Speakers</span>
        <xsl:for-each select="//invitedspeaker">
          <span class="hero-speaker-item">
            <xsl:value-of select="@name" />
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@affiliation" />
            <xsl:text>)</xsl:text>
          </span>
          <xsl:if test="position()!=last()">
            <span class="hero-speaker-sep">·</span>
          </xsl:if>
        </xsl:for-each>
      </div>
    </xsl:if>
    <xsl:if test="program!=''">
      <a href="#program" class="hero-cta">View Program</a>
    </xsl:if>
  </div>
</section>

<!-- メインコンテンツ -->
<main class="main-content" id="main-content">
  <xsl:apply-templates />
  <section id="contact">
    <h2 class="section-heading">Contact</h2>
    <div class="contact-block">
      <xsl:value-of select="//email" />
    </div>
  </section>
</main>

<!-- フッター -->
<footer class="site-footer">
  <div class="footer-inner">
    <div class="footer-brand">
      <svg xmlns="http://www.w3.org/2000/svg" width="40" height="50" viewBox="0 0 68 84" aria-hidden="true">
        <text x="34" y="70" text-anchor="middle" font-size="78"
              font-family="Georgia,'Times New Roman',serif"
              font-style="italic" fill="rgba(255,255,255,0.6)">&#955;</text>
      </svg>
      <div>
        <div class="footer-conf-id"><xsl:value-of select="//short" /></div>
        <div class="footer-conf-long">
          <xsl:value-of select="//SndLine" />
          <xsl:text> </xsl:text>
          <xsl:value-of select="//TrdLine" />
        </div>
      </div>
    </div>
    <div class="footer-archives-area">
      <div class="footer-archive-col">
        <h4>Past Editions</h4>
        <div class="chip-group footer-chips">
          <span class="chip-dead">LENLS1</span>
          <xsl:for-each select="//archive">
            <a>
              <xsl:attribute name="href">../<xsl:value-of select="@website" />/index.html</xsl:attribute>
              <xsl:value-of select="@name" />
            </a>
          </xsl:for-each>
        </div>
      </div>
      <div class="footer-archive-col">
        <h4>Post-proceedings (LNCS)</h4>
        <div class="chip-group footer-chips">
          <xsl:for-each select="//archive">
            <xsl:if test="@proceedings!=''">
              <a>
                <xsl:attribute name="href"><xsl:value-of select="@proceedings" /></xsl:attribute>
                <xsl:value-of select="@name" />
              </a>
            </xsl:if>
          </xsl:for-each>
        </div>
      </div>
    </div>
  </div>
</footer>

</body>
</html>
</xsl:template>

<!-- ════════════════════════════════════════════════════
     summary: キーファクトバー + 招待講演者
     ════════════════════════════════════════════════════ -->
<xsl:template match="summary">
  <div class="key-facts-bar">
    <xsl:for-each select="site">
      <div class="kf-item">
        <span class="kf-label">Venue</span>
        <span class="kf-value">
          <xsl:choose>
            <xsl:when test="url!=''">
              <a>
                <xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
                <xsl:value-of select="name" />
              </a>
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="name" /></xsl:otherwise>
          </xsl:choose>
        </span>
        <xsl:if test="address!=''">
          <span class="kf-sub"><xsl:value-of select="address" /></span>
        </xsl:if>
      </div>
    </xsl:for-each>
    <div class="kf-item">
      <span class="kf-label">Dates</span>
      <span class="kf-value"><xsl:value-of select="conferencedate" /></span>
    </div>
    <xsl:if test="//pcmember[@role='chair']">
      <div class="kf-item">
        <span class="kf-label">Chair</span>
        <span class="kf-value">
          <xsl:for-each select="//pcmember[@role='chair']">
            <xsl:value-of select="@name" />
            <br />
            <span class="kf-sub"><xsl:value-of select="@affiliation" /></span>
          </xsl:for-each>
        </span>
      </div>
    </xsl:if>
    <xsl:if test="//pcmember[@role='cochair']">
      <div class="kf-item">
        <span class="kf-label">Co-chairs</span>
        <span class="kf-value">
          <xsl:for-each select="//pcmember[@role='cochair']">
            <xsl:value-of select="@name" />
            <br />
            <span class="kf-sub"><xsl:value-of select="@affiliation" /></span>
            <xsl:if test="position()!=last()"><br /></xsl:if>
          </xsl:for-each>
        </span>
      </div>
    </xsl:if>
  </div>
  <xsl:if test="invitedspeaker">
    <h2 class="section-heading">Invited Speakers</h2>
    <div class="invited-speakers">
      <xsl:for-each select="invitedspeaker">
        <div class="invited-chip">
          <div class="chip-name"><xsl:value-of select="@name" /></div>
          <div class="chip-aff"><xsl:value-of select="@affiliation" /></div>
        </div>
      </xsl:for-each>
    </div>
  </xsl:if>
</xsl:template>

<!-- ════════════════════════════════════════════════════
     description / p / host / topics
     ════════════════════════════════════════════════════ -->
<xsl:template match="description">
  <section id="topics">
    <h2 class="section-heading">Aim and Topics</h2>
    <xsl:apply-templates />
  </section>
</xsl:template>

<xsl:template match="p">
  <p style="margin-bottom:.8rem;font-size:.92rem"><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="host">
  <a>
    <xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
    <xsl:value-of select="." />
  </a>
</xsl:template>

<xsl:template match="topics">
  <ul class="topics-list">
    <xsl:for-each select="topic">
      <li><xsl:value-of select="." /></li>
    </xsl:for-each>
  </ul>
</xsl:template>

<!-- ════════════════════════════════════════════════════
     submission / url / selectedpaper / onlineproceedings
     ════════════════════════════════════════════════════ -->
<xsl:template match="submission">
  <section id="submissions">
    <h2 class="section-heading">Submissions</h2>
    <div style="font-size:.92rem"><xsl:apply-templates /></div>
  </section>
</xsl:template>

<xsl:template match="url">
  <p style="margin:.4rem 0">
    <a>
      <xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
      <xsl:value-of select="." />
    </a>
  </p>
</xsl:template>

<xsl:template match="selectedpaper">
  <section id="selectedpapers">
    <h2 class="section-heading">Selected Papers</h2>
    <div class="proceedings-block">
      <div style="flex:1;font-size:.9rem"><xsl:apply-templates /></div>
      <a href="http://www.springer.com/lncs" target="_blank">
        <img width="110" src="./LNCS-Logo.jpg" alt="LNCS" />
      </a>
    </div>
  </section>
</xsl:template>

<xsl:template match="onlineproceedings">
  <xsl:if test="@url!=''">
    <section id="onlineproceedings">
      <h2 class="section-heading">Online Proceedings</h2>
      <div class="online-proc-block">
        The proceedings are available for download:&#x20;
        <a>
          <xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
          Download PDF
        </a>
      </div>
    </section>
  </xsl:if>
</xsl:template>

<!-- ════════════════════════════════════════════════════
     importantdates / registration
     ════════════════════════════════════════════════════ -->
<xsl:template match="importantdates">
  <section id="dates">
    <h2 class="section-heading">Important Dates</h2>
    <table class="dates-table">
      <xsl:for-each select="importantdate">
        <tr>
          <td class="dt-name"><xsl:value-of select="@name" /></td>
          <td>
            <xsl:choose>
              <xsl:when test="@done='yes'">
                <span class="dt-date done"><s><xsl:value-of select="@date" /></s></span>
              </xsl:when>
              <xsl:otherwise>
                <span class="dt-date"><xsl:value-of select="@date" /></span>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </section>
</xsl:template>

<xsl:template match="registration">
  <section id="registration">
    <h2 class="section-heading">Registration</h2>
    <p style="font-size:.9rem;margin-bottom:.6rem"><xsl:value-of select="description1" /></p>
    <a class="reg-link">
      <xsl:attribute name="href"><xsl:value-of select="site" /></xsl:attribute>
      Register Here
    </a>
    <p style="font-size:.88rem;margin-top:.8rem;color:#4a5568"><xsl:value-of select="description2" /></p>
    <table class="fee-table">
      <xsl:for-each select="fee">
        <tr>
          <td class="fee-label"><xsl:value-of select="@type" /></td>
          <td class="fee-price"><xsl:value-of select="@price" /></td>
        </tr>
      </xsl:for-each>
    </table>
  </section>
</xsl:template>

<!-- ════════════════════════════════════════════════════
     program / day: タイムライン構造
     ════════════════════════════════════════════════════ -->
<xsl:template match="program">
  <section id="program">
    <h2 class="section-heading">Program</h2>
    <xsl:apply-templates />
  </section>
</xsl:template>

<xsl:template match="day">
  <div class="program-day">
    <div class="program-day-header"><xsl:value-of select="@date" /></div>
    <div class="program-timeline">
      <xsl:apply-templates />
    </div>
  </div>
</xsl:template>

<xsl:template match="event">
  <div class="program-event">
    <div class="event-time-col"><xsl:value-of select="@time" /></div>
    <div class="event-body"><xsl:value-of select="@name" /></div>
  </div>
</xsl:template>

<xsl:template match="session">
  <div class="program-session">
    <div class="session-time-col"><xsl:value-of select="@time" /></div>
    <div class="session-body">
      <div class="session-meta">
        <xsl:if test="@name!=''">
          <span class="session-name"><xsl:value-of select="@name" /></span>
        </xsl:if>
        <xsl:if test="@chair!=''">
          <span class="session-chair">Chair: <xsl:value-of select="@chair" /></span>
        </xsl:if>
      </div>
      <ul class="talks-list">
        <xsl:apply-templates />
      </ul>
    </div>
  </div>
</xsl:template>

<xsl:template match="talk">
  <li class="talk-item">
    <div class="talk-author">
      <xsl:if test="@format='online'">
        <span class="talk-badge badge-online">online</span>
      </xsl:if>
      <xsl:if test="@exabst='none'">
        <span class="talk-badge badge-no-abs">no abstract</span>
      </xsl:if>
      <xsl:value-of select="@author" />
    </div>
    <div class="talk-title">&#x201C;<xsl:value-of select="@title" />&#x201D;</div>
  </li>
</xsl:template>

<xsl:template match="invitedtalk">
  <li class="talk-item invited-talk">
    <div class="talk-author">
      <span class="talk-badge badge-invited">Invited</span>
      <xsl:value-of select="@author" />
    </div>
    <div class="talk-title">&#x201C;<xsl:value-of select="@title" />&#x201D;</div>
  </li>
</xsl:template>

<xsl:template match="alternates">
  <section id="alternates">
    <h2 class="section-heading">Alternates</h2>
    <ul class="talks-list">
      <xsl:apply-templates />
    </ul>
  </section>
</xsl:template>

<!-- ════════════════════════════════════════════════════
     sponsors / code / pcmembers / localorganizers
     ════════════════════════════════════════════════════ -->
<xsl:template match="sponsors">
  <section id="sponsors">
    <h2 class="section-heading">Sponsors</h2>
    <p style="font-size:.88rem;margin-bottom:.7rem;color:#4a5568">
      LENLS is organized by an alliance of the following sponsors.
    </p>
    <ul class="sponsor-list">
      <xsl:for-each select="sponsor">
        <li>
          <a>
            <xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
            <xsl:value-of select="." />
          </a>
        </li>
      </xsl:for-each>
    </ul>
  </section>
</xsl:template>

<xsl:template match="code">
  <section id="code">
    <h2 class="section-heading">Conference Code of Conduct</h2>
    <div class="coc-section"><xsl:apply-templates /></div>
  </section>
</xsl:template>

<xsl:template match="ct"><h3><xsl:apply-templates /></h3></xsl:template>
<xsl:template match="cp"><p><xsl:apply-templates /></p></xsl:template>

<xsl:template match="pcmembers">
  <section id="committee">
    <h2 class="section-heading">Program Committee</h2>
    <ul class="pc-columns">
      <xsl:for-each select="pcmember">
        <li>
          <span class="pc-name"><xsl:value-of select="@name" /></span>
          <br />
          <span class="pc-aff"><xsl:value-of select="@affiliation" /></span>
        </li>
      </xsl:for-each>
    </ul>
  </section>
</xsl:template>

<xsl:template match="localorganizers">
  <section id="localorganizers">
    <h2 class="section-heading">Local Organizers</h2>
    <ul class="pc-columns">
      <xsl:for-each select="localorganizer">
        <li>
          <span class="pc-name"><xsl:value-of select="@name" /></span>
          <br />
          <span class="pc-aff"><xsl:value-of select="@affiliation" /></span>
        </li>
      </xsl:for-each>
    </ul>
  </section>
</xsl:template>

<!-- ════════════════════════════════════════════════════
     archives
     ════════════════════════════════════════════════════ -->
<xsl:template match="archives">
  <section id="archives">
    <h2 class="section-heading">Past Editions</h2>
    <div class="archive-section">
      <h3>Websites</h3>
      <div class="chip-group">
        <span class="chip-dead">LENLS1</span>
        <xsl:for-each select="archive">
          <a>
            <xsl:attribute name="href">../<xsl:value-of select="@website" />/index.html</xsl:attribute>
            <xsl:value-of select="@name" />
          </a>
        </xsl:for-each>
      </div>
    </div>
    <div class="archive-section" style="margin-top:1rem">
      <h3>Post-proceedings Volumes (LNCS)</h3>
      <div class="chip-group">
        <xsl:for-each select="archive">
          <xsl:if test="@proceedings!=''">
            <a>
              <xsl:attribute name="href"><xsl:value-of select="@proceedings" /></xsl:attribute>
              <xsl:value-of select="@name" />
              <xsl:text> (</xsl:text><xsl:value-of select="@year" /><xsl:text>)</xsl:text>
            </a>
          </xsl:if>
        </xsl:for-each>
      </div>
    </div>
  </section>
</xsl:template>

<!-- ════════════════════════════════════════════════════
     その他のテンプレート
     ════════════════════════════════════════════════════ -->
<xsl:template match="lunchmap">
  <section id="lunchmap">
    <h2 class="section-heading">Lunch Map</h2>
    <a><xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute><xsl:value-of select="@url" /></a>
  </section>
</xsl:template>

<xsl:template match="tutorial">
  <section id="tutorial">
    <h2 class="section-heading">Tutorial Lecture</h2>
    <p style="font-size:.9rem">On <xsl:value-of select="@date" />, there will be a tutorial lecture at <xsl:value-of select="@venue" />.</p>
    <p style="font-size:.9rem;margin-top:.5rem">
      <strong>Lecturer: </strong>
      <xsl:for-each select="lecturer">
        <xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />)
      </xsl:for-each>
    </p>
    <p style="font-size:.9rem"><strong>Title:</strong> <xsl:value-of select="title" /></p>
  </section>
</xsl:template>

<xsl:template match="studentsession">
  <section id="studentsession">
    <h2 class="section-heading">Student Session</h2>
    <p style="font-size:.9rem"><xsl:apply-templates /></p>
  </section>
</xsl:template>

<xsl:template match="zoom">
  <div style="font-size:.88rem;margin:.5rem 0;padding:.6rem 1rem;background:#f0f8ff;border:1px solid #c5daf5;border-radius:4px">
    Zoom URL: <a><xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute><xsl:value-of select="@url" /></a><br />
    Meeting ID: <xsl:value-of select="@id" /><br />
    Password: <xsl:value-of select="." />
  </div>
</xsl:template>

<xsl:template match="category">
  <strong>[<xsl:value-of select="." />]</strong>
</xsl:template>

<xsl:template match="bar">|</xsl:template>

</xsl:stylesheet>
