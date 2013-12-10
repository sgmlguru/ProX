<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    
    
    <xsl:template name="gunnebo-cover-logo">
        <fo:block font-family="sans-serif" text-align="end" display-align="after">
            <xsl:if test="$first.page.footer.logo=1">
                <xsl:call-template name="gunnebo-logo-ref"/><!-- gunnebo-static-content.xsl -->
            </xsl:if>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="gunnebo-back-cover-logo">
        <fo:block font-family="sans-serif" text-align="start" display-align="after">
            <xsl:if test="$first.page.footer.logo=1">
                <xsl:call-template name="gunnebo-logo-ref"/><!-- gunnebo-static-content.xsl -->
            </xsl:if>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="gunnebo-covers">
        <fo:block text-align="end">
            <xsl:apply-templates select="covers" mode="gunnebo-front"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="gunnebo-back-covers">
        <fo:block text-align="start">
            <xsl:apply-templates select="meta-data/covers" mode="gunnebo-back"/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="covers" mode="gunnebo-front">
        <xsl:apply-templates select="cover[@type = 'front']" mode="gunnebo"/>
    </xsl:template>
    
    <xsl:template match="covers" mode="gunnebo-back">
        <xsl:apply-templates select="cover[@type = 'back']" mode="gunnebo"/>
    </xsl:template>
    
    <xsl:template match="cover" mode="gunnebo">
        <xsl:apply-templates select="graphics" mode="gunnebo"/>
    </xsl:template>
    
    <xsl:template match="graphics" mode="gunnebo">
        <xsl:call-template name="gunnebo-cover-image"/>
    </xsl:template>
    
    <xsl:template name="gunnebo-cover-image">
        <fo:external-graphic>
            <xsl:attribute name="width">150mm</xsl:attribute>
            <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
            <xsl:attribute name="src">
                <xsl:value-of select="./@xlink:href"/>
            </xsl:attribute>
        </fo:external-graphic>
    </xsl:template>
    
    <xsl:template name="gunnebo-pub-info-image">
        <fo:block text-align="start" margin-top="10mm">
            <xsl:apply-templates select="pub-info/graphics"/>
        </fo:block>
    </xsl:template>
    
    
</xsl:stylesheet>