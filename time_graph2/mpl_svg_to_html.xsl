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
    xmlns:js="http://www.w3.org/2005/xpath-functions"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 19, 2025</xd:p>
            <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
            <xd:p>This module is designed to post-process an SVG image created with 
            Python's Mathplotlib to wrap it in HTML, and inject some interactivity 
            and controls.</xd:p>
        </xd:desc>
        <xd:param name="jsonFile" as="xs:string">The path to the JSON file created from the 
        original CSV for the novel, from which we retrieve the Evidence column data to create
        popups.</xd:param>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Output is XHTML.</xd:desc>
    </xd:doc>
    <xsl:output method="xhtml" encoding="UTF-8" normalization-form="NFC" html-version="5"
                omit-xml-declaration="yes" include-content-type="no"/>
    
    <xd:doc>
        <xd:desc>We need to know where to find the JSON created from the CSV file to get the Evidence row data.</xd:desc>
    </xd:doc>
    <xsl:param name="jsonFile" as="xs:string" select="'PoDTimeGraphApril2.json'"/>
    
    <xd:doc>
        <xd:desc>This is the JSON data extracted from the file.</xd:desc>
    </xd:doc>
    <xsl:variable name="jsonData" as="document-node()" select="json-to-xml(unparsed-text($jsonFile))"/>
    
    <xd:doc>
        <xd:desc>This title for the graph should be passed in as a parameter,
        but in its absence we use what's in the SVG.</xd:desc>
    </xd:doc>
    <xsl:param name="graphTitle" as="xs:string" select="substring-before(//g[@id='graphTitle'], '.')"/>
    
    <xd:doc>
        <xd:desc>This id for the HTML page should be passed in.</xd:desc>
    </xd:doc>
    <xsl:param name="graphId" as="xs:string" select="lower-case(substring-before(hcmc:nameToIdBit(//g[@id='graphTitle']), '.') || '-tg')"/>
    
    <xd:doc>
        <xd:desc>This is basically an identity tranform, although we output a document
        in a different namespace from the input root.</xd:desc>
    </xd:doc>
    <xsl:mode name="initial" on-no-match="shallow-copy"/>
    <xsl:mode name="legends" on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <!-- Temporary hack. -->
        <!--<xsl:result-document method="xml" indent="yes" href="temp.xml">
            <xsl:sequence select="$jsonData"/>
        </xsl:result-document>-->
        
        <!-- Main output. -->
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
            <head>
                <meta charset="UTF-8"/>
                <title><xsl:value-of select="$graphTitle"/></title>
                <link rel="stylesheet" href="time_graph.css"/>
                <script src="time_graph.js"></script>
            </head>
            <body id="{$graphId}">
                <main>
  <section class="figure">
      <h3 class="figure-title"><xsl:value-of select="$graphTitle"/></h3>
      <!-- Controls (Zoom+, Zoom−, Reset) -->

    <!-- SVG embedded directly, with some modifications. -->
    <div class="graph">
      <xsl:apply-templates mode="initial"/>
    </div>

    <!-- Re-creation of legends in HTML. -->
    <form class="legend-form">
      <div class="legends">
        <xsl:apply-templates select="//g[matches(@id, '^legend_\d+$')]" mode="legends"/>
        <div class="legend">
          <h4>Lines <input type="checkbox" class="group" checked="checked"/></h4>
          <ul>
            <li><input type="checkbox" data-id="tellline"  data-regex="^tellline"    checked="checked"/> Telling time lines</li>
            <li><input type="checkbox" data-id="tellline2" data-regex="^tellline_2"  checked="checked"/> Telling time guidelines</li>
            <li><input type="checkbox" data-id="guidelines" data-regex="^narr_guidelines_" checked="checked"/> Line graph guidelines</li>
          </ul>
        </div>
          <!-- Zoom controls as a legend card -->
      <div class="legend legend-zoom">
        <h4>Zoom</h4>
        <div class="toolbar" role="group" aria-label="Zoom controls">
          <button type="button" class="zoom-in">Zoom +</button>
          <button type="button" class="zoom-out">Zoom −</button>
          <button type="button" class="reset">Reset</button>
        </div>
      </div>
      </div>
    </form>
  </section>
