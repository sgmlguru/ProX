<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- demo-attribute-sets.xsl -->
    
    
    
    <!-- Attribute Sets -->
    <!-- ============== -->
    
    <xsl:attribute-set name="region-toc-left-cargotec">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="'20mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="'0mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:value-of select="'10mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:value-of select="'5mm'"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-toc-right-cargotec">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="'20mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="'0mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:value-of select="'5mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:value-of select="'10mm'"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-body-left-cargotec">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="'5mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="'0mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:value-of select="'10mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:value-of select="'5mm'"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="region-body-right-cargotec">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="'5mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="'0mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-left">
            <xsl:value-of select="'5mm'"/>
        </xsl:attribute>
        <xsl:attribute name="margin-right">
            <xsl:value-of select="'10mm'"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    
</xsl:stylesheet>