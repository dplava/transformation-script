<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://dplava.lib.virginia.edu"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:edm="http://www.europeana.eu/schemas/edm/" exclude-result-prefixes="xs oai oai_dc"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">

    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:for-each select="metadata/record">
            <xsl:if test="normalize-space(identifier) != ''">
            <xsl:variable name="filename">
                <xsl:value-of select="identifier"/>
            </xsl:variable>
            <xsl:result-document href="{concat($filename, '.xml')}">
                <mdRecord xsi:schemaLocation="http://dplava.lib.virginia.edu/dplava.xsd">

                    <xsl:if test="normalize-space(title) != ''">
                            <dcterms:title>
                                <xsl:value-of select="title"/>
                            </dcterms:title>
                    </xsl:if>

                    <xsl:if test="normalize-space(creator) != ''">
                        <xsl:variable name="creator" select="creator"/>
                        <xsl:for-each select="tokenize($creator, ';')">
                            <dcterms:creator>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:creator>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:if test="normalize-space(contributor[1]) != ''">
                        <xsl:variable name="contributor" select="contributor[1]"/>
                        <xsl:for-each select="tokenize($contributor, ';')">
                            <dcterms:contributor>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:contributor>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:if test="normalize-space(publisher) != ''">
                        <xsl:variable name="publisher" select="publisher"/>
                        <xsl:for-each select="tokenize($publisher, ';')">
                            <dcterms:publisher>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:publisher>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:if test="normalize-space(date) != ''">
                        <xsl:variable name="date" select="date"/>
                        <xsl:for-each select="tokenize($date, ';')">
                            <dcterms:created>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:created>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:if test="normalize-space(description) != ''">
                            <dcterms:description>
                                <xsl:value-of select="description"/>
                            </dcterms:description>
                    </xsl:if>

                    <xsl:if test="normalize-space(spatial) != ''">
                        <xsl:variable name="spatial" select="spatial"/>
                        <xsl:for-each select="tokenize($spatial, ';')">
                            <dcterms:place>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:place>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:if test="normalize-space(subject[1]) != ''">
                        <xsl:variable name="subject" select="subject[1]"/>
                        <xsl:for-each select="tokenize($subject, ';')">
                            <dcterms:subject>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:subject>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:if test="normalize-space(format) != ''">
                        <xsl:variable name="format" select="format"/>
                        <xsl:for-each select="tokenize($format, ';')">
                            <dcterms:medium>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:medium>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:if test="normalize-space(type) != ''">
                        <xsl:variable name="type" select="type"/>
                        <xsl:for-each select="tokenize($type, ';')">
                            <dcterms:type>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:type>
                        </xsl:for-each>
                    </xsl:if>
					
                    <xsl:if test="normalize-space(identifier) != ''">
                            <dcterms:identifier>
                                <xsl:value-of select="identifier"/>
                            </dcterms:identifier>
                    </xsl:if>

                    <xsl:if test="normalize-space(rights) != ''">
                            <dcterms:rights>
                                <xsl:value-of select="rights"/>
                            </dcterms:rights>
                    </xsl:if>

                    <xsl:if test="normalize-space(relation) != ''">
                            <dcterms:isPartOf>
                                <xsl:value-of select="relation"/>
                            </dcterms:isPartOf>
                    </xsl:if>

                    <xsl:if test="normalize-space(language) != ''">
                        <xsl:variable name="language" select="language"/>
                        <xsl:for-each select="tokenize($language, ';')">
                            <dcterms:language>
                                <xsl:value-of select="normalize-space(.)"/>
                            </dcterms:language>
                        </xsl:for-each>
                    </xsl:if>

                    <edm:isShownAt>
                        <xsl:value-of select="viewerURL"/>
                    </edm:isShownAt>

                    <edm:preview>
                        <xsl:value-of select="thumbnailURL"/>
                    </edm:preview>

                    <dcterms:provenance>George Washington's Mount Vernon</dcterms:provenance>

                </mdRecord>

            </xsl:result-document>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
