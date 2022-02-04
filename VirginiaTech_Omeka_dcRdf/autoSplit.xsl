<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://dplava.lib.virginia.edu"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"                     
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:template match="/">
        <xsl:apply-templates select="rdf:RDF"/>
    </xsl:template>
    
    <xsl:template match="rdf:RDF" expand-text="no">
        <xsl:for-each select="rdf:Description">
            <xsl:result-document method="xml" indent="yes" encoding="utf-8" href="{substring(dcterms:identifier,15,11)}.xml">
                <xsl:element name="mdRecord">
                    <xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:text>http://dplava.lib.virginia.edu dplava.xsd</xsl:text>
                    </xsl:attribute>
                    <xsl:namespace name="dc" select="'http://purl.org/dc/elements/1.1/'"/>
                    <xsl:namespace name="dcterms" select="'http://purl.org/dc/terms/'"/>
                    <xsl:namespace name="rdf" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'"/>
                    <xsl:namespace name="edm" select="'http://www.europeana.eu/schemas/edm/'"/>
                    <xsl:call-template name="metadata"/>
                </xsl:element>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="metadata">
        <xsl:variable name="identifier" select="normalize-space(dcterms:identifier)"/>
        <xsl:element name="dcterms:identifier"><xsl:value-of select="$identifier[1]"/></xsl:element>
        <xsl:element name="dcterms:title"><xsl:value-of select="normalize-space(dcterms:title)"/></xsl:element>
        <xsl:for-each select="dcterms:description"><xsl:element name="dcterms:description"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:language"><xsl:element name="dcterms:language"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:creator"><xsl:element name="dcterms:creator"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:contributor"><xsl:element name="dcterms:contributor"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:subject"><xsl:element name="dcterms:subject"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:date"><xsl:element name="dcterms:created"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:type"><xsl:element name="dcterms:type"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:isPartOf"><xsl:element name="dcterms:isPartOf"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:creator"><xsl:element name="dcterms:creator"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:extent"><xsl:element name="dcterms:extent"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:medium"><xsl:element name="dcterms:medium"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="dcterms:format"><xsl:element name="dcterms:format"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:element name="dcterms:rights"><xsl:value-of select="normalize-space(dcterms:rights[1])"/></xsl:element>
        <xsl:for-each select="dcterms:rightsHolder"><xsl:element name="dcterms:rightsHolder"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:element name="dcterms:provenance"><xsl:value-of select="normalize-space(dcterms:provenance[1])"/></xsl:element>
        <xsl:element name="edm:isShownAt">https://di.lib.vt.edu/items/show/<xsl:value-of select="$identifier"/></xsl:element>
        <!--deactivated, variable doesn't work <xsl:element name="edm:preview">https://di.lib.vt.edu/files/thumbnails/Leonard_J._Currie_s_Slides_Collection/<xsl:value-of select="normalize-space(dcterms:identifier)"/>/<xsl:value-of select="normalize-space(dcterms:identifier)"/>.jpg</xsl:element>-->
        <xsl:element name="edm:preview">https://di.lib.vt.edu/files/thumbnails/Leonard_J._Currie_s_Slides_Collection/<xsl:value-of select="$identifier"/>/<xsl:value-of select="$identifier"/>.jpg</xsl:element>
    </xsl:template>
    
</xsl:stylesheet>

<!-- 
    trial one - apply template - succeed 
    trial two - removed record from source file xsl
    trial three - call template for mdRecord - failed, need closing tag
    trial four - call template for chunk of metadata - failed, need namespace declaration
    trial four - call template for chunk of metadata with declaration added to top of stylesheet - succeed
    trial five - using original output - failed, normalize-space works only on xsl:value-of select, couldn't remove whitespace
    trial six - using original output - calling all templates with normalize-space, failed
    trial seven - using original output - copy-of validation-"strip" doesn't work
    trial eight - using original output - normalize all values using value-of select, filename not normalized due to AVT
    trial nine - using original output - using substring position for filename - succeed
    trail ten - using original output - each repeated elements will not be shown properly in output, use for-each on each element. some do not require it - succeed
    trial eleven - using keyname for identifier - failed (to try again)
    trial twelve - using namespace, xsi namespace must be w3 or output xsi is "xsl1"
    trial thirteen - variable for identifier succeed in metadata template but unable to create global variable for for filename, error message "cannot write more than one result document to the same URI" (to try again)
-->