</main>
                <section class="appendix">
                    <ul>
                        <xsl:for-each select="$jsonData//js:map[@key='Event Name']/js:string">
                            <xsl:variable name="key" as="xs:string" select="@key"/>
                            <li id="event_{$key}">
                                <h5> <strong>Event: </strong> <xsl:sequence select="text()"/> </h5>
                                <!-- Date: Start Date (or Start Date - End Date), formatted -->
                                <xsl:variable name="startRaw"
                                select="$jsonData//js:map[@key='Start Date']/(js:string|js:number)[@key=$key]/text()"/>
                                <xsl:variable name="endRaw"
                                select="$jsonData//js:map[@key='End Date']  /(js:string|js:number)[@key=$key]/text()"/>

                                <xsl:variable name="startFmt" select="format-date(xs:date($startRaw), '[MNn] [D], [Y]')"/>
                                <xsl:variable name="endFmt"   select="format-date(xs:date($endRaw),   '[MNn] [D], [Y]')"/>

                                <p class="attributes">
                                <strong>Date: </strong>
                                    <!-- Is Approximate? flag from CSV (T/F, True/False, etc.) -->
                                <xsl:variable name="approxRaw"
                                select="$jsonData//js:map[@key='Is Approximate?']/(js:string|js:number|js:boolean)[@key=$key]/text()"/>
                                <xsl:variable name="isApprox" as="xs:boolean"
                                select="lower-case(normalize-space($approxRaw)) = ('t','true','1','yes','y')"/>
                                    <xsl:if test="$isApprox"><xsl:text>Approximately, </xsl:text></xsl:if>
                                <xsl:choose>
                                <xsl:when test="normalize-space($startRaw) = normalize-space($endRaw)">
                                <xsl:value-of select="$startFmt"/>
                                </xsl:when>
                                <xsl:otherwise>
                                <xsl:value-of select="$startFmt"/>
                                <xsl:text> - </xsl:text>
                                <xsl:value-of select="$endFmt"/>
                                </xsl:otherwise>
                                </xsl:choose>
                                </p>
                                <p class="attributes">
                                <strong>Narrator: </strong>
                                <xsl:sequence select="$jsonData//js:map[@key='Narrator']/js:string[@key=$key]/text()"/>
                                </p>
                                <!-- Participating Characters -->
                                <p class="attributes">
                                <strong>Participating Characters: </strong>
                                <xsl:sequence select="$jsonData//js:map[@key='Participating Characters']/js:string[@key=$key]/text()"/>
                                </p>
                                <!-- Telling Time: Start Date TT (or Start Date TT - End Date TT), formatted -->
                                <xsl:variable name="startTTRaw"
                                              select="$jsonData//js:map[@key='Start Date TT']/(js:string|js:number)[@key=$key]/text()"/>
                                <xsl:variable name="endTTRaw"
                                              select="$jsonData//js:map[@key='End Date TT']/(js:string|js:number)[@key=$key]/text()"/>

                                <!-- Only continue if there is a value -->
                                <xsl:if test="normalize-space($startTTRaw) != ''">

                                <xsl:variable name="startTTFmt"
                                    select="format-date(xs:date($startTTRaw), '[MNn] [D], [Y]')"/>
                                <xsl:variable name="endTTFmt"
                                select="format-date(xs:date($endTTRaw),   '[MNn] [D], [Y]')"/>

                                <p class="attributes">
                                <strong>Telling Time: </strong>

                                <!-- Is Approximate TT? -->
                                <xsl:variable name="approxTTRaw"
                                select="$jsonData//js:map[@key='Is Approximate TT?']/(js:string|js:number|js:boolean)[@key=$key]/text()"/>
                                <xsl:variable name="isTTApprox" as="xs:boolean"
                                select="lower-case(normalize-space($approxTTRaw)) = ('t','true','1','yes','y')"/>
                                <xsl:if test="$isTTApprox"><xsl:text>Approximately, </xsl:text></xsl:if>

                                <xsl:choose>
                                <xsl:when test="normalize-space($startTTRaw) = normalize-space($endTTRaw)">
                                <xsl:value-of select="$startTTFmt"/>
                                </xsl:when>
                                <xsl:otherwise>
                                <xsl:value-of select="$startTTFmt"/>
                                <xsl:text> - </xsl:text>
                                <xsl:value-of select="$endTTFmt"/>
                                </xsl:otherwise>
                                </xsl:choose>
                                </p>
                                </xsl:if>

                                <p class="attributes">
                                <strong>Evidence: </strong>
                                <xsl:sequence select="$jsonData//js:map[@key='Evidence']/js:string[@key=$key]/text()"/>
                                </p>
                                <!-- Page Number: Start Page (or Start Page - End Page) -->
