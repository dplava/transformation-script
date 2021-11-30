<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:omeka="http://omeka.org/schemas/omeka-xml/v5"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"                     
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/" expand-text="no">
        <xsl:result-document method="xml" indent="yes" encoding="utf-8" href="{(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='43']/omeka:elementTextContainer/omeka:elementText/omeka:text)}.xml">
            <xsl:element name="mdRecord" xmlns="http://dplava.lib.virginia.edu">
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
    </xsl:template>
    
    <xsl:template name="metadata">
        <xsl:element name="dcterms:identifier"><xsl:value-of select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='43']/omeka:elementTextContainer/omeka:elementText/omeka:text)"/></xsl:element>
        <xsl:element name="dcterms:title"><xsl:value-of select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='50']/omeka:elementTextContainer/omeka:elementText/omeka:text)"/></xsl:element>
        <xsl:element name="dcterms:description"><xsl:value-of select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='41']/omeka:elementTextContainer/omeka:elementText/omeka:text)"/></xsl:element>
        <xsl:element name="dcterms:language"><xsl:value-of select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='44']/omeka:elementTextContainer/omeka:elementText/omeka:text)"/></xsl:element>
        <xsl:for-each select="(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='39']/omeka:elementTextContainer/omeka:elementText/omeka:text)"><xsl:element name="dcterms:creator"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='49']/omeka:elementTextContainer/omeka:elementText/omeka:text)"><xsl:element name="dcterms:subject"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:for-each select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='38']/omeka:elementTextContainer/omeka:elementText/omeka:text)"><xsl:element name="dcterms:spatial"><xsl:value-of select="normalize-space(.)"/></xsl:element></xsl:for-each>
        <xsl:element name="dcterms:date"><xsl:value-of select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='40']/omeka:elementTextContainer/omeka:elementText/omeka:text)"/></xsl:element>
        <xsl:element name="dcterms:type"><xsl:value-of select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='51']/omeka:elementTextContainer/omeka:elementText/omeka:text)"/></xsl:element>
        <xsl:element name="dcterms:isPartOf"><xsl:value-of select="normalize-space(/omeka:item/omeka:collection/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='50']/omeka:elementTextContainer/omeka:elementText/omeka:text)"/></xsl:element>
        <xsl:element name="dcterms:rights"><xsl:value-of select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='47']/omeka:elementTextContainer/omeka:elementText[2]/omeka:text)"/></xsl:element>
        <xsl:element name="dcterms:provenance"><xsl:value-of select="normalize-space(/omeka:item/omeka:elementSetContainer/omeka:elementSet/omeka:elementContainer/omeka:element[@elementId='48']/omeka:elementTextContainer/omeka:elementText/omeka:text)"/></xsl:element>
        <xsl:element name="edm:preview"><xsl:value-of select="/omeka:item/omeka:fileContainer/omeka:file[1]/omeka:src"/></xsl:element>
        <xsl:element name="edm:isShownAt">http://dams.hsc.edu/items/show/<xsl:value-of select="/*/@itemId"/></xsl:element>
    </xsl:template>
    
</xsl:stylesheet>