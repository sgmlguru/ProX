<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- gunnebo-static-content.xsl -->
    <!-- Static content for Gunnebo demo -->
    
    
    
    
    
    
    <!-- Named Templates -->
    <!-- =============== -->
    
    <xsl:template name="gunnebo-basic-headers">
        <!-- Left Page Header -->
        <fo:static-content flow-name="xsl-region-before-left">
            <xsl:call-template name="left-header-gunnebo"/>
        </fo:static-content>
        <!-- Right Page Header -->
        <fo:static-content flow-name="xsl-region-before-right">
            <xsl:call-template name="right-header-gunnebo"/>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="gunnebo-basic-footers">
        <!-- Left Page Footer -->
        <fo:static-content flow-name="xsl-region-after-left">
            <xsl:call-template name="standard-footer-left-gunnebo"/>
        </fo:static-content>
        <!-- Right Page Footer -->
        <fo:static-content flow-name="xsl-region-after-right">
            <xsl:call-template name="standard-footer-right-gunnebo"/>
        </fo:static-content>
        <!-- Footnote Separator -->
        <xsl:call-template name="ftnote-separator"/>
    </xsl:template>
    
    <xsl:template name="left-header-gunnebo">
        <fo:table table-layout="fixed" font-size="9pt" font-family="{$heading-font-family}" border-after-style="solid" border-after-width="1.0pt">
            <xsl:choose>
                <xsl:when test="contains($applic,'Group_A')">
                    <!--<xsl:attribute name="border-after-style">solid</xsl:attribute>
                    <xsl:attribute name="border-after-width">1.0pt</xsl:attribute>-->
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>            
            <fo:table-column column-width="35%" column-number="1"/>
            <fo:table-column column-width="50%" column-number="2"/>
            <fo:table-column column-width="15%" column-number="3"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell padding-before="10mm">
                        <fo:block text-align="start">
                            <xsl:call-template name="gunnebo-logo-ref"/>
                        </fo:block>
                    </fo:table-cell>
                    
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    
                    <fo:table-cell display-align="after">
                        <fo:block margin-bottom="2mm">
                            
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="right-header-gunnebo">
        <fo:table table-layout="fixed" font-size="9pt" font-family="{$heading-font-family}" border-after-style="solid" border-after-width="1.0pt">
            <xsl:choose>
                <xsl:when test="contains($applic,'Grupp_A')">
                    <xsl:attribute name="border-after-style">solid</xsl:attribute>
                    <xsl:attribute name="border-after-width">1.0pt</xsl:attribute>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
            <fo:table-column column-width="15%" column-number="1"/>
            <fo:table-column column-width="50%" column-number="2"/>
            <fo:table-column column-width="35%" column-number="3"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell display-align="after">
                        <fo:block margin-bottom="2mm">
                            
                        </fo:block>
                    </fo:table-cell>
                    
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    
                    <fo:table-cell padding-before="10mm">
                        <fo:block text-align="end">
                            <xsl:call-template name="gunnebo-logo-ref"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="standard-footer-left-gunnebo">
        <fo:table table-layout="fixed" font-size="9pt" border-before-style="solid" border-before-width="1.0pt" font-family="{$heading-font-family}">
            <fo:table-column column-width="50%" column-number="1"/>
            <fo:table-column column-width="50%" column-number="2"/>
            
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="start">
                            <fo:page-number/>
                            <xsl:text>(</xsl:text>
                            <fo:page-number-citation ref-id="id-last-page"/>
                            <xsl:text>)</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="end" font-weight="bold" margin-left="2mm" margin-top="1mm">
                            <xsl:choose>
                                <xsl:when test="contains($applic,'Grupp_A')">
                                    
                                </xsl:when>
                                <xsl:otherwise>
                                    
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="standard-footer-right-gunnebo">
        <fo:table table-layout="fixed" font-size="9pt" border-before-style="solid" border-before-width="1.0pt" font-family="{$heading-font-family}">
            <fo:table-column column-width="50%" column-number="1"/>
            <fo:table-column column-width="50%" column-number="2"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block font-weight="bold" margin-left="2mm" margin-top="1mm">
                            <xsl:choose>
                                <xsl:when test="contains($applic,'Grupp_A')">
                                    
                                </xsl:when>
                                <xsl:otherwise>
                                    
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="end">
                            <fo:page-number/>
                            <xsl:text>(</xsl:text>
                            <fo:page-number-citation ref-id="id-last-page"/>
                            <xsl:text>)</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    
    
    <!-- Logotype Handling -->
    <!-- ================= -->
    
    <xsl:template name="gunnebo-logo-ref">
        <fo:external-graphic>
            <xsl:choose>
                <xsl:when test="contains($applic,'Group_A')">
                    <xsl:attribute name="height">15mm</xsl:attribute>
                    <xsl:attribute name="content-height">scale-to-fit</xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('url(',$plw.standard.files.dir,$tux.image,')')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$demo = 'gunnebo' and contains($applic,'Group_B')">
                    <xsl:attribute name="width">35mm</xsl:attribute>
                    <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('url(',$plw.standard.files.dir,$fichet.logo.image,')')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$demo = 'gunnebo' and ($applic = '' or not(/*/@applic))">
                    <xsl:attribute name="width">35mm</xsl:attribute>
                    <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('url(',$plw.standard.files.dir,$gunnebo.logo.image,')')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="width">55mm</xsl:attribute>
                    <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('url(',$standard.files.dir,$logo.image,')')"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
        </fo:external-graphic>
    </xsl:template>
    
    <!-- Footnote separator in static-content.xsl -->
    
</xsl:stylesheet>