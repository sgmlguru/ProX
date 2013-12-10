<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- demo-block.xsl -->
    
    
    
    <!-- Block-level -->
    <!-- =========== -->
    
    <xsl:template match="part-list" mode="cargotec-toc">
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
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="part[@main='yes'][1]/part-no"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align="end">
                    <!-- Page number citation for part #1 -->
                    <fo:page-number-citation ref-id="{generate-id(part[@main='yes'][1])}"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    
    <xsl:template match="group">
        <xsl:apply-templates select="part-list"/>
    </xsl:template>
    
    <xsl:template match="part-list">
        <fo:block page-break-before="left">
            <xsl:apply-templates select="graphics" mode="cargotec-demo"/>
        </fo:block>
        
        <!-- "Header part" for content pages -->
        <fo:table
            page-break-before="right"
            table-layout="fixed"
            font-size="9pt"
            border-after-style="solid"
            id="{generate-id(.)}">
            <fo:table-column column-number="1" column-width="19%"/>
            <fo:table-column column-number="2" column-width="31%"/>
            <fo:table-column column-number="3" column-width="44%"/>
            <fo:table-column column-number="4" column-width="6%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:text>Group No.&#xa0;&#xa0;&#xa0;</xsl:text>
                            <xsl:number count="section|group" level="multiple" from="body" format="1.1"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right">
                            <xsl:value-of select="ancestor::group/title[@xml:lang='sv-SE']"/>
                            <xsl:text> -</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:text>&#xa0;</xsl:text>
                            <xsl:value-of select="ancestor::group/title[@xml:lang='en-GB']"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right">
                            <fo:page-number-citation ref-id="{generate-id(.)}"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="right" font-weight="bold">
                            <xsl:value-of select="title[@xml:lang='sv-SE']"/>
                            <xsl:text> -</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left" font-weight="bold">
                            <xsl:text>&#xa0;</xsl:text>
                            <xsl:value-of select="title[@xml:lang='en-GB']"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <!-- Empty -->
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" padding-after="2mm">
                        <fo:block text-align="center">
                            <xsl:value-of select="part[@main='yes'][1]/part-no"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
        
        <!-- Content part -->
        <fo:table
            table-layout="fixed"
            margin-top="4mm" border-before-style="solid" border-start-style="solid" border-end-style="solid">
            <fo:table-column border-end-style="solid" column-number="1" column-width="6%"/>
            <fo:table-column border-end-style="solid" column-number="2" column-width="10%"/>
            <fo:table-column border-end-style="solid" column-number="3" column-width="14%"/>
            <fo:table-column border-end-style="solid" column-number="4" column-width="20%"/>
            <fo:table-column border-end-style="solid" column-number="5" column-width="20%"/>
            <fo:table-column column-number="6" column-width="30%"/>
            <fo:table-header>
                <fo:table-row border-after-style="solid">
                    <fo:table-cell padding-start="2mm" padding-before="1mm" padding-after="1mm">
                        <fo:block>
                            <xsl:value-of select="'Pos.'"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-start="2mm" padding-before="1mm" padding-after="1mm">
                        <fo:block>
                            <xsl:value-of select="'Quantity'"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-start="2mm" padding-before="1mm" padding-after="1mm">
                        <fo:block>
                            <xsl:value-of select="'Part No.'"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-start="2mm" padding-before="1mm" padding-after="1mm">
                        <fo:block>
                            <xsl:value-of select="'Benämning'"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-start="2mm" padding-before="1mm" padding-after="1mm">
                        <fo:block>
                            <xsl:value-of select="'Description'"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-start="2mm" padding-before="1mm" padding-after="1mm">
                        <fo:block>
                            <xsl:value-of select="'Notes'"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:apply-templates select="part"/>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    <xsl:template match="part">
        <fo:table-row>
            <fo:table-cell padding-end="4mm">
                <fo:block id="{generate-id(.)}" text-align="end">
                    <xsl:choose>
                        <xsl:when test="./@main = 'yes'">
                            <!-- No count if @main='yes' -->
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:number count="part[not(@main)]" from="part-list"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align="center">
                    <xsl:choose>
                        <xsl:when test="./@main = 'yes'">
                            <xsl:attribute name="padding-before">3mm</xsl:attribute>
                            <xsl:value-of select="'-'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="qty"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-start="2mm">
                <fo:block>
                    <xsl:if test="./@main = 'yes'">
                        <xsl:attribute name="padding-before">3mm</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="part-no"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-start="2mm">
                <fo:block>
                    <xsl:value-of select="label[@xml:lang='sv-SE']"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-start="2mm">
                <fo:block>
                    <xsl:value-of select="label[@xml:lang='en-GB']"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding-start="2mm">
                <fo:block>
                    <xsl:value-of select="descr"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
        <xsl:apply-templates select="part"/>
    </xsl:template>
    
    
    
    <xsl:template match="graphics" mode="cargotec-demo">
        <xsl:variable name="start">url(&apos;</xsl:variable>
        <xsl:variable name="end">&apos;)</xsl:variable>
        <fo:external-graphic scaling="uniform" overflow="hidden">
            
            <xsl:choose>
                <xsl:when test="@width != '' and @height != ''">
                    <xsl:choose>
                        
                        <!-- Inline -->
                        <xsl:when test="ancestor::p">
                            <xsl:attribute name="content-height">
                                <xsl:value-of select="12"/>
                            </xsl:attribute>
                        </xsl:when>
                        
                        <!-- Block level and @height > @width, not in procedure -->
                        <xsl:when test="(@height &gt; @width) and not(ancestor::step)">
                            <xsl:attribute name="content-height">
                                <xsl:choose>
                                    <xsl:when test="@height &gt; '300'">
                                        <xsl:value-of select="'300'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="@height"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </xsl:when>
                        
                        <!-- Block level and @width > @height, not in procedure -->
                        <xsl:when test="(@height &lt; @width) and not(ancestor::step)">
                            <xsl:attribute name="content-width">
                                <xsl:choose>
                                    <xsl:when test="@width &gt; '400'">
                                        <xsl:value-of select="'400'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="@width"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </xsl:when>
                        
                        <!-- Block level and @height > @width, in procedure -->
                        <xsl:when test="(@height &gt; @width) and ancestor::step">
                            <xsl:attribute name="content-height">
                                <xsl:choose>
                                    <xsl:when test="@height &gt; '300'">
                                        <xsl:value-of select="'300'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="@height"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </xsl:when>
                        
                        <!-- Block level and @width > @height, in procedure -->
                        <xsl:otherwise>
                            <xsl:attribute name="content-width">
                                <xsl:choose>
                                    <xsl:when test="@width &gt; '300'">
                                        <xsl:value-of select="'300'"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="@width"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </xsl:otherwise>
                        
                    </xsl:choose>
                </xsl:when>
                
                
                <!-- Height or width attribute, or both, missing -->
                <xsl:when test="not(@width) and not(@height) and not(ancestor::p)">
                    <xsl:attribute name="content-width">
                        <xsl:value-of select="'100%'"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="not(@width) and not(@height) and ancestor::p">
                    <xsl:attribute name="content-width">
                        <xsl:value-of select="'12'"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@width != '' and not(@height)">
                    <xsl:attribute name="content-width">
                        <xsl:value-of select="@width"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="not(@width) and @height != ''">
                    <xsl:attribute name="content-height">
                        <xsl:value-of select="@height"/>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            
            
            <xsl:if test="parent::step and preceding-sibling::*">
                <xsl:attribute name="keep-with-previous">always</xsl:attribute>
            </xsl:if>
            
            <xsl:choose>
                <!-- Replace Flash image with still alternative -->
                <!-- Assumes a JPG image with the same name in the same directory -->
                <xsl:when test="contains(@xlink:href,'.swf')">
                    <xsl:attribute name="src">
                        <xsl:value-of
                            select="concat($start, substring-before(@xlink:href, 'swf'),'jpg', $end)"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat($start, @xlink:href, $end)"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
        </fo:external-graphic>
    </xsl:template>
    
    
</xsl:stylesheet>