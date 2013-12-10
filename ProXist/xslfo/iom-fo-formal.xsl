<?xml version="1.0" encoding="UTF-8"?>

<!-- XSLT stylesheet for conversion of COSML 1.0 documents to XSL FO -->
<!-- Driver for the "formal" version: cover page, separate meta-data and TOC page sequences -->
<!-- MJ 2003-03-04 -->

<!-- Based on IOML 1.0/2.0 stylesheets. -->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  version="1.0">

  <xsl:import href="param.xsl"/>
  <xsl:include href="attribute-set.xsl"/>
  <xsl:include href="layout.xsl"/>
  <xsl:include href="static-content.xsl"/>
  <xsl:include href="meta-data.xsl"/>
  <xsl:include href="toc.xsl"/>
  <xsl:include href="body.xsl"/>
  <xsl:include href="sections.xsl"/>
  <xsl:include href="block.xsl"/>
  <xsl:include href="inline.xsl"/>
  <xsl:include href="list.xsl"/>
  <xsl:include href="table.xsl"/>
  <xsl:include href="xref.xsl"/>
  <xsl:include href="back.xsl"/>
  <xsl:include href="index.xsl"/>
  <xsl:include href="inset.xsl"/>
  <xsl:include href="l10n.xsl"/>
  <xsl:include href="extension.xsl"/>

  <!-- Override parameters in param.xsl -->
  <xsl:param name="cover.page">1</xsl:param>
  <xsl:param name="break.after.section.level1">1</xsl:param>
  <xsl:param name="first.page.logo">1</xsl:param>
  
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>
  
</xsl:stylesheet>