<xsl:variable name="startPageRaw"
    select="$jsonData//js:map[@key='Start Page']/(js:string|js:number)[@key=$key]/text()"/>
<xsl:variable name="endPageRaw"
    select="$jsonData//js:map[@key='End Page']/(js:string|js:number)[@key=$key]/text()"/>

<!-- Only output if there is at least a start page -->
<xsl:if test="normalize-space($startPageRaw) != ''">
    <p class="attributes">
        <strong>Page Number: </strong>
        <xsl:choose>
            <xsl:when test="normalize-space($startPageRaw) = normalize-space($endPageRaw)
                            or normalize-space($endPageRaw) = ''">
                <xsl:value-of select="$startPageRaw"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$startPageRaw"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="$endPageRaw"/>
            </xsl:otherwise>
        </xsl:choose>
    </p>
</xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </section>
                <!-- Hidden appendix for Telling Time pop‑ups (one block per ROW / line) -->
<section class="appendix tellingtime" hidden="hidden" aria-hidden="true">

  <!-- Iterate over every row via the JSON 'Narrator' column -->
  <xsl:for-each select="$jsonData//js:map[@key='Narrator']/js:string">
    <xsl:variable name="key"   as="xs:string" select="@key"/>              <!-- row index -->
    <xsl:variable name="narr"  as="xs:string" select="normalize-space(.)"/>         <!-- Narrator (human-readable) -->
    <xsl:variable name="narrId" as="xs:string" select="hcmc:nameToIdBit($narr)"/>   <!-- Narrator id fragment -->

    <!-- Pull required TT fields for this row -->
    <xsl:variable name="startTTRaw"
      select="$jsonData//js:map[@key='Start Date TT']/(js:string|js:number)[@key=$key]/text()"/>
    <xsl:variable name="endTTRaw"
      select="$jsonData//js:map[@key='End Date TT']  /(js:string|js:number)[@key=$key]/text()"/>

    <!-- TT pages (match Python guard: require all four TT fields to exist) -->
    <xsl:variable name="startPgTTRaw"
      select="$jsonData//js:map[@key='Start Page TT']/(js:string|js:number)[@key=$key]/text()"/>
    <xsl:variable name="endPgTTRaw"
      select="$jsonData//js:map[@key='End Page TT']  /(js:string|js:number)[@key=$key]/text()"/>

    <!-- Only make a block for rows that could produce a telling-time line in Python -->
    <xsl:if test="
      normalize-space($startTTRaw)  != '' and
      normalize-space($endTTRaw)    != '' and
      normalize-space($startPgTTRaw)!= '' and
      normalize-space($endPgTTRaw)  != ''">

      <!-- Cast/format dates (same format as your event pop-ups) -->
      <xsl:variable name="startTTFmt" select="format-date(xs:date($startTTRaw), '[MNn] [D], [Y]')"/>
      <xsl:variable name="endTTFmt"   select="format-date(xs:date($endTTRaw),   '[MNn] [D], [Y]')"/>

      <!-- Approx TT? -->
      <xsl:variable name="approxTTRaw"
        select="$jsonData//js:map[@key='Is Approximate TT?']/(js:string|js:number|js:boolean)[@key=$key]/text()"/>
      <xsl:variable name="isTTApprox" as="xs:boolean"
        select="lower-case(normalize-space($approxTTRaw)) = ('t','true','1','yes','y')"/>

      <!-- One block per row; id must include both narratorId and row index -->
      <div class="telltime-block" id="{ 'telltime_' || $narrId || '_' || $key }">
  <h5>
  <xsl:value-of select="$narr"/><xsl:text>’s Telling Time</xsl:text>
  <xsl:text>: </xsl:text>
  <span class="tt-dates" style="font-weight: normal;">
    <xsl:if test="$isTTApprox">
      <xsl:text>Approximately, </xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="normalize-space($startTTRaw) = normalize-space($endTTRaw)">
        <xsl:value-of select="$startTTFmt"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$startTTFmt"/>
        <xsl:text> - </xsl:text>
        <xsl:value-of select="$endTTFmt"/>
      </xsl:otherwise>
    </xsl:choose>
  </span>
</h5>

</div>

    </xsl:if>
  </xsl:for-each>
