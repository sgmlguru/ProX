<?xml version="1.0" encoding="UTF-8"?>

<!-- XSLT stylesheet for conversion of COSML 1.0 documents to XSL FO -->
<!-- Driver for the "internal" version: no cover page, fewer pagebreaks -->
<!-- MJ 2003-03-04 -->

<!-- Based on IOML 1.0/2.0 stylesheets. -->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  version="1.0">

  <xsl:output method="xml" indent="yes" encoding="utf-8"/>

  <xsl:include href="param.xsl"/>
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
 
</xsl:stylesheet>

