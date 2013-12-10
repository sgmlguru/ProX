<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- demo-static-content.xsl -->
    
    
    
    <!-- Static content -->
    <!-- ============== -->
    
    <!-- Demo header for Cargotec TOC -->
    <xsl:template name="region-before-toc-cargotec">
        <xsl:if test="$page.headers = '1'">
            <!-- Left Page Header -->
            <fo:static-content flow-name="xsl-region-before-left-toc-cargotec">
                <fo:block margin-left="10mm" margin-right="5mm">
                    <xsl:call-template name="left-toc-header-cargotec"/>
                </fo:block>
            </fo:static-content>
            
            <!-- Right Page Header -->
            <fo:static-content flow-name="xsl-region-before-right-toc-cargotec">
                <fo:block margin-left="5mm" margin-right="10mm">
                    <xsl:call-template name="right-toc-header-cargotec"/>
                </fo:block>
            </fo:static-content>
        </xsl:if>
    </xsl:template>
    
    <!-- Demo footer for Cargotec TOC -->
    <xsl:template name="region-after-toc-cargotec">
        <!-- Left Page Footer -->
        <fo:static-content flow-name="xsl-region-after-left-toc-cargotec">
            <fo:block margin-left="10mm" margin-right="5mm">
                <xsl:call-template name="left-footer-toc-cargotec"/>
            </fo:block>
        </fo:static-content>
        
        <!-- Right Page Footer -->
        <fo:static-content flow-name="xsl-region-after-right-toc-cargotec">
            <fo:block margin-left="5mm" margin-right="10mm">
                <xsl:call-template name="right-footer-toc-cargotec"/>
            </fo:block>
        </fo:static-content>
        
        <!-- Footnote Separator -->
        <xsl:call-template name="ftnote-separator"/>
    </xsl:template>
    
    
    <xsl:template name="left-toc-header-cargotec">
        <!-- Section no (group), section title, page no -->
        <fo:table
            table-layout="fixed"
            font-size="9pt"
            border-after-style="solid">
            <fo:table-column column-number="1" column-width="16%"/>
            <fo:table-column column-number="2" column-width="31%"/>
            <fo:table-column column-number="3" column-width="47%"/>
            <fo:table-column column-number="4" column-width="6%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell padding-after="9mm" padding-before="6mm">
                        <fo:block text-align="left" margin-left="-10mm" margin-right="-5mm">
                            <xsl:text>Group No.&#xa0;&#xa0;</xsl:text>
                            <fo:retrieve-marker retrieve-class-name="section-no"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-after="9mm" padding-before="6mm">
                        <fo:block text-align="right" font-weight="bold" margin-left="-10mm" margin-right="-5mm">
                            <fo:retrieve-marker retrieve-class-name="section-title-swe"/>
                            <xsl:text> -</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-after="9mm" padding-before="6mm">
                        <fo:block text-align="left" font-weight="bold" margin-left="-10mm" margin-right="-5mm">
                            <xsl:text>&#xa0;</xsl:text>
                            <fo:retrieve-marker retrieve-class-name="section-title-en"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-after="9mm" padding-before="6mm">
                        <fo:block text-align="right" margin-left="-10mm" margin-right="-5mm">
                            <fo:page-number/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="right-toc-header-cargotec">
        <!-- Section no (group), section title, page no -->
        <fo:table
            table-layout="fixed"
            font-size="9pt"
            border-after-style="solid">
            <fo:table-column column-number="1" column-width="16%"/>
            <fo:table-column column-number="2" column-width="31%"/>
            <fo:table-column column-number="3" column-width="47%"/>
            <fo:table-column column-number="4" column-width="6%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell padding-after="9mm" padding-before="6mm">
                        <fo:block text-align="left" margin-left="-5mm" margin-right="-10mm">
                            <xsl:text>Group No.&#xa0;&#xa0;</xsl:text>
                            <fo:retrieve-marker retrieve-class-name="section-no"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-after="9mm" padding-before="6mm">
                        <fo:block text-align="right" font-weight="bold" margin-left="-5mm" margin-right="-10mm">
                            <fo:retrieve-marker retrieve-class-name="section-title-swe"/>
                            <xsl:text> -</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-after="9mm" padding-before="6mm">
                        <fo:block text-align="left" font-weight="bold" margin-left="-5mm" margin-right="-10mm">
                            <xsl:text>&#xa0;</xsl:text>
                            <fo:retrieve-marker retrieve-class-name="section-title-en"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-after="9mm" padding-before="6mm">
                        <fo:block text-align="right" margin-left="-5mm" margin-right="-10mm">
                            <fo:page-number/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="left-footer-toc-cargotec">
        <!-- Kalmar, Catalogue name, Issue no -->
        <fo:block text-align="start">
            <xsl:call-template name="cargotec-logo-ref"/>
        </fo:block>
        <fo:table
            table-layout="fixed"
            font-size="7pt"
            border-before-style="solid">
            <fo:table-column column-number="1" column-width="20%"/>
            <fo:table-column column-number="2" column-width="27%"/>
            <fo:table-column column-number="3" column-width="33%"/>
            <fo:table-column column-number="4" column-width="20%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="left" margin-left="-10mm" margin-right="-5mm">
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="right" margin-left="-10mm" margin-right="-5mm">
                            <xsl:value-of select="//meta-data/doc-info/title"/>
                            <xsl:text> -</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="left" font-weight="bold" margin-left="-10mm" margin-right="-5mm">
                            <xsl:text>&#xa0;</xsl:text>
                            <xsl:value-of select="//meta-data/doc-info/title"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="right" margin-left="-10mm" margin-right="-5mm">
                            <xsl:text>Issue No</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-before="4mm">
                        <fo:block margin-left="-10mm" margin-right="-5mm">
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" padding-before="4mm">
                        <fo:block text-align="center" font-weight="bold" margin-left="-10mm" margin-right="-5mm">
                            <xsl:text>DRF 100</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="4mm">
                        <fo:block margin-left="-10mm" margin-right="-5mm">
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template name="right-footer-toc-cargotec">
        <!-- Catalogue name, Kalmar, Issue no -->
        <fo:block text-align="end">
            <xsl:call-template name="cargotec-logo-ref"/>
        </fo:block>
        <fo:table
            table-layout="fixed"
            font-size="7pt"
            border-before-style="solid">
            <fo:table-column column-number="1" column-width="20%"/>
            <fo:table-column column-number="2" column-width="33%"/>
            <fo:table-column column-number="3" column-width="27%"/>
            <fo:table-column column-number="4" column-width="20%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="left" margin-left="-5mm" margin-right="-10mm">
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="right" margin-left="-5mm" margin-right="-10mm">
                            <xsl:value-of select="//meta-data/doc-info/title"/>
                            <xsl:text> -</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="left" font-weight="bold" margin-left="-5mm" margin-right="-10mm">
                            <xsl:text>&#xa0;</xsl:text>
                            <xsl:value-of select="//meta-data/doc-info/title"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="right" margin-left="-5mm" margin-right="-10mm">
                            <xsl:text>Issue No</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-before="4mm">
                        <fo:block margin-left="-5mm" margin-right="-10mm">
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" padding-before="4mm">
                        <fo:block text-align="center" font-weight="bold" margin-left="-5mm" margin-right="-10mm">
                            <xsl:text>DRF 100</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="4mm">
                        <fo:block margin-left="-5mm" margin-right="-10mm">
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    
    <!-- Demo header for Cargotec contents -->
    <xsl:template name="region-before-cargotec">
        <xsl:if test="$page.headers = '1'">
            <!-- Left Page Header -->
            <fo:static-content flow-name="xsl-region-before-left-cargotec">
                <!--                <xsl:call-template name="left-header-cargotec"/>-->
                <fo:block><!-- Empty for now in contents --></fo:block>
            </fo:static-content>
            
            <!-- Right Page Header -->
            <fo:static-content flow-name="xsl-region-before-right-cargotec">
                <!--                <xsl:call-template name="right-header-cargotec"/>-->
                <fo:block><!-- Empty for now in contents, header done in body contents --></fo:block>
            </fo:static-content>
        </xsl:if>
    </xsl:template>
    
    <!-- Demo footer for Cargotec contents -->
    <xsl:template name="region-after-cargotec">
        <!-- Left Page Footer -->
        <fo:static-content flow-name="xsl-region-after-left-cargotec">
            <!--            <xsl:call-template name="left-footer-cargotec"/>-->
            <fo:block><!-- Empty for now in contents --></fo:block>
        </fo:static-content>
        
        <!-- Right Page Footer -->
        <fo:static-content flow-name="xsl-region-after-right-cargotec">
            <fo:block margin-left="5mm" margin-right="10mm">
                <xsl:call-template name="right-footer-cargotec"/>
            </fo:block>
        </fo:static-content>
        
        <!-- Footnote Separator -->
        <xsl:call-template name="ftnote-separator"/>
    </xsl:template>
    
    
    <!-- Right-page header for Cargotec contents -->
    <xsl:template name="right-header-cargotec">
        <!-- section-group no, group title, part list title, page no
            Implemented in BODY -->
    </xsl:template>
    
    <!-- Right-page footer for Cargotec contents -->
    <xsl:template name="right-footer-cargotec">
        <!-- Section no, illustration no, Catalogue title, Issue no -->
        <fo:block text-align="end">
            <xsl:call-template name="cargotec-logo-ref"/>
        </fo:block>
        <fo:table
            table-layout="fixed"
            font-size="7pt"
            border-before-style="solid">
            <fo:table-column column-number="1" column-width="22%"/>
            <fo:table-column column-number="2" column-width="28%"/>
            <fo:table-column column-number="3" column-width="28%"/>
            <fo:table-column column-number="4" column-width="22%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="left" margin-left="-5mm">
                            <xsl:text>Section / Illustr. No.</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="right" margin-left="-5mm" margin-right="-10mm">
                            <xsl:value-of select="//meta-data/doc-info/title"/>
                            <xsl:text> -</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="left" font-weight="bold" margin-left="-5mm" margin-right="-10mm">
                            <xsl:text>&#xa0;</xsl:text>
                            <xsl:value-of select="//meta-data/doc-info/title"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="2mm">
                        <fo:block text-align="right" margin-right="-10mm">
                            <xsl:text>Issue No Stuff for body</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-before="4mm">
                        <fo:block>
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" padding-before="4mm">
                        <fo:block text-align="center" font-weight="bold" margin-left="-5mm" margin-right="-10mm">
                            <xsl:text>DRF 100</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-before="4mm">
                        <fo:block>
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    
    <xsl:template name="cargotec-logo-ref">
        <fo:external-graphic>
            <xsl:choose>
                <xsl:when test="contains($applic,'Grupp_A')">
                    <xsl:attribute name="height">20mm</xsl:attribute>
                    <xsl:attribute name="content-height">scale-to-fit</xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('url(',$standard.files.dir,$tux.image,')')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="width">30mm</xsl:attribute>
                    <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('url(',$standard.files.dir,$logo.image,')')"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
        </fo:external-graphic>
    </xsl:template>
    
</xsl:stylesheet>