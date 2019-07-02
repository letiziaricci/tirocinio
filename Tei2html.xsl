<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

      <html>
          <head>
              <!-- head -->
              <link rel="icon" href="./static/sparkles.ico" />
              <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
              <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900|Playfair+Display:400,700,900|  :300,400" rel="stylesheet"/>
              <link rel="stylesheet" href="style.css" type="text/css"/>
              <script src="jquery-3.3.1.min.js" type="text/javascript"/>
              <script src="main.js" type="text/javascript"/>
              <title>Cartoline Grande Guerra</title>
          </head>
          <body>
                  <xsl:variable name="teiid" select="tei:TEI/@xml:id"/>
                  <section id="{$teiid}" class="content_postcard">
                    <!-- titolo cartolina -->
                      <h4 class="sectionTitle">
                          <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                      </h4>
            <!--          <div class="postcardWrapper">  -->  <!-- immagini-->
                          <div class="filterbar">
                              <div class="sez1"> <!-- destra -->
                                  <a href="./static/{$teiid}/retro.jpg" target="_blank">
                                      <i class="material-icons {$teiid}">&#xe56b;</i>
                                  </a>
                                  <button class="btn-hand">Testo</button>
                                  <button class="btn-typo">Tipografia</button>
                                  <button class="btn-stmp">Timbri|Francobolli</button>
                                  <button class="btn-cata">Catalogazione</button>
                                  <button class="btn-clr">Reset</button>
                              </div>
            <!--                  <div class="sez2">
                                  <a href="./static/{$teiid}/fronte.jpg" target="_blank">
                                      <i class="material-icons {$teiid}">&#xe56b;</i>
                                  </a>
                              </div>
                              <div class="sez3">
                                  <h3>Info Francobolli, Timbri e Illutrazione</h3>
                              </div> -->
                          </div>
          <!--                <xsl:apply-templates select="tei:TEI/tei:facsimile"/> -->
          <!--            </div> -->
          <!--            <div class="postcardWrapper">  -->
                          <div class="digital">
                              <!-- immagine retro generata -->
                              <xsl:choose>
                                  <xsl:when test="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='address-destination']">
                                      <div class="page">
                                          <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:opener"/>
                                          <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='postcard-body']"/>
                                          <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:closer"/>
                                      </div>
                                      <div class="page">
                                          <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='address-destination']"/>
                                      </div>
                                  </xsl:when>
                                  <xsl:otherwise>
                                      <div style="width:100%">
                                        <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:opener"/>
                                        <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='postcard-body']"/>
                                        <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:closer"/>
                                      </div>
                                  </xsl:otherwise>
                              </xsl:choose>
                          </div>
            <!--              <div class="meta">
                              <p class="tipografia">
                                  <span class="label">N° di catalogazione: </span>
                                  <xsl:value-of select="tei:TEI/tei:text//tei:div[@type='secondamano']"/>
                              </p>
                              <xsl:if test="tei:TEI//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher | tei:author ">
                                  <p class="tipografia">
                                      <span class="label">Editore cartolina: </span>
                                      <xsl:value-of select="tei:TEI//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher | tei:author "/>
                                  </p>
                              </xsl:if>
                              <xsl:if test=".//tei:body//tei:head">
                                  <p class="tipografia">
                                      <span class="label">Titolo immagine: </span>
                                      <xsl:value-of select=".//tei:body//tei:head"/>
                                  </p>
                              </xsl:if>
                              <xsl:if test=".//tei:front//tei:s">
                                  <p class="tipografia">
                                      <span class="label">Testo tipografico sul retro:</span>
                                  </p>
                              </xsl:if>
                              <xsl:for-each select=".//tei:front//tei:s|.//tei:front//tei:ab">
                                  <p class="tipografia">
                                      >
                                      <xsl:for-each select="text()|*">
                                          <xsl:choose>
                                              <xsl:when test="self::tei:choice">
                                                  <xsl:value-of select="tei:abbr"/>
                                              </xsl:when>
                                              <xsl:when test="self::text()|self::*">
                                                  <xsl:value-of select="."/>
                                              </xsl:when>
                                              <xsl:when test="self::tei:num">
                                                  <xsl:value-of select="."/>
                                              </xsl:when>
                                          </xsl:choose>
                                      </xsl:for-each>
                                  </p>
                              </xsl:for-each>
                              <xsl:if test=".//tei:div[@type='recto']/tei:figure//tei:figDesc/tei:mentioned">
                                  <p class="tipografia">
                                      <span class="label">Testo tipografico sul fronte:</span>
                                      <xsl:value-of select=".//tei:div[@type='recto']/tei:figure//tei:figDesc/tei:mentioned"/>
                                  </p>
                              </xsl:if>
                          </div> -->
          <!--            </div> -->

                      <xsl:apply-templates select="tei:TEI"/>
                  </section>

              <footer class="footerStyle">
                  <xsl:if test="tei:TEI/tei:teiHeader">
                      <div id="publication_info" class="info_list">
                          <h3>Informazioni di pubblicazione e distribuzione:</h3>
                          <xsl:apply-templates select="tei:TEI/tei:teiHeader//tei:publicationStmt"/>
                      </div>
                      <div class="vl"></div>
                      <div id="edition_info" class="info_list">
                          <h3>Responsabili di edizione:</h3>
                          <xsl:if test="tei:TEI/tei:teiHeader//tei:editionStmt//tei:respStmt[position() > 1]">
                              <xsl:apply-templates select="tei:TEI/tei:teiHeader//tei:editionStmt//tei:respStmt" />
                          </xsl:if>
                      </div>
                      <div class="vl"></div>

                      <div id="title_info" class="info_list">
                          <h3>Responsabili di codifica:</h3>
                          <xsl:apply-templates select="tei:TEI/tei:teiHeader//tei:titleStmt/tei:respStmt"/>
                      </div>
                  </xsl:if>
              </footer>
          </body>
      </html>
  </xsl:template>

  <!-- ******  POSTMARK ****** -->
  <xsl:template match="tei:TEI/tei:teiHeader//tei:support/tei:stamp[@type='postmark']">
      <xsl:variable name="postid" select="count(preceding::tei:stamp)+1"/>
      <xsl:variable name="postclass" select="@n"/>
      <div class="tt_postmark">
          <p class="desc {$postclass}" id="postmark{$postid}">
              <xsl:value-of select="."/>
          </p>
      </div>
  </xsl:template>

  <!-- ******  POSTAGE ****** -->
  <xsl:template match="tei:TEI/tei:teiHeader//tei:support/tei:stamp[@type='postage']">
      <xsl:variable name="postageid" select="count(preceding::tei:stamp)+1"/>
      <xsl:variable name="postageclass" select="@n"/>
      <div class="tt_postage">
       <p class="desc {$postageclass}" id="postage{$postageid}">
              <xsl:value-of select="."/>
          </p>
      </div>
  </xsl:template>

  <!-- FIGDESC -->
  <xsl:template match="tei:TEI/tei:text/tei:body/tei:div[@type='fronte']/tei:figure//tei:figDesc">
      <xsl:variable name="figdescid" select="count(preceding::tei:figDesc)+1"/>
      <div class="tt_figdesc">
          <p class="desc fronte{$figdescid}">
           <span class="label">Descrizione dell'immagine:</span>
           <xsl:value-of select="."/>
          </p>
      </div>
  </xsl:template>

  <!-- ****** DIV FACSIMILIE ****** -->
  <xsl:template match="tei:TEI">
      <xsl:variable name="id" select="@xml:id"/>
      <xsl:variable name="width" select="substring-before(tei:facsimile/tei:surface/tei:graphic/@width, 'px')"/>
      <xsl:variable name="height" select="substring-before(tei:facsimile/tei:surface/tei:graphic/@height, 'px')"/>

      <div class="overlayWrapper">
          <img class="retro" src="./static/{$id}/retro.jpg" title="{$id}" />
          <svg width="550.33" height="360.33" viewBox="0 0 {$width} {$height}" class="overlayPath">
              <xsl:for-each select="tei:facsimile/tei:surface[1]/tei:zone">
              <xsl:variable name="zonetype" select="@type"/>
              <xsl:variable name="zoneID" select="@xml:id"/>
                  <xsl:choose>
                      <xsl:when test="@points">
                          <xsl:variable name="points" select="@points"/>
                          <polygon points="{$points}" class="{$zonetype}" id="{$zoneID}" />
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:variable name="pointx" select="@ulx"/>
                          <xsl:variable name="pointy" select="@uly"/>
                          <xsl:variable name="widthr" select="@lrx - @ulx"/>
                          <xsl:variable name="heightr" select="@lry - @uly"/>
                          <rect x="{$pointx}" y="{$pointy}" height="{$heightr}" width="{$widthr}" class="{$zonetype}" id="{$zoneID}"/>
                      </xsl:otherwise>
                  </xsl:choose>
              </xsl:for-each>
          </svg>
      </div>
      <div class="meta">
                        <p class="tipografia">
                            <span class="label">N° di catalogazione: </span>
                            <xsl:value-of select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='secondamano']"/>
                        </p>
                        <xsl:if test="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher | tei:author ">
                            <p class="tipografia">
                                <span class="label">Editore cartolina: </span>
                                <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher | tei:author "/>
                            </p>
                        </xsl:if>
                        <xsl:if test=".//tei:body//tei:head">
                            <p class="tipografia">
                                <span class="label">Titolo immagine: </span>
                                <xsl:value-of select=".//tei:body//tei:head"/>
                            </p>
                        </xsl:if>
                        <xsl:if test=".//tei:body/tei:div">
                            <p class="tipografia">
                                <span class="label">Timbri e francobolli: </span>
                                <xsl:value-of select=".//tei:body//tei:head"/>
                            </p>
                        </xsl:if>
                        <xsl:if test=".//tei:front//tei:s"> <!-- da inserire nell'xml in input -->
                            <p class="tipografia">
                                <span class="label">Testo tipografico sul retro:</span>
                            </p>
                        </xsl:if>
                        <xsl:for-each select=".//tei:front//tei:s|.//tei:front//tei:ab">
                            <p class="tipografia">
                                >
                                <xsl:for-each select="text()|*">
                                    <xsl:choose>
                                        <xsl:when test="self::tei:choice">
                                            <xsl:value-of select="tei:abbr"/>
                                        </xsl:when>
                                        <xsl:when test="self::text()|self::*">
                                            <xsl:value-of select="."/>
                                        </xsl:when>
                                        <xsl:when test="self::tei:num">
                                            <xsl:value-of select="."/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                            </p>
                        </xsl:for-each>
                        <xsl:if test=".//tei:div[@type='recto']/tei:figure//tei:figDesc/tei:mentioned">
                            <p class="tipografia">
                                <span class="label">Testo tipografico sul fronte:</span>
                                <xsl:value-of select=".//tei:div[@type='recto']/tei:figure//tei:figDesc/tei:mentioned"/>
                            </p>
                        </xsl:if>
                    </div>
      <div class="filterbar">
        <xsl:variable name="teiid" select="@xml:id"/>
        <div class="sez2">
          <a href="./static/{$teiid}/fronte.jpg" target="_blank">
              <i class="material-icons {$teiid}">&#xe56b;</i>
         </a>
        </div>
        <div class="sez3">
          <h3>Illutrazione</h3>
        </div>
      </div>
      <div class="fronteWrapper">
          <xsl:variable name="figdescid" select="count(preceding::tei:figDesc)+1"/>
          <img class="fronte" src="./static/{$id}/fronte.jpg" title="{$id}" id="fronte{$figdescid}"/>
          <div class="content_tooltip">
              <xsl:apply-templates select="tei:TEI/tei:teiHeader//tei:support/tei:stamp[@type='postmark']" />
              <xsl:apply-templates select="tei:TEI/tei:teiHeader//tei:support/tei:stamp[@type='postage']" />
              <xsl:apply-templates select="tei:TEI/tei:text//tei:div[@type='recto']/tei:figure//tei:figDesc" />
          </div>
      </div>
  </xsl:template>
  <!-- ****** FINE DIV FACSIMILIE ****** -->

  <!-- OPENER -->
  <xsl:template match="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:opener">
    <p class="manoscritto">
      <xsl:value-of select="."/>
    </p>
  </xsl:template>
  <!-- P -->
  <xsl:template match="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='postcard-body']">
    <xsl:for-each select="tei:p/tei:lb">
      <p class="manoscritto">
            <xsl:value-of select="./following-sibling::text()"/>
      </p>
    </xsl:for-each>
  </xsl:template>
  <!-- CLOSER -->
  <xsl:template match="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:closer">
      <xsl:for-each select="tei:s/tei:lb">
          <p class="manoscritto">
              <xsl:value-of select="./following-sibling::text()"/>
          </p>
      </xsl:for-each>
      <p class="manoscritto">
        <xsl:for-each select="tei:s/tei:lb/following-sibling::tei:signed">
            <xsl:value-of select="."/>
      </xsl:for-each>
      </p>
  </xsl:template>
  <!-- DESTINATION -->
  <xsl:template match="tei:TEI/tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='address-destination']">
    <p>_______________________________________________</p>
      <xsl:for-each select="tei:p/tei:address/tei:addrLine/tei:lb">
        <p class="manoscritto">
              <xsl:value-of select="./following-sibling::text()"/>
        </p>
      </xsl:for-each>
  </xsl:template>

  <!-- FOOTER
  <xsl:template match="tei:editionStmt">
      <xsl:value-of select="tei:respStmt[tei:resp[not(contains(., 'Codificato da'))]]"/>
  </xsl:template> -->
  <xsl:template match="tei:TEI/tei:teiHeader//tei:publicationStmt">
      <div class="section_footer">
          <i class="material-icons">account_balance</i>
          <p id="location_unipi" class="location">
              <span id="abbr" class="span_info">
                  <xsl:value-of select="tei:publisher//tei:abbr"/> -
              </span>
              <span id="expan" class="span_info">
                  <xsl:value-of select="tei:publisher//tei:expan"/>
              </span>
          </p>
      </div>
      <div class="section_footer">
          <i class="material-icons">edit_location</i>
          <p id="location_labcd" class="location">
              <span id="abbr" class="span_info">
                  <xsl:value-of select="tei:distributor//tei:abbr"/> -
              </span>
              <span id="expan" class="span_info">
                  <xsl:value-of select="tei:distributor//tei:expan"/>
              </span>
          </p>
      </div>
  </xsl:template>
  <xsl:template match="tei:TEI/tei:teiHeader//tei:editionStmt//tei:respStmt[not(contains(tei:resp, 'Codificato da:'))]">
      <div class="section_footer">
          <p>
              <i class="material-icons">assignment</i>
              <span class="pers_role span_info">
                  <xsl:value-of select="tei:resp"/>
              </span>
              <xsl:for-each select="tei:persName">
                  <span class="pers_name span_info">
                      <xsl:value-of select="."/>
                  </span>
              </xsl:for-each>
          </p>
      </div>
  </xsl:template>

  <xsl:template match="tei:TEI/tei:teiHeader//tei:titleStmt/tei:respStmt[not(contains(tei:resp, 'Ente di Appartenenza:'))]">
      <div class="section_footer">
          <i class="material-icons">person</i>
          <p>
              <xsl:for-each select="tei:persName">
                  <span class="pers_name span_info">
                      <xsl:value-of select="."/>
                  </span>
              </xsl:for-each>
          </p>
      </div>

  </xsl:template>

  <xsl:template match="text()|@*"></xsl:template>

  </xsl:stylesheet>
