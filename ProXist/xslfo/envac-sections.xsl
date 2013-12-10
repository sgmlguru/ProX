<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- envac-sections.xsl -->
    
    
    <xsl:template name="envac-level1-title">
        <fo:block
            xsl:use-attribute-sets="section-titles"
            margin-top="-11mm" margin-right="-7mm"
            space-after="5pt"
            font-size="15pt"
            color="gray"
            id="{generate-id(.)}"> <!-- {$heading1-font-size} -->
            
            <xsl:attribute name="start-indent">0mm</xsl:attribute>
            
            <!-- 2-column DOCTYPE section documents -->
            <xsl:if test="$root-name = 'section'">
                <xsl:attribute name="span">all</xsl:attribute>
                <xsl:attribute name="text-align">end</xsl:attribute>
            </xsl:if>
            
            <!-- AntennaHouse PDF bookmarks -->
            <xsl:if test="$axf.extensions=1">
                <xsl:call-template name="axf-bookmarks">
                    <xsl:with-param name="outline-title" select="normalize-space(.)"/>
                </xsl:call-template>
            </xsl:if>
            
            <xsl:choose>
                <xsl:when test="ancestor::body">
                    <xsl:call-template name="envac-section-titles"/>
                </xsl:when>
                <xsl:when test="ancestor::back">
                    <xsl:call-template name="envac-appendix-titles"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="envac-section-titles">
                        <xsl:with-param name="indent">0pt</xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="envac-level2-title">
        <fo:block
            xsl:use-attribute-sets="section-titles"
            font-size="{$heading2-font-size}"
            id="{generate-id(.)}" margin-left="-1pt" padding="1pt">
            
            <xsl:attribute name="start-indent">0mm</xsl:attribute>
            <xsl:attribute name="background-color">#d2d2d2</xsl:attribute>
            <!--<xsl:if test="preceding::section[parent::section]">
                <xsl:attribute name="margin-top">5pt</xsl:attribute>
            </xsl:if>-->
            <xsl:attribute name="color">
                <xsl:value-of select="$envac-title-color"/>
            </xsl:attribute>
            
            <!-- AntennaHouse PDF bookmarks -->
            <xsl:if test="$axf.extensions=1">
                <xsl:call-template name="axf-bookmarks">
                    <xsl:with-param name="outline-title" select="normalize-space(.)"/>
                </xsl:call-template>
            </xsl:if>
            
            <xsl:choose>
                <xsl:when test="ancestor::body">
                    <xsl:call-template name="envac-section-titles"/>
                </xsl:when>
                <xsl:when test="ancestor::back">
                    <xsl:call-template name="envac-appendix-titles"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="envac-section-titles">
                        <xsl:with-param name="indent">0pt</xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
            
        </fo:block>
    </xsl:template>
    
    
    <!-- Title numbering -->
    
    <xsl:template name="envac-section-titles">
        <xsl:param name="indent"/>
        <fo:block>
            <xsl:attribute name="margin-left">
                <xsl:value-of select="$indent"/>
            </xsl:attribute>
            <xsl:if test="$section.numbering=1 and not($demo = 'envac')">
                <xsl:number
                    level="multiple"
                    count="section[not(ancestor::back)] | inset[not(ancestor::back)]"
                    format="1.1"/>
                <fo:inline>&#xA0;&#xA0;</fo:inline>
            </xsl:if>
            <fo:inline>
                <xsl:value-of select="normalize-space(.)"/>
            </fo:inline>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="envac-appendix-titles">
        <fo:block margin-left="0pt">
            <xsl:if test="$section.numbering=1 and not($demo = 'envac')">
                <xsl:number
                    level="multiple"
                    count="section[ancestor::back] | inset[ancestor::back]"
                    format="A.1"/>
                <fo:inline>&#xA0;&#xA0;</fo:inline>
            </xsl:if>
            <xsl:value-of select="normalize-space(.)"/>
        </fo:block>
    </xsl:template>
    
    
</xsl:stylesheet>