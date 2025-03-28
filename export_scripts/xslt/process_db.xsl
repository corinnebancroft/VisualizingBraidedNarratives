<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    xmlns:hcmc="http://hcmc.uvic.ca/ns"
    xpath-default-namespace=""
    expand-text="yes"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Mar 27, 2025</xd:p>
            <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
            <xd:p>This is an experimental tool to process any of the narratives 
            databases as dumped in XML to generate various outputs, including 
            CSV files.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>CSV output has to be done as text.</xd:desc>
    </xd:doc>
    <xsl:output name="csv" method="text" encoding="UTF-8" normalization-form="NFC" indent="no"/>
    
    <xd:doc>
        <xd:desc>The database name is the only thing that really differs.</xd:desc>
    </xd:doc>
    <xsl:variable name="dbName" as="xs:string" select="xs:string(//database/@name)"/>
    
    <xd:doc>
        <xd:desc>Some useful strings.</xd:desc>
    </xd:doc>
    <xsl:variable name="dQuote" as="xs:string">"</xsl:variable>
    <xsl:variable name="ddQuote" as="xs:string">""</xsl:variable>
    
    <xd:doc>
        <xd:desc>We create a large collection of maps for quick lookup of related table links.</xd:desc>
    </xd:doc>
    <xsl:variable name="mapContainerLevels" as="map(xs:string, xs:string)">
        <xsl:map>
            <xsl:for-each select="//table_data[@name='containerLevels']/row">
                <xsl:map-entry key="xs:string(field[@name='containerLevel_id'])" select="xs:string(field[@name='containerLevel_term'])"/>
            </xsl:for-each>
        </xsl:map>
    </xsl:variable>
    <xsl:variable name="mapCharacters" as="map(xs:string, xs:string)">
        <xsl:map>
            <xsl:for-each select="//table_data[@name='characters']/row">
                <xsl:map-entry key="xs:string(field[@name='character_id'])" select="xs:string(field[@name='character_name'])"/>
            </xsl:for-each>
        </xsl:map>
    </xsl:variable>
    <xsl:variable name="mapEmbeddedContainerTypes" as="map(xs:string, xs:string)">
        <xsl:map>
            <xsl:for-each select="//table_data[@name='embeddedContainerTypes']/row">
                <xsl:map-entry key="xs:string(field[@name='embeddedContainerType_id'])" select="xs:string(field[@name='embeddedContainerType_term'])"/>
            </xsl:for-each>
        </xsl:map>
    </xsl:variable>
    <xsl:variable name="mapIsReciprocals" as="map(xs:string, xs:string)">
        <xsl:map>
            <xsl:for-each select="//table_data[@name='isReciprocals']/row">
                <xsl:map-entry key="xs:string(field[@name='isReciprocal_id'])" select="xs:string(field[@name='isReciprocal_text'])"/>
            </xsl:for-each>
        </xsl:map>
    </xsl:variable>
    <xsl:variable name="mapMenOrExs" as="map(xs:string, xs:string)">
        <xsl:map>
            <xsl:for-each select="//table_data[@name='menOrExs']/row">
                <xsl:map-entry key="xs:string(field[@name='menOrEx_id'])" select="xs:string(field[@name='menOrEx_text'])"/>
            </xsl:for-each>
        </xsl:map>
    </xsl:variable>
    <xsl:variable name="mapNarrContainers" as="map(xs:string, xs:string)">
        <xsl:map>
            <xsl:for-each select="//table_data[@name='narrContainers']/row">
                <xsl:map-entry key="xs:string(field[@name='narrContainer_id'])" select="xs:string(field[@name='narrContainer_title'])"/>
            </xsl:for-each>
        </xsl:map>
    </xsl:variable>
    <xsl:variable name="mapNarratorTypes" as="map(xs:string, xs:string)">
        <xsl:map>
            <xsl:for-each select="//table_data[@name='narratorTypes']/row">
                <xsl:map-entry key="xs:string(field[@name='narratorType_id'])" select="xs:string(field[@name='narratorType_term'])"/>
            </xsl:for-each>
        </xsl:map>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>The root template does everything.</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:message>Processing db {$dbName}...</xsl:message>
        <xsl:message>Generating CSV for Characters table ('characters')...</xsl:message>
        <xsl:variable name="outputCharacters" as="xs:string*">
            <xsl:value-of select="'id,Name'"/>
            <xsl:for-each select="//table_data[@name='characters']/row">
                <xsl:sort select="normalize-space(lower-case(field[@name='character_name']))"/>
                <xsl:sequence select="'&#x0a;' || xs:string(field[@name='character_id']) || ','"/>
                <xsl:sequence select="hcmc:escapeString(field[@name='character_name'])"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:result-document format="csv" href="{replace(document-uri(/), '\.xml$', '_characters_test.csv')}">
            <xsl:sequence select="string-join($outputCharacters, '')"/>
        </xsl:result-document>
        
        <xsl:message>Generating CSV for Containers table ('narrContainers')...</xsl:message>
        <xsl:variable name="outputContainers" as="xs:string*">
            <xsl:value-of select="'id,Title,Level,Start Page,End Page,Narrator,Protagonist,Embed. Type'"/>
            <xsl:for-each select="//table_data[@name='narrContainers']/row">
                <xsl:sort select="xs:integer(field[@name='narrContainer_id'])"/>
                <xsl:sequence select="'&#x0a;' || xs:string(field[@name='narrContainer_id']) || ','"/>
                <xsl:sequence select="hcmc:escapeString(field[@name='narrContainer_title']) || ','"/>
                <xsl:sequence select="hcmc:escapeString(map:get($mapContainerLevels, field[@name='narrContainer_level_id_fk'])) || ','"/>
                <xsl:sequence select="hcmc:escapeString(field[@name='narrContainer_startPage']) || ','"/>
                <xsl:sequence select="hcmc:escapeString(field[@name='narrContainer_endPage']) || ','"/>
                <xsl:sequence select="hcmc:escapeString(map:get($mapCharacters, field[@name='narrContainer_narrator_character_id_fk'])) || ','"/>
                <xsl:sequence select="hcmc:escapeString(map:get($mapCharacters, field[@name='narrContainer_protagonist_id_fk'])) || ','"/>
                <xsl:sequence select="hcmc:escapeString(map:get($mapEmbeddedContainerTypes, field[@name='narrContainer_embeddedContainerType_id_fk']))"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:result-document format="csv" href="{replace(document-uri(/), '\.xml$', '_narrContainers_test.csv')}">
            <xsl:sequence select="string-join($outputContainers, '')"/>
        </xsl:result-document>
        
        <xsl:message>Generating CSV for Relationships table ('menExs')...</xsl:message>
        <xsl:variable name="outputRelationships" as="xs:string*">
            <xsl:value-of select="'id,Type of Relationship,Character 1,Character 2,Is Reciprocal?,Narrative Container,Start Page,End Page'"/>
            <xsl:for-each select="//table_data[@name='menExs']/row">
                <xsl:sort select="xs:integer(field[@name='meneEx_startPage'])"/>
                <xsl:sequence select="'&#x0a;' || xs:string(field[@name='menEx_id']) || ','"/>
                <xsl:sequence select="hcmc:escapeString(map:get($mapMenOrExs, field[@name='menEx_menOrEx_id_fk'])) || ','"/>
                <xsl:sequence select="hcmc:escapeString(map:get($mapCharacters, field[@name='menEx_character1_id_fk'])) || ','"/>
                <xsl:sequence select="hcmc:escapeString(map:get($mapCharacters, field[@name='menEx_character2_id_fk'])) || ','"/>
                <xsl:sequence select="hcmc:escapeString(field[@name='menEx_isReciprocal_id_fk']) || ','"/>
                <xsl:sequence select="hcmc:escapeString(map:get($mapNarrContainers, field[@name='menEx_narrContainer_id_fk'])) || ','"/>
                <xsl:sequence select="hcmc:escapeString(field[@name='menEx_startPage']) || ','"/>
                <xsl:sequence select="hcmc:escapeString(field[@name='menEx_endPage'])"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:result-document format="csv" href="{replace(document-uri(/), '\.xml$', '_relationships_test.csv')}">
            <xsl:sequence select="string-join($outputRelationships, '')"/>
        </xsl:result-document>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Function for escaping things (mostly double quotes).</xd:desc>
        <xd:param name="strIn" as="xs:string">The string content from the db column to be escaped.</xd:param>
        <xd:return>The escaped string.</xd:return>
    </xd:doc>
    <xsl:function name="hcmc:escapeString" as="xs:string">
        <xsl:param name="strIn" as="xs:string"/>
        <xsl:sequence select="concat($dQuote, replace($strIn, $dQuote, $ddQuote), $dQuote)"/>
    </xsl:function>
    
</xsl:stylesheet>