</section>
                <div id="dlgEvents" class="popup-window"></div>
                <div id="dlgTellTime" class="popup-window"></div>
            </body>
        </html>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Since we'll be removing the legends, we need to calculate and reset the 
        image width and the viewbox width. We'll do this by finding the width of the main axes,
        then adding a small factor to it to give us a little padding; then we'll fix the 
        existing numbers.</xd:desc>
    </xd:doc>
    <xsl:template match="svg" mode="initial">
        <xsl:variable name="strWAxisWidth" as="xs:string" select="replace(descendant::g[@id='axes_1']/g[1]/path/@d, '^[^L]+L\s*([\d\.]+)\s.+$', '$1')"/>
        <xsl:variable name="newWidth" as="xs:float" select="xs:float($strWAxisWidth) + 4"/>
        <xsl:variable name="strOldWidth" as="xs:string" select="replace(@width, '[^\.\d]+', '')"/>
        <xsl:variable name="strNewWidth" as="xs:string" select="format-number($newWidth, '#.######')"/>
        <xsl:message expand-text="yes">Converting old width of {$strOldWidth} to {$strNewWidth} based on horizontal axis width of {$strWAxisWidth}.</xsl:message>
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current">
                <xsl:with-param name="strOldWidth" as="xs:string" select="$strOldWidth" tunnel="yes"/>
                <xsl:with-param name="strNewWidth" as="xs:string" select="$strNewWidth" tunnel="yes"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>These are the attributes in which we change the width.</xd:desc>
    </xd:doc>
    <xsl:template match="svg/@width | svg/@viewBox" mode="initial">
        <xsl:param name="strOldWidth" as="xs:string" tunnel="yes"/>
        <xsl:param name="strNewWidth" as="xs:string" tunnel="yes"/>
        <xsl:attribute name="{local-name()}" select="replace(., $strOldWidth, $strNewWidth)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Suppressing DTD default attributes.</xd:desc>
    </xd:doc>
    <!--<xsl:template match="svg/@zoomAndPan | svg/@preserveAspectRatio"/>-->
    
    <xd:doc>
        <xd:desc>In processing the svg, we remove the legends.</xd:desc>
    </xd:doc>
    <xsl:template match="g[matches(@id, '^legend_\d+$')]" mode="initial"/>
    <xsl:template match="g[@id='graphTitle']" mode="initial"/>
        
    <xd:doc>
        <xd:desc>In generating the HTML controls, we start from the.</xd:desc>
    </xd:doc>
    <xsl:template match="g[matches(@id, '^legend_\d+$')]" mode="legends">
        <xsl:variable name="idPrefix" as="xs:string" select="if (contains(descendant::text[1], 'arrator')) then 'narr' else 'char'"/>
        <div class="legend">
            <!-- The caption is the first descendant text element. -->
            <h4><xsl:value-of select="descendant::text[1]"/><xsl:text> </xsl:text><input type="checkbox" checked="checked" class="group"/></h4>
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
        
        <!-- Because of a bug in the original code, a spurious character called "Midpoint Date" is generated.
             We filter that out. -->
        <xsl:if test="not(contains($persName, 'Midpoint Date'))">
            <li><span style="{if (contains($style, 'color')) then $style else 'background-color: #000000; accent-color: #000000;'}" class="chkContainer"><input data-id="{$idPrefix}_{hcmc:nameToIdBit($persName)}" 
                        data-regex="{hcmc:nameToIdRegex($persName, $idPrefix)}"
                        type="checkbox" checked="checked">
                        <xsl:if test="$idPrefix eq 'narr'">
                            <xsl:attribute name="data-telling-regex" select="'^tellline_\d+_' || hcmc:nameToIdBit($persName) || '_\d+$'"/>
                        </xsl:if>
                        <xsl:if test="$idPrefix eq 'narr'">
                        <xsl:attribute name="data-guidelines-regex"
                        select="concat('^narr_guidelines_\d+_', hcmc:nameToIdBit($persName))"/>
                        </xsl:if>
            </input></span> <xsl:value-of select="$persName"/></li>
        </xsl:if>
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
        <!--<xsl:variable name="fullPrefix" as="xs:string" select="if "-->
        <xsl:sequence select="$prefix || '(line|mark)?_\d+_' || hcmc:nameToIdBit($name)"/>
    </xsl:function>
    
</xsl:stylesheet>