<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:map="http://www.w3.org/2005/xpath-functions"
  exclude-result-prefixes="#all" version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Mar 31, 2021</xd:p>
      <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
      <xd:p>This stylesheet simply parses a downloaded JSON file and saves out a text file
        containing the path to the latest tomik23 autocomplete distro.</xd:p>
    </xd:desc>
  </xd:doc>

  <xd:doc>
    <xd:desc>Project root directory is passed as a parameter.</xd:desc>
  </xd:doc>
  <xsl:param name="projDir" as="xs:string" select="'./..'"/>

  <xd:doc>
    <xd:desc>Output is plain text.</xd:desc>
  </xd:doc>
  <xsl:output method="text" encoding="UTF-8" normalization-form="NFC"/>

  <xd:doc>
    <xd:desc>The beef</xd:desc>
  </xd:doc>
  <xsl:template match="/">
    <xsl:variable name="jsonPath" as="xs:string" select="$projDir || 'latest.json'"/>
    <!--   <xsl:variable name="jsonPath" as="xs:string" select="$projDir"/>-->
    <xsl:variable name="outputFile" as="xs:string" select="replace($jsonPath, '\.json$', '.txt')"/>
    <xsl:message expand-text="yes">Attempting to parse {$jsonPath} and write URL to
      {$outputFile}.</xsl:message>

    <xsl:variable name="jsonStr" select="unparsed-text($jsonPath)"/>

    <xsl:variable as="document-node()" name="jsonXml" select="json-to-xml($jsonStr)"/>
    
    <!-- Add a stanza to the following if you want to add a new external library to download -->
    <xsl:variable as="xs:string" name="download_url">
      <xsl:choose>
        <xsl:when test="contains($projDir, 'openlayers')">
          <!-- OpenLayers provides tar/zipball_url values as well as a browser_download_url, which is what we want -->
          <xsl:value-of select="$jsonXml/descendant::*:string[@key = 'browser_download_url'][1]/text()"/>
        </xsl:when>
        <xsl:when test="contains($projDir, 'autocomplete')">
          <!-- AutoComplete only provides a tar/zipball_url so we'll use it -->
          <xsl:value-of select="$jsonXml/descendant::*:string[@key = 'zipball_url'][1]/text()"/>
        </xsl:when>
        <xsl:when test="contains($projDir, 'tablesort')">
          <!-- TableSort only provides a tar/zipball_url so we'll use it -->
          <xsl:value-of select="$jsonXml/descendant::*:string[@key = 'zipball_url'][1]/text()"/>
        </xsl:when>
      </xsl:choose>  
    </xsl:variable>
    
    <xsl:result-document href="{$outputFile}">
      <xsl:sequence select="$download_url"/>
    </xsl:result-document>

  </xsl:template>
</xsl:stylesheet>
