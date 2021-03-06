<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step 
    xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:xf="http://www.w3.org/2002/xforms"
    name="main"
    version="1.0">
    
    
    <!-- Wrapper XProc for ProX
         Requires resource map file as an input. 
         The platform used must be set in the $os
         variable, below. -->
    
    <!-- Inputs -->
    
    <!-- Mapping document -->
    <!-- Contains all URN/URL for XSLT, XPL, XML modules, targets, etc -->
    <p:input port="map"/>
    
    
    
    <!-- Global XSLT params -->
    <!-- (Not needed) -->
    <p:input port="xsltparams" kind="parameter"/>
    
    
    
    <!-- Outputs -->
    
    <p:output port="urn2url-result" sequence="true">
        <p:pipe port="result" step="urn2url-modules"/>
    </p:output>
    
    <p:output port="prox-update-result" sequence="true">
        <p:pipe port="result" step="prox-fix"/>
    </p:output>
    
    <p:output port="xsltbat-result" sequence="true">
        <p:pipe port="result" step="xsltbat"/>
    </p:output>
    
    <p:output port="after-xsltbat-result" sequence="true">
        <p:pipe port="result" step="med"/>
    </p:output>
    
    
    
    <!-- ProX Blueprint URL -->
    <p:variable 
        name="prox-blueprint" 
        select="//prox/blueprints/resource[@id='id-prox-blueprint']/url/text()">
        <p:pipe port="map" step="main"/>
    </p:variable>
    
    <!-- XForm URL -->
    <p:variable 
        name="xform-url" 
        select="//wrapper-pipeline//resource[prox-id='id-loc-xform']/url">
        <p:pipe port="map" step="main"/>
    </p:variable>
    
    <!-- Temp URL -->
    <p:variable name="tmp-url" select="substring-before(base-uri(/*),tokenize(base-uri(.),'/')[last()])">
        <p:pipe port="map" step="main"/>
    </p:variable>
    
    <!-- Select OS ('osx', 'win', 'linux' allowed) -->
    <p:variable name="os" select="'osx'"/>
    
    
    
    <!-- Insert ProX URLs into XForm -->
    <p:group name="fix-xform">
        <p:load>
            <p:with-option 
                name="href" 
                select="//wrapper-pipeline/package/resources/resource[prox-id='id-loc-xform']/url/text()">
                <p:pipe port="map" step="main"/>
            </p:with-option>
        </p:load>
        
        <!-- Insert ProX blueprint URL into XForm -->
        <p:add-attribute 
            name="add-src" 
            attribute-name="src" 
            match="//xf:instance[@id='mysource']">
            <p:with-option 
                name="attribute-value" 
                select="//prox/blueprints/resource[@id='id-prox-blueprint']/url/text()">
                <p:pipe port="map" step="main"/>
            </p:with-option>
            <p:input 
                port="source"/>
        </p:add-attribute>
        
        <!-- Insert ProX instance URL into XForm -->
        <p:add-attribute
            name="add-instance-name" 
            attribute-name="action" 
            match="//xf:submission[@id='save']">
            <p:with-option 
                name="attribute-value" 
                select="//prox/instances/resource[@id='id-prox-saved-instance']/url/text()">
                <p:pipe port="map" step="main"/>
            </p:with-option>
            <p:input 
                port="source"/>
        </p:add-attribute>
        
        <!-- Store updated XForm -->
        <p:store name="store-new-prox">
            <p:with-option name="href" select="$xform-url"/>
        </p:store>
    </p:group>
    
    
    
    <!-- Open ProX Blueprint in Browser -->
    <!-- Opens with an XForms profile in order
         to start a separate browser instance -->
    <p:choose name="browse">
        <!-- Linux -->
        <p:when test="$os='linux'">
            <p:exec 
                cx:depends-on="fix-xform"
                command="/usr/bin/iceweasel">
                <p:input port="source">
                    <p:empty/>
                </p:input>
                <p:with-option name="args" select="concat('-P &quot;XForms&quot; -no-remote ',$xform-url)"/>
            </p:exec>
            <p:sink/>
        </p:when>
        
        <!-- Mac OS X -->
        <p:when test="$os='osx'">
            <p:exec 
                cx:depends-on="fix-xform"
                command="/Applications/Firefox.app/Contents/MacOS/firefox">
                <p:input port="source">
                    <p:empty/>
                </p:input>
                <p:with-option name="args" select="concat('-P &quot;XForms&quot; -no-remote ',$xform-url)"/>
            </p:exec>
            <p:sink/>
        </p:when>
        
        <!-- Windows -->
        <p:when test="$os='win'">
            <p:exec 
                cx:depends-on="fix-xform"
                command="file:/c:/Program Files/Mozilla Firefox/firefox.exe">
                <p:input port="source">
                    <p:empty/>
                </p:input>
                <p:with-option name="args" select="concat('-P &quot;XForms&quot; -no-remote ',$xform-url)"/>
            </p:exec>
            <p:sink/>
        </p:when>
    </p:choose>
    
    
    
    <!-- Map URNs to URLs in roots and modules -->
    <p:for-each 
        name="urn2url-modules" 
        xml:base="file:///Users/System/Documents/SGML/DTD/Process-XML/XSLT/" 
        cx:depends-on="browse">
        <!-- Iterate on distinct URNs only.
             Note: Document root resources are not identical
             because of differing prox-id's indicated in the
             resource XML, so distinct-values() will not work. -->
        <p:iteration-source 
            select="/resource-map/docs/doc/modules/resource[type='xml' and not(urn=preceding::urn)]|
            /resource-map/docs/doc/root/resource[type='doc-root' and not(urn=preceding::urn)]">
            <p:pipe port="map" step="main"/>
        </p:iteration-source>
        
        <p:output port="result" sequence="true">
            <p:pipe port="result" step="id"/>
        </p:output>
        
        <p:variable name="filename" select="/resource/url"/>
        
        <p:load name="load" dtd-validate="false">
            <p:with-option name="href" select="$filename"/>
        </p:load>
        
        <p:xslt name="xslt">
            <p:input port="source">
                <p:pipe port="result" step="load"/>
            </p:input>
            <p:input 
                port="stylesheet" 
                select="doc(//wrapper-pipeline/package/resources/resource[prox-id='id-urn2url']/url/text())">
                <p:pipe port="map" step="main"/>
            </p:input>
            <p:with-param 
                name="map-url" 
                select="base-uri()">
                <p:pipe port="map" step="main"/>
            </p:with-param>
        </p:xslt>
        
        <p:identity name="id">
            <p:input port="source"/>
        </p:identity>
        
        <p:store>
            <p:with-option name="href" select="$filename"/>
        </p:store>
    </p:for-each>
    
    
    
    <!-- Update ProX Instance -->
    <!-- Runtime values inserted from resource map. -->
    <p:xslt name="prox-urn2url" cx:depends-on="urn2url-modules">
        <p:input 
            port="source" 
            select="doc(//prox/instances/resource[@id='id-prox-saved-instance']/url/text())">
            <p:pipe port="map" step="main"/>
        </p:input>
        <p:input 
            port="stylesheet" 
            select="doc(//wrapper-pipeline/package/resources/resource[prox-id='id-prox-fix']/url/text())">
            <p:pipe port="map" step="main"/>
        </p:input>
        <p:with-param name="map-url" select="base-uri()">
            <p:pipe port="map" step="main"/>
        </p:with-param>
    </p:xslt>
    
    <p:identity name="prox-fix"/>
    
    <p:store name="save-prox" cx:depends-on="prox-urn2url">
        <p:with-option name="href" select="'tmp-instance-prox-with-urls.xml'"/>
    </p:store>
    


    <!-- Add ProX instance validation here? -->
    
    
    
    <!-- Convert ProX Instance to Shell Script for Calabash -->
    <p:xslt name="xsltbat">
        <p:input port="source">
            <p:pipe port="result" step="prox-urn2url"/>
        </p:input>
        <p:input 
            port="stylesheet" 
            select="doc(//wrapper-pipeline/package/resources/resource[prox-id='id-prox2bat']/url/text())">
            <p:pipe port="map" step="main"/>
        </p:input>
        <p:with-param name="map-url" select="base-uri()">
            <p:pipe port="map" step="main"/>
        </p:with-param>
        <p:with-param name="os" select="$os"/>
    </p:xslt>
    
    
    <!-- Store generated shell script and run it -->
    <p:choose>
        <!-- Linux -->
        <p:when test="$os='linux'">
            <!-- Save bat file (runs child pipeline) -->
            <p:store method="text" name="save-bat">
                <p:with-option name="href" select="'out2.sh'"/>
            </p:store>
            <p:exec 
                source-is-xml="false" 
                result-is-xml="false" 
                name="run-bat" 
                cx:depends-on="save-bat">
                <p:with-option name="command" select="'sh'"/>
                <p:with-option name="args" select="'./out2.sh'"/>
                <p:with-option name="cwd" select="substring($tmp-url,6, string-length($tmp-url)-1)"/>
                <p:log port="errors" href="error.txt"/>
                <p:input port="source">
                    <p:empty/>
                </p:input>
            </p:exec>
            <p:sink/>
        </p:when>
        
        <!-- OS X -->
        <p:when test="$os='osx'">
            <!-- Save bat file (runs child pipeline) -->
            <p:store method="text" name="save-bat">
                <p:with-option name="href" select="'out2.sh'"/>
            </p:store>
            <p:exec 
                source-is-xml="false" 
                result-is-xml="false" 
                name="run-bat" 
                cx:depends-on="save-bat">
                <p:with-option name="command" select="'sh'"/>
                <p:with-option name="args" select="'./out2.sh'"/>
                <p:with-option name="cwd" select="substring($tmp-url,6, string-length($tmp-url)-1)"/>
                <p:log port="errors" href="error.txt"/>
                <p:input port="source">
                    <p:empty/>
                </p:input>
            </p:exec>
            <p:sink/>
        </p:when>
        
        <!-- Windows -->
        <p:when test="$os='win'">
            <!-- Save bat file (runs child pipeline) -->
            <p:store method="text" name="save-bat">
                <p:with-option name="href" select="'out2.bat'"/>
            </p:store>
            <p:exec 
                source-is-xml="false" 
                result-is-xml="false" 
                name="run-bat" 
                cx:depends-on="save-bat">
                <p:with-option name="command" select="'out2.bat'"/>                
                <p:with-option name="cwd" select="substring($tmp-url,6, string-length($tmp-url)-1)"/>
                <p:log port="errors" href="error.txt"/>
                <p:input port="source">
                    <p:empty/>
                </p:input>
            </p:exec>
            <p:sink/>
        </p:when>
    </p:choose>
    
    
    <!-- Return Results -->
    
    <p:identity name="med">
        <p:input port="source" select="//wrapper-pipeline/package/resources/resource[prox-id='id-wrapper-xpl']/url">
            <p:pipe port="map" step="main"/>
        </p:input>
    </p:identity>
    
    
    
</p:declare-step>