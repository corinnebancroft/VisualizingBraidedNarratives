<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://www.w3.org/2000/svg"
    xmlns:svg="http://www.w3.org/2000/svg"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xh="http://www.w3.org/1999/xhtml"
    xmlns:hcmc="http://hcmc.uvic.ca/ns"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 19, 2025</xd:p>
            <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
            <xd:p>This module is designed to post-process an SVG image created with 
            Python's Mathplotlib to wrap it in HTML, and inject some interactivity 
            and controls.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Output is XHTML.</xd:desc>
    </xd:doc>
    <xsl:output method="xhtml" encoding="UTF-8" normalization-form="NFC" html-version="5"
                omit-xml-declaration="yes" include-content-type="no"/>
    
    <xd:doc>
        <xd:desc>This is basically an identity tranform, although we output a document
        in a different namespace from the input root.</xd:desc>
    </xd:doc>
    <xsl:mode name="initial" on-no-match="shallow-copy"/>
    <xsl:mode name="legends" on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:value-of select="//g[@id='graphTitle']"/></title>
                <style>
                    @namespace svg url("http://www.w3.org/2000/svg")
                    
                    div.graph{
                        width: 100%;
                        margin: 1rem auto 1rem auto;
                    }
                    div.graph svg|svg{
                        width: 90vw;
                        height: auto;
                        transform-origin: top left;
                        tranform: scale(1.25);
                    }
                    div.legends{
                        display: flex;
                        flex-direction: row;
                        flex-wrap: wrap;
                        gap: 1em;
                        justify-content: center;
                        div.legend{
                            border: solid 1pt gray;
                            padding: 0.25em;
                            ul{
                                list-style-type: none;
                                padding: 0.25em;
                            }
                        }
                    }
                    h4{
                        margin: 0.25em;
                    }
                </style>
                <script src="time_graph.js"></script>
            </head>
            <body>
                <main>
                    <!--<xsl:comment>SVG loaded as an image, minus legends.</xsl:comment>
                    <img src="{tokenize(base-uri(/), '/')[last()]}" alt="{xs:string(//g[@id='graphTitle'])}"/>-->
                    <xsl:comment>SVG embedded directly, with some modifications.</xsl:comment>
                    <div class="graph">
                        <xsl:apply-templates mode="initial"/>
                    </div>
                    <xsl:comment>Re-creation of legends in HTML.</xsl:comment>
                    <form>
                        <div class="legends">
                            <xsl:apply-templates select="//g[matches(@id, '^legend_\d+$')]" mode="legends"/>
                            <div class="legend">
                                <h4>Other Controls</h4>
                                <ul>
                                    <li><input type="checkbox" data-id="tellline" data-regex="^tellline" checked="checked"/> Telling time</li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </main>
            </body>
        </html>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>In processing the svg, we remove the legends.</xd:desc>
    </xd:doc>
    <xsl:template match="g[matches(@id, '^legend_\d+$')]" mode="initial"/>
        
    <xd:doc>
        <xd:desc>In generating the HTML controls, we start from the.</xd:desc>
    </xd:doc>
    <xsl:template match="g[matches(@id, '^legend_\d+$')]" mode="legends">
        <xsl:variable name="idPrefix" as="xs:string" select="if (contains(descendant::text[1], 'arrator')) then 'narr' else 'char'"/>
        <div class="legend">
            <!-- The caption is the first descendant text element. -->
            <h4><xsl:value-of select="descendant::text[1]"/></h4>
            <ul>
                <xsl:apply-templates select="child::g[starts-with(@id, 'line2d_')]" mode="#current">
                    <xsl:with-param tunnel="yes" name="idPrefix" as="xs:string" select="$idPrefix"/>
                </xsl:apply-templates>
            </ul>
        </div>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>For each line (and its following-sibling text element) we generate a list item.</xd:desc>
        <xd:param name="idPrefix" as="xs:string">A tunnelled parameter which identifies what type
        of role the entity has -- narr = narrator, char = character.</xd:param>
    </xd:doc>
    <xsl:template match="g[starts-with(@id, 'line2d_')]" mode="legends">
        <xsl:param name="idPrefix" as="xs:string" tunnel="yes"/>
        <xsl:variable name="style" as="xs:string" select="replace(child::g[child::use][1]/use/@style, '^.*fill:\s*(#[a-h0-9]+).*$', 'background-color: $1; accent-color: $1;')"/>
        <xsl:variable name="persName" as="xs:string" select="xs:string(following-sibling::g[child::text][1])"/>
        <li><span style="{if (contains($style, 'color')) then $style else 'background-color: #000000; accent-color: #000000;'}"><input data-id="{$idPrefix}_{hcmc:nameToIdBit($persName)}" 
                    data-regex="{hcmc:nameToIdRegex($persName, $idPrefix)}"
                    type="checkbox" checked="checked"/></span> <xsl:value-of select="$persName"/></li>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>This function converts a name to something that can function as part of an id.
        This matches the process used in the Python file when generating the SVG.</xd:desc>
        <xd:param name="name" as="xs:string">The incoming name, which might have spaces or punctuation.</xd:param>
    </xd:doc>
    <xsl:function name="hcmc:nameToIdBit" as="xs:string">
        <xsl:param name="name" as="xs:string"/>
        <xsl:sequence select="replace(normalize-space($name), '[^a-zA-Z0-9]+', '_')"/>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>This function converts a name to a regex that will match the ids of associated svg elements in 
            the graph.</xd:desc>
        <xd:param name="name" as="xs:string">The incoming name, which might have spaces or punctuation.</xd:param>
        <xd:param name="prefix" as="xs:string">The prefix to prepend.</xd:param>
    </xd:doc>
    <xsl:function name="hcmc:nameToIdRegex" as="xs:string">
        <xsl:param name="name" as="xs:string"/>
        <xsl:param name="prefix" as="xs:string"/>
        <xsl:sequence select="$prefix || '(line|mark)?_\d+_' || replace(normalize-space($name), '[^a-zA-Z0-9]+', '_')"/>
    </xsl:function>
    
</xsl:stylesheet>