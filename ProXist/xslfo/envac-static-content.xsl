<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- envac-static-content.xsl -->
    <!-- Static content for Envac demo -->
    
    
    
    
    
    
    <!-- Named Templates -->
    <!-- =============== -->
    
    <xsl:template name="envac-basic-headers">
        <!-- Left Page Header -->
        <fo:static-content flow-name="xsl-region-before-left">
            <xsl:call-template name="left-header-envac"/>
        </fo:static-content>
        <!-- Right Page Header -->
        <fo:static-content flow-name="xsl-region-before-right">
            <xsl:call-template name="right-header-envac"/>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="envac-basic-footers">
        <!-- Left Page Footer -->
        <fo:static-content flow-name="xsl-region-after-left">
            <xsl:call-template name="standard-footer-left-envac"/>
        </fo:static-content>
        <!-- Right Page Footer -->
        <fo:static-content flow-name="xsl-region-after-right">
            <xsl:call-template name="standard-footer-right-envac"/>
        </fo:static-content>
        <!-- Footnote Separator -->
        <xsl:call-template name="ftnote-separator"/>
    </xsl:template>
    
    <xsl:template name="left-header-envac">
        <fo:table
            table-layout="fixed"
            font-size="14pt"
            font-family="{$heading-font-family}">
            <fo:table-column column-width="65%" column-number="1"/>
            <fo:table-column column-width="35%" column-number="2"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="end" margin-right="-5mm" margin-top="6mm">
                            <xsl:call-template name="envac-logo-ref"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="right-header-envac">
        <fo:table
            table-layout="fixed"
            font-size="14pt"
            font-family="{$heading-font-family}">
            
            <fo:table-column column-width="35%" column-number="1"/>
            <fo:table-column column-width="65%" column-number="2"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="start" margin-left="-5mm" margin-top="6mm">
                            <xsl:call-template name="envac-logo-ref"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="standard-footer-left-envac">
        <fo:table
            margin-left="5mm"
            margin-right="2mm"
            table-layout="fixed"
            font-size="9pt"
            border-color="#d2d2d2"
            border-before-style="solid"
            border-before-width="1.0pt"
            font-family="{$heading-font-family}">
            <fo:table-column column-width="33%" column-number="1"/>
            <fo:table-column column-width="34%" column-number="2"/>
            <fo:table-column column-width="33%" column-number="3"/>
            
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="start" margin-top="1mm">
                            <xsl:call-template name="getString">
                                <xsl:with-param name="stringName" select="'Page'"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <fo:page-number/>
                            <xsl:text> </xsl:text>
                            <xsl:call-template name="getString">
                                <xsl:with-param name="stringName" select="'of'"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <fo:page-number-citation ref-id="id-last-page"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="end">
                            
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="standard-footer-right-envac">
        <fo:table
            margin-right="5mm"
            margin-left="2mm"
            table-layout="fixed"
            font-size="9pt"
            border-color="#d2d2d2"
            border-before-style="solid"
            border-before-width="1.0pt"
            font-family="{$heading-font-family}">
            <fo:table-column column-width="33%" column-number="1"/>
            <fo:table-column column-width="34%" column-number="2"/>
            <fo:table-column column-width="33%" column-number="3"/>
            
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="end" margin-top="1mm">
                            <xsl:call-template name="getString">
                                <xsl:with-param name="stringName" select="'Page'"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <fo:page-number/>
                            <xsl:text> </xsl:text>
                            <xsl:call-template name="getString">
                                <xsl:with-param name="stringName" select="'of'"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <fo:page-number-citation ref-id="id-last-page"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    
    
    <!-- Logotype Handling -->
    <!-- ================= -->
    
    <xsl:template name="envac-logo-ref">
        <fo:external-graphic>
            <xsl:choose>
                <xsl:when test="$demo = 'envac'">
                    <xsl:attribute name="width">55mm</xsl:attribute>
                    <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('url(',$standard.files.dir,$envac.logo.image,')')"/>
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