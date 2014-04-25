<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0"
    exclude-result-prefixes="xsl"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method='html' indent="yes"/> 
    
    <xsl:param name="page-len" select='20'/>
    <xsl:key name="sector" match="item" use="@sector"/>
    <xsl:key name="subsector" match="item" use="@subsector"/>
    
    <xsl:template match='data'>
        <div>
            <xsl:apply-templates select='subsector[1]'/>

        </div>
    </xsl:template>
    
    <xsl:template match="subsector">
        <xsl:param name="line" select='0'/>
        
        <xsl:variable name="items" select='key("subsector",@id)'/>
        <xsl:variable name="last" select="count($items)+1+$line"/>
        
        <xsl:choose>
            <xsl:when test="$last &lt;= $page-len or not($line)">
                <p><xsl:value-of select="current()"/></p>
                <p><xsl:text>++++++++++++++++</xsl:text></p>
                <p><xsl:text>ID Value</xsl:text></p>
                <p><xsl:text>----------------</xsl:text></p>
                <xsl:apply-templates select='$items'/>
                <xsl:apply-templates select='following::subsector[1]'>
                    <xsl:with-param name='line' select='$last'/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                    <hr class='newpage'/>
                    <xsl:apply-templates select='.'/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match='item'>
        <p>
        <xsl:if test="not(position() mod $page-len)">
            <hr class='newline'/>
        </xsl:if>
        <xsl:value-of select='./@id'/>
        <xsl:text> </xsl:text>
        <xsl:value-of select='.'/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>