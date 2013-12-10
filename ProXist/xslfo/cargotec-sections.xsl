<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- demo-sections.xsl -->
    
    
    
    <!-- Document Body -->
    <!-- ============= -->
    
    <!-- Demo body -->
    <xsl:template name="body-cargotec">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="section[@parts-listing='yes']">
        <!-- TOC for parts chapter -->
        <xsl:call-template name="chapter-toc"/>
        
        <fo:page-sequence master-reference="contents-cargotec">
            <xsl:attribute name="initial-page-number">1</xsl:attribute>
            
            <xsl:call-template name="region-before-cargotec"/>
            <xsl:call-template name="region-after-cargotec"/>
            
            <fo:flow flow-name="xsl-region-body">
                
                <fo:block
                    font-family="sans-serif"
                    font-size="7pt">
                    <xsl:apply-templates select="title" mode="cargotec"/>
                    <xsl:apply-templates select="group"/>
                </fo:block>
                
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    
    <xsl:template match="title[parent::section]" mode="cargotec">
        <fo:block id="{generate-id(.)}"></fo:block>
    </xsl:template>
    
    <xsl:template name="chapter-toc">
        <fo:page-sequence master-reference="TOC-cargotec">
            <xsl:attribute name="initial-page-number">1</xsl:attribute>
            
            <xsl:call-template name="region-before-toc-cargotec"/>
            <xsl:call-template name="region-after-toc-cargotec"/>
            
            <fo:flow flow-name="xsl-region-body">
                <fo:block
                    font-family="sans-serif"
                    font-size="8pt">
                    
                    <fo:marker marker-class-name="section-title-swe">
                        <xsl:value-of select="./title[@xml:lang='sv-SE']"/>
                    </fo:marker>
                    <fo:marker marker-class-name="section-title-en">
                        <xsl:value-of select="./title[@xml:lang='en-GB']"/>
                    </fo:marker>
                    <fo:marker marker-class-name="section-no">
                        <xsl:number count="section" level="multiple" from="body"/>
                    </fo:marker>
                    
                    <fo:table table-layout="fixed">
                        <fo:table-column column-number="1" column-width="16%"/>
                        <fo:table-column column-number="2" column-width="84%"/>
                        <fo:table-body>
                            <xsl:apply-templates select="group" mode="cargotec-toc"/>
                        </fo:table-body>
                    </fo:table>
                    
                </fo:block>
                
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    
    <xsl:template match="group" mode="cargotec-toc">
        <!-- Group title row -->
        <fo:table-row padding-before="8pt">
            <fo:table-cell>
                <fo:block>
                    <!-- Empty for group title row -->
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-before="2mm">
                <fo:table table-layout="fixed" font-weight="bold">
                    <fo:table-column column-number="1" column-width="36%"/>
                    <fo:table-column column-number="2" column-width="64%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>
                                    <xsl:value-of select="title[@xml:lang='sv-SE']"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>
                                    <xsl:value-of select="title[@xml:lang='en-GB']"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:table-cell>
        </fo:table-row>
        <!-- The rest of the group -->
        <fo:table-row>
            <!-- Group No -->
            <fo:table-cell padding-end="7mm">
                <fo:block text-align="end">
                    <xsl:number count="section|group" level="multiple" from="body" format="1.1"/>
                </fo:block>
            </fo:table-cell>
            <!-- Group contents -->
            <fo:table-cell>
                <fo:table table-layout="fixed">
                    <fo:table-column column-number="1" column-width="36%"/>
                    <fo:table-column column-number="2" column-width="36%"/>
                    <fo:table-column column-number="3" column-width="20%"/>
                    <fo:table-column column-number="4" column-width="8%"/>
                    <fo:table-body>
                        <xsl:apply-templates select="part-list" mode="cargotec-toc"/>
                    </fo:table-body>
                </fo:table>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    
    
    
</xsl:stylesheet>