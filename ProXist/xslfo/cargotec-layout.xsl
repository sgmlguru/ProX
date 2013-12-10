<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- demo-layout.xsl -->
    
    
    
    <!-- Page masters -->
    <!-- ============ -->
    
    <xsl:template name="cargotec-page-masters">
        <!-- TOC pages -->
        <fo:simple-page-master master-name="left-TOC-cargotec" xsl:use-attribute-sets="left-page">
            <fo:region-body xsl:use-attribute-sets="region-toc-left-cargotec"/>
            <fo:region-before extent="29mm" region-name="xsl-region-before-left-toc-cargotec"/>
            <fo:region-after extent="40mm" region-name="xsl-region-after-left-toc-cargotec"/>
        </fo:simple-page-master>
        
        <fo:simple-page-master master-name="right-TOC-cargotec" xsl:use-attribute-sets="right-page">
            <fo:region-body xsl:use-attribute-sets="region-toc-right-cargotec"/>
            <fo:region-before extent="29mm" region-name="xsl-region-before-right-toc-cargotec"/>
            <fo:region-after extent="40mm" region-name="xsl-region-after-right-toc-cargotec"/>
        </fo:simple-page-master>
        
        
        <!-- Body pages -->
        <fo:simple-page-master master-name="left-page-cargotec" xsl:use-attribute-sets="left-page">
            <fo:region-body xsl:use-attribute-sets="region-body-left-cargotec"/>
            <fo:region-before extent="6mm" region-name="xsl-region-before-left-cargotec"/>
            <fo:region-after extent="40mm" region-name="xsl-region-after-left-cargotec"/>
        </fo:simple-page-master>
        
        <fo:simple-page-master master-name="right-page-cargotec" xsl:use-attribute-sets="right-page">
            <fo:region-body xsl:use-attribute-sets="region-body-right-cargotec"/>
            <fo:region-before extent="6mm" region-name="xsl-region-before-right-cargotec"/>
            <fo:region-after extent="40mm" region-name="xsl-region-after-right-cargotec"/>
        </fo:simple-page-master>
    </xsl:template>
    
    
    
    <!-- Page sequence masters -->
    <!-- ===================== -->
    
    <xsl:template name="cargotec-page-sequence-masters">
        <fo:page-sequence-master master-name="TOC-cargotec">
            <fo:repeatable-page-master-alternatives>
                <fo:conditional-page-master-reference master-reference="right-TOC-cargotec" odd-or-even="odd"/>
                <fo:conditional-page-master-reference master-reference="left-TOC-cargotec" odd-or-even="even"/>
            </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
        
        <fo:page-sequence-master master-name="contents-cargotec">
            <fo:repeatable-page-master-alternatives>
                <fo:conditional-page-master-reference master-reference="right-page-cargotec" odd-or-even="odd"/>
                <fo:conditional-page-master-reference master-reference="left-page-cargotec" odd-or-even="even"/>
            </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
    </xsl:template>
    
</xsl:stylesheet>