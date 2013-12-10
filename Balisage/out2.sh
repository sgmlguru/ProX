
# Generated for OS X

         echo Print Publishing
         echo Print publishing for COSML documents
      
               echo Publish PDF
               echo Normalizes, validates and converts a COSML document to PDF
            
                     echo COS Internal Template
                     echo Configures the pipeline for the "COS Internal" template
                  
               echo XProc Pipeline for Normalize, Validate and PDF
               echo Normalizes, validates and publishes in PDF a COSML document
            
               echo XSL-FO Package for COSML PDF
               echo Converts COSML documents to XSL-FO format for COS PDF layout
            java -classpath /Applications/xmlcalabash-1.0.9-94/calabash.jar:/Applications/xmlcalabash-1.0.9-94/lib/saxon9he.jar:/Applications/xmlcalabash-1.0.9-94/lib/commons-logging-1.1.1.jar:/Applications/xmlcalabash-1.0.9-94/lib/commons-httpclient-3.1.jar:/Applications/xmlcalabash-1.0.9-94/lib/commons-codec-1.6.jar:/Applications/xmlcalabash-1.0.9-94/lib/commons-io-1.3.1.jar:/Users/System/XEP/lib/xep.jar:/Users/System/XEP/lib/xt.jar:/Applications/lib/jing.jar com.xmlcalabash.drivers.Main --config file:///Applications/xmlcalabash-1.0.9-94/conf-calabash.xml --input document=file:///Users/System/Library/Containers/com.bitnami.mampstack/Data/app-5_4_9/apache2/htdocs/prox/refactor/test-root.xml --input stylesheet=file:///Users/System/Documents/SGML/DTD/Cassis/FO/cos-fo-internal.xsl --with-param xslt-params@xep.extensions=0 --with-param xslt-params@toc.depth=2 --input stylesheet-norm=file:///Users/System/Documents/SGML/DTD/Cassis/FO/normalize.xsl pdf=file:///Users/System/Library/Containers/com.bitnami.mampstack/Data/app-5_4_9/apache2/htdocs/prox/refactor/my-pdf-internal-file.pdf  file:///Users/System/Documents/SGML/DTD/Cassis/XProc/publish-cosml-pdf.xpl
read -p "Press [Enter] to continue..."
      
      
      
         
            echo Normalize XSLT
            echo Stylesheet for applics filtering and module normalization for COSML documents
         
         
         
      
      
      
      
         
            echo Calabash Configuration
            echo Configures Calabash
         
         
      
      
      
      
      
      
         
            echo Wrapper Pipeline Processing
            echo These files are used for running the wrapper pipeline.
         

         
         
         
         
         
         
         
         
         
      
      
      
      
         
            echo ProX XForms Package
            echo XForms for selecting and configuring a process, based on a ProX blueprint.
         
         
      
   