<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    version="1.0">
    
    <!-- demo-toc.xsl -->



    <!-- Main TOC in Document -->
    <!-- ==================== -->
    
    <xsl:template name="one-level-toc-cargotec">
        <xsl:apply-templates
            select="//section[parent::body]/title |
            //inset[parent::body]"
            mode="toc-cargotec"/>
    </xsl:template>
    
    <xsl:template name="two-level-toc-cargotec">
        <xsl:apply-templates
            select="//section[parent::body]/title |
            //section[parent::body]/section/title |
            //section[parent::body]/group/title |
            //inset[parent::body] |
            //section[parent::body]/inset"
            mode="toc-cargotec"/>
    </xsl:template>
    
    <xsl:template name="three-level-toc-cargotec">
        <xsl:apply-templates
            select="//section[parent::body]/title |
            //section[parent::body]/section/title |
            //section[parent::body]/group/title |
            //section[parent::body]/section/section/title |
            //inset[parent::body] |
            //section[parent::body]/inset |
            //section[parent::body]/section/inset"
            mode="toc-cargotec"/>
    </xsl:template>
    
    <!-- TOC entry, level 1 -->
    <xsl:template match="//section[not(parent::section)]/title" mode="toc-cargotec">
        <fo:table-row
            font-weight="bold"
            font-size="12pt"
            space-before="3pt">
            <fo:table-cell>
                <fo:block font-weight="bold">
                    <xsl:if test="$section.numbering=1 and ./@xml:lang='sv-SE'">
                        <xsl:call-template name="toc-numbering-choice-cargotec"/>
                    </xsl:if>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align-last="justify">
                    <!-- Testing: hyperlinked level 1 -->
                    <fo:basic-link
                        internal-destination="{generate-id(.)}"
                        show-destination="replace">
                        <xsl:value-of select="."/>
                        <xsl:text>&#xA0; </xsl:text>
                        <fo:leader leader-pattern="dots"/>
                        <fo:page-number-citation ref-id="{generate-id(.)}"/>
                    </fo:basic-link>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    
    <!-- TOC entry, level 2 -->
    <xsl:template
        match="//section[not(parent::section)]/section/title"
        mode="toc-cargotec">
        <fo:table-row
            font-weight="normal"
            font-size="10pt">
            <fo:table-cell>
                <fo:block>
                    <xsl:if test="$section.numbering=1 and ./@xml:lang='sv-SE'">
                        <xsl:call-template name="toc-numbering-choice-cargotec"/>
                    </xsl:if>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align-last="justify">
                    <xsl:value-of select="."/>&#xA0; 
                    <xsl:text>&#xA0;</xsl:text>
                    <fo:leader leader-pattern="dots"/>
                    <fo:page-number-citation ref-id="{generate-id(.)}"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    
    <!-- TOC entry, level 3 -->
    <xsl:template match="//section[not(parent::section)]/section/section/title" mode="toc-cargotec">
        <fo:table-row font-weight="normal" font-size="10pt">
            <fo:table-cell>
                <fo:block>
                    <xsl:if test="$section.numbering=1 and ./@xml:lang='sv-SE'">
                        <xsl:call-template name="toc-numbering-choice-cargotec"/>
                    </xsl:if>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align-last="justify">
                    <xsl:value-of select="."/>&#xA0; <fo:leader leader-pattern="dots"/>
                    <fo:page-number-citation ref-id="{generate-id(.)}"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    
    <!-- TOC entry, groups, level 2 -->
    <xsl:template match="//section[not(parent::section)]/group/title" mode="toc-cargotec">
        <fo:table-row
            font-weight="normal"
            font-size="10pt">
            <fo:table-cell>
                <fo:block>
                    <xsl:if test="$section.numbering=1 and ./@xml:lang='sv-SE'">
                        <xsl:call-template name="toc-numbering-choice-cargotec"/>
                    </xsl:if>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block text-align-last="justify">
                    <xsl:value-of select="."/>&#xA0; <fo:leader leader-pattern="dots"/>
                    <fo:page-number-citation ref-id="{generate-id(../part-list/part[@main='yes'][1])}"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    
    
    <xsl:template name="toc-numbering-choice-cargotec">
        <xsl:choose>
            <xsl:when test="ancestor::body">
                <xsl:number
                    level="multiple"
                    count="section[ancestor::body]|group|inset[ancestor::body]"
                    format="1.1"/>
            </xsl:when>
            <xsl:when test="ancestor::back">
                <xsl:number
                    level="multiple"
                    count="section[ancestor::back]|inset[ancestor::back]"
                    format="A.1"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>