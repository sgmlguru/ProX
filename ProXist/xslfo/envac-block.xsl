<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:svg="http://www.w3.org/2000/svg" version="1.0">

    <!-- envac-block.xsl -->


    <xsl:template name="envac-spanned-image">
        <xsl:param name="guidelines">
            <xsl:call-template name="getString">
                <xsl:with-param name="stringName"
                    select="'build-guidelines'"/>
            </xsl:call-template>
        </xsl:param>
        <fo:block span="all">
            <fo:table
                width="180mm"
                table-layout="fixed"
                border-style="solid"
                border-color="#d2d2d2"
                margin-bottom="10pt">
                <fo:table-column column-number="1" column-width="172mm"/>
                <fo:table-column column-number="2" column-width="8mm"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block text-align="center" padding="10mm">
                                <xsl:apply-templates mode="envac"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell background-color="#d2d2d2">
                            <fo:block-container
                                reference-orientation="270"
                                inline-progression-dimension="90mm">
                                <fo:block
                                    font-family="Arial"
                                    font-size="11pt"
                                    color="white"
                                    margin-left="3mm"
                                    margin-top="5pt"
                                    >
                                    <!-- word-spacing.optimum="3pt"
                                        letter-spacing.optimum="0.5pt" -->
                                    <xsl:value-of select="translate($guidelines,'abcdefghijklmnopqrstuvwxyzåäö','ABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ')"/>
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

    <xsl:template match="graphics" mode="envac">
        <xsl:call-template name="envac-external-image"/>
    </xsl:template>

    <xsl:template name="envac-external-image">
        <!-- This is actually not required by XSL Rec (see XepOp.java) -->
        <xsl:variable name="start">url(&apos;</xsl:variable>
        <xsl:variable name="end">&apos;)</xsl:variable>
        <fo:external-graphic scaling="uniform" overflow="hidden">

            <xsl:choose>
                <xsl:when test="ancestor::figure/@role = 'span'">
                    <!-- @width != '' and @height != '' -->
                    <xsl:if test="$paper.type = 'A4'">
                        <xsl:attribute name="content-height">70mm</xsl:attribute>
                    </xsl:if>
                    <xsl:if test="$paper.type = 'A5'">
                        <xsl:attribute name="content-height">50mm</xsl:attribute>
                    </xsl:if>
                </xsl:when>

            </xsl:choose>


            <xsl:if test="parent::step and preceding-sibling::*">
                <xsl:attribute name="keep-with-previous">always</xsl:attribute>
            </xsl:if>

            <xsl:attribute name="src">
                <xsl:value-of select="concat($start, @xlink:href, $end)"/>
            </xsl:attribute>
        </fo:external-graphic>
    </xsl:template>

</xsl:stylesheet>
