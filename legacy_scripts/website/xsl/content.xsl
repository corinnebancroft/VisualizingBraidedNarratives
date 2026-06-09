<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:hcmc="http://hcmc.uvic.ca/ns" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:svg="http://www.w3.org/2000/svg"
    exclude-result-prefixes="#all" 
    xmlns="http://www.w3.org/1999/xhtml" 
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="3.0">

    <xsl:output method="xhtml" html-version="5.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:param name="basedir" as="xs:string" />
    <xsl:param name="iso8601" as="xs:string" />
    <xsl:param name="builddate" as="xs:string" />
    <xsl:param name="svnRevNo" as="xs:string" />

    <xsl:variable name="nowDate" as="xs:string" select="format-date(current-date(), '[D1o] [MNn] [Y0001]')" />

    <xd:doc>
        <xd:desc>Normalize space in text nodes</xd:desc>
    </xd:doc>
    <xsl:template match="text()">
        <xsl:value-of select="replace(., '\s+', ' ')" />
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Main transformation</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="currId" select="./article/@id" />
        <xsl:variable name="currClass" select="./article/@class" />
        <xsl:variable name="citeTitle" select="./article/@title" />
        
        <xsl:variable name="pageTitle">
            <xsl:choose>
                <xsl:when test="$currId eq 'map'">
                    <xsl:text>map</xsl:text>
                </xsl:when>
                <xsl:when test="exists(//h1[@class='page-title'])">
                    <xsl:value-of select="//h1[@class='page-title']/text()" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Home</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>


        <xsl:variable name="citation">
            <xsl:value-of select="concat('Bancroft, Corinne, ed. “',$citeTitle,'” Visualizing Braided Narratives. University of Victoria, ',$nowDate,', https://hcmc.uvic.ca/project/braidednarratives/',$currId,'.html.')" />
        </xsl:variable>

        <xsl:result-document href="{concat($basedir,'/site/',$currId,'.html')}">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="en" id="{$currId}">
            <xsl:call-template name="htmlHead">
                <xsl:with-param name="pageId" tunnel="yes"><xsl:value-of select="$currId" /></xsl:with-param>
                <xsl:with-param name="pageTitle" tunnel="yes"><xsl:value-of select="$pageTitle" /></xsl:with-param>
                <xsl:with-param name="currClass" tunnel="yes"><xsl:value-of select="$currClass" /></xsl:with-param>
            </xsl:call-template>

            <body id="top">
                <header data-state="closed" id="site-header" class="open">
                    <a href="#content" class="skip-link">Skip to content</a>
                    <div id="mobile-nav-banner" data-state="closed">
                        <a href="index.html">
                            <img width="52" height="40" class="site-logo-mobile" src="images/site-logo-top-colour.webp" alt="Site logo" />
                        </a>
                        <button id="hamburger-nav" class="mobile-nav-toggle" aria-label="Open and close mobile navigation menu" aria-expanded="false" aria-controls="site-navigation">
                            <span aria-hidden="true" class="line-container">
                                <span class="bar-top"></span>
                                <span class="bar-bottom"></span>
                            </span>
                        </button>

                    </div>
                    <div class="nav-wrapper">

                        <nav class="main-menu" id="site-navigation" aria-expanded="true">

                            <ul class="clicky-menu no-js" role="menu">
                                <li><a role="menuitem" href="index.html">Home</a></li>
                                <li><a role="menuitem" href="structure.html">Formal structure</a></li>
                                <li><a role="menuitem" href="networks.html">Character networks</a></li>
                                <li><a role="menuitem" href="graphs.html">Time graphs</a></li>
                                <li><a role="menuitem" href="methods.html">Methods</a></li>
                                <li><a role="menuitem" href="about.html">About</a></li>
                            </ul>

                        </nav>

                        <a href="index.html">
                            <img width="52" height="40" class="site-logo" src="images/site-logo-top-colour.webp" alt="Site logo" />
                        </a>

                    </div>
                </header>

                <!-- Insert content from source file -->
                <xsl:choose>
                    <xsl:when test="$currClass eq 'time-graph'">
                        <xsl:apply-templates select="./article/main | ./article/section | ./article/dialog" mode="injectCards">
                            <xsl:with-param name="currId" select="$currId"/>
                        </xsl:apply-templates>
                    </xsl:when>
                    
                    <xsl:otherwise>                        
                        <xsl:apply-templates select="./article/main" mode="injectCards">
                            <xsl:with-param name="currId" select="$currId"/>
                        </xsl:apply-templates>
                    </xsl:otherwise>
                </xsl:choose>

                <a class="scroll-to-top" aria-hidden="false" href="#top">
                    <svg xmlns="http://www.w3.org/2000/svg" class="up-caret" aria-hidden="true" width="12" height="7" viewBox="0 0 12 7">
                        <polyline fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" points="0 5 5 0 9.999 5" transform="translate(1 1)" />
                        <polyline stroke-linejoin="miter" points="4,28 20,12 36,28" />
                    </svg>
                    <span>Back<br /> to Top</span>
                </a>

                <!-- Insert footer -->
                <xsl:call-template name="htmlFoot">
                    <xsl:with-param name="pageId" tunnel="yes"><xsl:value-of select="$currId" /></xsl:with-param>
                    <xsl:with-param name="currClass" tunnel="yes"><xsl:value-of select="$currClass" /></xsl:with-param>
                    <xsl:with-param name="citation" tunnel="yes"><xsl:value-of select="$citation" /></xsl:with-param>
                </xsl:call-template>

            </body>

            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Generate cards for graphs.html</xd:desc>
        <xd:param name="currId">XMLID of the time graph</xd:param>
    </xd:doc>
    <xsl:template match="div[contains(concat(' ', normalize-space(@class), ' '), ' cards ')]" mode="injectCards">
        <xsl:param name="currId"/>
        
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()" mode="injectCards">
                <xsl:with-param name="currId" select="$currId"/>
            </xsl:apply-templates>
            
            <xsl:if test="$currId = 'graphs'">
                <ul>
                    <xsl:for-each select="collection('../content?select=*-tg.xml;recurse=no')">
                        <xsl:variable name="id" select="./article/@id"/>
                        <xsl:variable name="title" select="./article/@title"/>
                        
                        <li class="card">
                            <div class="text">
                                <h2><a href="{$id}.html"><xsl:value-of select="$title"/></a></h2>
                                <p>Time Graph</p>
                            </div>
                            <div class="img">
                                <img src="images/{$id}.png"/>
                            </div>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
    
           
    <xd:doc>
        <xd:desc>Generic fallback transformation</xd:desc>
        <xd:param name="currId">XMLID of the time graph</xd:param>
    </xd:doc>
    <xsl:template match="node()|@*" mode="injectCards">
        <xsl:param name="currId"/>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="injectCards">
                <xsl:with-param name="currId" select="$currId"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc scope="template">
        <xd:p>Create a head element for pages</xd:p>
        <xd:param name="pageId" />
        <xd:param name="pageTitle" />
        <xd:param name="currClass" />
    </xd:doc>
    <xsl:template name="htmlHead">
        <xsl:param name="pageId" tunnel="yes" />
        <xsl:param name="pageTitle" tunnel="yes" />
        <xsl:param name="currClass" tunnel="yes" />

        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title><xsl:value-of select="concat('Braided Narratives: ',$pageTitle)" /></title>

            <link rel="icon" href="favicon.ico" sizes="48x48" />
            <link rel="icon" href="favicon.svg" sizes="any" type="image/svg+xml" />
            <link rel="mask-icon" href="mask-icon.svg" color="#ffffff" />
            <link rel="manifest" href="site.webmanifest" />

            <link rel="stylesheet" href="css/braidednarratives.css" />
            
            <xsl:choose>
                <xsl:when test="$currClass eq 'svg-viz'">
                    <script src="js/svg-pan-zoom.min.js"></script>
                </xsl:when>
                <xsl:when test="$currClass eq 'time-graph'">
                    <link rel="stylesheet" href="css/time_graph.css" />
                    <xsl:text>&#10;</xsl:text>
                    <script src="js/time_graph.js"></script>
                    <xsl:text>&#10;</xsl:text>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
            
            <script src="js/pux.js"></script>
            <xsl:text>&#10;</xsl:text>
        </head>
    </xsl:template>
        
    <xd:doc scope="template">
        <xd:p>Mangle time graph html to produce data files in ./content</xd:p>
    </xd:doc>
    <xsl:template name="time-graphs">
        <xsl:for-each select="collection('../../time_graph2?select=*.html;recurse=no')">
            <xsl:variable name="base"
                select="replace(tokenize(document-uri(.), '/')[last()], '\.[^.]+$', '')"/>
            
            <!-- get body attributes -->
            <xsl:variable name="body-id" select="string(.//body/@id)"/>
            <xsl:variable name="body-title" select="string(.//body/@title)"/>
            
            <!-- Generate the content files for the main build -->
            <xsl:result-document href="content/{$base}.xml" method="xhtml" indent="yes">
                <article xmlns="http://www.w3.org/1999/xhtml"
                    id="{$body-id}"
                    title="{$body-title}"
                    class="time-graph">
                    <xsl:copy-of select=".//main"/>
                    <xsl:copy-of select=".//section[contains(@class,'appendix')]"/>
                    <xsl:copy-of select=".//dialog[@id='dlgEvents']"/>
                </article>
            </xsl:result-document>
            
            <!-- Extract SVG node as separate files -->
            <xsl:for-each select=".//svg:svg" xmlns:svg="http://www.w3.org/2000/svg">
                <xsl:result-document href="temp/{$base}.svg" method="xml" indent="yes">
                    <xsl:copy-of select="."/>
                </xsl:result-document>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc scope="template">
        <xd:p>Basic footer contains build info.</xd:p>
        <xd:param name="pageId" />
        <xd:param name="currClass" />
        <xd:param name="citation" />
    </xd:doc>
    <xsl:template name="htmlFoot">
        <xsl:param name="pageId" tunnel="yes" />
        <xsl:param name="currClass" tunnel="yes" />
        <xsl:param name="citation" tunnel="yes" />

        <xsl:if test="$currClass eq 'svg-viz'">
            <script src="js/narratives.js"></script>&#10;
        </xsl:if>

        <footer>
            <div class="site-specific-footer">
                <img class="site-footer-logo" src="images/footer-logo-colour.webp" width="52" height="40" alt="Visualizing Braided Narratives site logo" />
            </div>

            <div class="footer-info">
                <div class="copyright">
                    Edited by <a href="https://www.uvic.ca/humanities/english/people/regularfaculty/bancroft-corinne.php">© 2025 Corinne Bancroft</a>
                   
                </div>
                <div class="comments">
                    <a href="mailto:corinnebancroft@uvic.ca">Comments and suggestions</a>
                </div>
            </div>
            <div class="citation">Cite this page:
                <span id="citeThisPage">
                    <xsl:value-of select="$citation" />
                </span>
            </div>
            <div class="logos">
                <a class="uvic-logo-internal" href="https://hcmc.uvic.ca">
                    <img width="195" height="35" src="images/logo-uvic-hcmc-research.svg" alt="University of Victoria: Humanities Computing and Media Centre" />
                </a>
            </div>
            
            <div id="buildInfo">
                <p>Build date: <time datetime="{$iso8601}"><xsl:value-of select="$builddate" /> (SVN revision <xsl:value-of select="$svnRevNo" />)</time></p>
            </div>
        </footer>
    </xsl:template>

</xsl:stylesheet>