<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:teidocx="http://www.tei-c.org/ns/teidocx/1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="tei html teidocx xs"
   version="2.0">

   <xsl:import href="../sistory/html5-foundation6/to.xsl"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
      <desc>
         <p>TEI stylesheet for making HTML5 output (Zurb Foundation 6 http://foundation.zurb.com/sites/docs/).</p>
         <p>This software is dual-licensed:
            
            1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
            Unported License http://creativecommons.org/licenses/by-sa/3.0/ 
            
            2. http://www.opensource.org/licenses/BSD-2-Clause
            
            
            
            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions are
            met:
            
            * Redistributions of source code must retain the above copyright
            notice, this list of conditions and the following disclaimer.
            
            * Redistributions in binary form must reproduce the above copyright
            notice, this list of conditions and the following disclaimer in the
            documentation and/or other materials provided with the distribution.
            
            This software is provided by the copyright holders and contributors
            "as is" and any express or implied warranties, including, but not
            limited to, the implied warranties of merchantability and fitness for
            a particular purpose are disclaimed. In no event shall the copyright
            holder or contributors be liable for any direct, indirect, incidental,
            special, exemplary, or consequential damages (including, but not
            limited to, procurement of substitute goods or services; loss of use,
            data, or profits; or business interruption) however caused and on any
            theory of liability, whether in contract, strict liability, or tort
            (including negligence or otherwise) arising in any way out of the use
            of this software, even if advised of the possibility of such damage.
         </p>
         <p>Andrej Pančur, Institute for Contemporary History</p>
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>
  
   <!-- Uredi parametre v skladu z dodatnimi zahtevami za pretvorbo te publikacije: -->
   <!-- https://www2.sistory.si/publikacije/ -->
   <!-- ../../../  -->
   <xsl:param name="path-general">https://www2.sistory.si/publikacije/</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/to.xsl -->
   <xsl:param name="outputDir">docs/</xsl:param>
   
   <xsl:param name="splitLevel">1</xsl:param>
   
   <xsl:param name="homeLabel">Domov</xsl:param>
   <xsl:param name="homeURL">#</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/my-html_param.xsl -->
   <xsl:param name="title-bar-sticky">false</xsl:param>
   
   <xsl:param name="chapterAsSIstoryPublications">false</xsl:param>
   
   <!-- V html/head izpisani metapodatki -->
   <xsl:param name="description">Odlivanje smrti</xsl:param>
   <xsl:param name="keywords">Posmrtne maske, zbornik, Zgodovina Slovenije - portal SIstory, avtorsko pravo, digitalni pristopi, digitalizacija</xsl:param>
   <xsl:param name="title">Odlivanje smrti</xsl:param>
   
   <xsl:param name="numberBackHeadings"></xsl:param>
   <xsl:param name="numberFigures">false</xsl:param>
   <xsl:param name="numberFrontTables">false</xsl:param>
   <xsl:param name="numberHeadings">true</xsl:param>
   <xsl:param name="numberParagraphs">true</xsl:param>
   <xsl:param name="numberTables">false</xsl:param>
   <xsl:param name="postQuote"></xsl:param>
   <xsl:param name="preQuote"></xsl:param>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>izpis spremnih študij, glede na število back/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-study-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>O avtorjih</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za glavno (body) vsebino</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-body-head">
      <xsl:param name="thisLanguage"></xsl:param>
      <xsl:text>Poglavja</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za front front/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-front-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">Foreword</xsl:when>
         <xsl:otherwise>Predgovor</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>izpis spremnih študij, glede na število back/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-summary-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Summary</xsl:text>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc> NASLOVNA STRAN </xsldoc:desc>
   </xsldoc:doc>
   <xsl:template match="tei:titlePage">
      <!-- avtor -->
      <!--<p  class="naslovnicaAvtor">
         <xsl:for-each select="tei:docAuthor">
            <xsl:choose>
               <xsl:when test="tei:forename or tei:surname">
                  <xsl:for-each select="tei:forename">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="tei:surname">
                     <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:for-each select="tei:surname">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position() ne last()">
               <br/>
            </xsl:if>
         </xsl:for-each>
      </p>
      <br/>
      <!-\- naslov: spremenjeno procesiranje naslovov -\->
      <xsl:for-each select="tei:docTitle/tei:titlePart[@xml:lang='en']">
         <h1 class="text-center"><xsl:value-of select="."/></h1>
      </xsl:for-each>
      <hr/>
      <xsl:for-each select="tei:docTitle/tei:titlePart[@xml:lang='sl']">
         <h1 class="text-center"><xsl:value-of select="."/></h1>
      </xsl:for-each>
      <br/>
      <xsl:if test="tei:figure">
         <div class="text-center">
            <p>
               <img src="{tei:figure/tei:graphic/@url}" alt="naslovna slika"/>
            </p>
         </div>
      </xsl:if>-->
      <xsl:if test="tei:graphic">
         <div class="text-center">
            <p>
               <img src="{tei:graphic/@url}" alt="naslovna slika" style="max-height: 800px;"/>
            </p>
         </div>
      </xsl:if>
      <!--<br/>
      <p class="text-center">
         <!-\- založnik -\->
         <xsl:for-each select="tei:docImprint/tei:publisher">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
         <!-\- kraj izdaje -\->
         <xsl:for-each select="tei:docImprint/tei:pubPlace">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
         <!-\- leto izdaje -\->
         <xsl:for-each select="tei:docImprint/tei:docDate">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
      </p>-->
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Dodatno za kolofon: procesiranje idno</desc>
   </doc>
   <xsl:template match="tei:publicationStmt" mode="kolofon">
      <xsl:apply-templates select="tei:publisher" mode="kolofon"/>
      <xsl:apply-templates select="tei:date" mode="kolofon"/>
      <xsl:apply-templates select="tei:pubPlace" mode="kolofon"/>
      <xsl:apply-templates select="tei:availability" mode="kolofon"/>
      <xsl:apply-templates select="tei:idno" mode="kolofon"/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:idno" mode="kolofon">
      <p>
         <xsl:choose>
            <xsl:when test="matches(.,'https?://')">
               <a href="{.}">
                  <xsl:value-of select="."/>
               </a>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="concat(@type,' ',.)"/>
            </xsl:otherwise>
         </xsl:choose>
      </p>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>orgName v respStmt</desc>
   </doc>
   <xsl:template match="tei:respStmt" mode="kolofon">
      <xsl:apply-templates select="tei:resp" mode="kolofon"/>
   </xsl:template>
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc></desc>
   </doc>
   <xsl:template match="tei:resp" mode="kolofon">
      <p>
         <em>
            <xsl:value-of select="concat(.,':')"/>
         </em>
         <br />
         <xsl:for-each select="following-sibling::tei:name">
            <span itemprop="contributor">
               <xsl:apply-templates/>
            </span>
            <br />
         </xsl:for-each>
         <xsl:for-each select="following-sibling::tei:orgName">
            <span itemprop="contributor">
               <xsl:apply-templates/>
            </span>
            <br />
         </xsl:for-each>
      </p>
   </xsl:template>
   
</xsl:stylesheet>
