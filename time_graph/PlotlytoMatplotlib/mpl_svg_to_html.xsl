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
                        }
                    }
                    h4{
                        margin: 0.25em;
                    }
                </style>
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
                    <div class="legends">
                        <xsl:apply-templates select="//g[matches(@id, '^legend_\d+$')]" mode="legends"/>
                    </div>
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
        <div class="legend">
            <!-- The caption is the first descendant text element. -->
            <h4><xsl:value-of select="descendant::text[1]"/></h4>
            <ul>
                <xsl:apply-templates select="child::g[starts-with(@id, 'line2d_')]" mode="#current"/>
            </ul>
        </div>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>For each line (and its following-sibling text element) we generate a list item.</xd:desc>
    </xd:doc>
    <xsl:template match="g[starts-with(@id, 'line2d_')]" mode="legends">
        <li>...</li>
    </xsl:template>
    
</xsl:stylesheet>