<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8"/>

<xsl:template match="/">
\documentclass[12pt]{jarticle}
\usepackage[dvips, twoside, bindingoffset=0.4cm, paper=a4paper, hmargin=1.8cm, top=3cm, bottom=1.5cm]{geometry}
\usepackage[psamsfonts]{amssymb}
\usepackage[dvips]{graphicx}

\setlength{\textheight}{24.45cm}
\setlength{\textwidth}{17.0cm}
\setlength{\evensidemargin}{-0.5cm}
\setlength{\oddsidemargin}{-0.5cm}

\begin{document}
%\thispagestyle{empty}
\pagestyle{empty}

\vspace*{1cm}
\begin{Large}
\begin{center}
{\bf Proceedings of <xsl:value-of select="//FstLine" /> \\
     <xsl:value-of select="//SndLine" /><xsl:text disable-output-escaping="yes">&#x20;</xsl:text>\\<xsl:value-of select="//TrdLine" /> (<xsl:value-of select="//short" />)}
\end{center}
\end{Large}
\vspace*{1cm}
\begin{Large}
\begin{center}
{\em hosted by <xsl:value-of select="//host" />}
\end{center}
\end{Large}
\begin{large}
\vspace*{1cm}
\begin{center}
Workshop Chair\\ $\;$\\
<xsl:value-of select="//pcmember[@role='chair']/@name" /> (<xsl:value-of select="//pcmember[@role='chair']/@affiliation" />)
\end{center}
\end{large}
\vspace*{3cm}
%\begin{center}
%\ifpdf{
%\centerline{
%\raisebox{1ex}{\scalebox{.3}{\includegraphics{jsai_logo.eps}}}
%\hspace*{30pt}
%\scalebox{.3}{\includegraphics{logo05.eps}}
%}
%}
%\ifdvi{
%\centerline{
%\includegraphics[width=3.5cm,height=2cm]{jsai_logo.eps}
%}
%}
%\end{center}
\vspace*{1cm}
\begin{large}
\begin{center}
<xsl:for-each select="//site">
  <xsl:value-of select="name" />, \\
</xsl:for-each>
<xsl:value-of select="//conferencedate" />
\end{center}
\end{large}
\vfill

\newpage

\vspace*{20cm}
\vfill
\begin{large}
<xsl:value-of select="//isbn" />
\end{large}

\newpage
\pagestyle{plain}
\pagenumbering{roman}

\newpage
\section*{Preface}
%%%%%%%%%%%%%%%%%%
<xsl:value-of select="//description1" />

This proceedings volume contains selected and invited papers on topics in formal semantics, formal pragmatics, and related fields, including the following:
\begin{itemize}<xsl:for-each select="//topic">
\item[$\maltese$] <xsl:value-of select="text()" />
</xsl:for-each>
\end{itemize}

<xsl:value-of select="//sponsor" />

\subsection*{Workship Organizers/Program Committee}
\begin{flushleft}
\begin{tabular}{l}
<xsl:for-each select="//pcmember">
<xsl:value-of select="@name" /> (<xsl:value-of select="@affiliation" />) \\
</xsl:for-each>
\end{tabular}
\end{flushleft}
\newpage
  <xsl:apply-templates select="//program" />
  \end{document}
</xsl:template>

<xsl:template match="program">
\section*{Program and Table of Contents}

\newcommand{\slot}[2]{\noindent \underline{#1 \  #2} \\}
\newcommand{\talk}[3]{
  \noindent #2 \\ 
  \indent\indent \textit{#1} \dotfill #3 
  \smallskip \\
  }
\newcommand{\talkk}[3]{
  \noindent #2 \\ 
  \indent\indent \textit{#1}
  \smallskip \\
  }
<xsl:apply-templates /></xsl:template>

<xsl:template match="day">
\noindent\textbf{\large 
<xsl:value-of select="@date" />
}\\
<xsl:apply-templates /></xsl:template>

<xsl:template match="event">
\slot{<xsl:value-of select="@time" />}{<xsl:value-of select="@name" />}
</xsl:template>

<xsl:template match="session">
\slot{<xsl:value-of select="@time" />}{<xsl:value-of select="@name" />}
<xsl:apply-templates /></xsl:template>

<xsl:template match="talk">
<xsl:choose>
<xsl:when test="@pages!=''">
\talk{<xsl:value-of select="@author" />}
     {<xsl:value-of select="@title" />}
     {page<xsl:value-of select="@pages" />}</xsl:when>
<xsl:otherwise>
\talk{<xsl:value-of select="@author" />}
      {<xsl:value-of select="@title" />}
      {}</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="invitedtalk">
<xsl:choose>
<xsl:when test="@pages!=''">
\talk{<xsl:value-of select="@author" />}
     {<xsl:value-of select="@title" />}
     {page<xsl:value-of select="@pages" />}</xsl:when>
<xsl:otherwise>
\talkk{<xsl:value-of select="@author" />}
      {<xsl:value-of select="@title" />}
      {}</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="alternates">
\noindent\textbf{Alternates}\\
<xsl:apply-templates /></xsl:template>

<xsl:template match="bar">\ensuremath{\|}</xsl:template>

</xsl:stylesheet>
