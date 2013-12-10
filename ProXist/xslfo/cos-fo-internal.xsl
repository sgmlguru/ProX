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


  <xsl:import href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/param.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/attribute-set.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/layout.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/bookmarks.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/static-content.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/meta-data.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/toc.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/body.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/sections.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/block.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/inline.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/list.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/table.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/xref.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/back.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/index.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/inset.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/l10n.xsl"/>
  <xsl:include href="http://localhost:8080/exist/rest/db/docs/cosml/system/xslfo/extension.xsl"/>
  
  <!-- Demo stylesheet additions -->
  <xsl:include href="demo.xsl"/>
  
  <xsl:param name="generate.index">0</xsl:param>
  <xsl:param name="xep.extensions">0</xsl:param>
  <xsl:param name="xslfo.bookmarks">1</xsl:param>
  
  <!-- FOP extensions no longer work. Use standard FO 1.1 functionality. -->
  <xsl:param name="fop.extensions">0</xsl:param>
  
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>
 
</xsl:stylesheet>

