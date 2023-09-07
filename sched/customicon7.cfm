 

<cfquery datasource="abo" name="x" maxrows=10>
SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon = 'unknown.png' 
</cfquery>

<cfloop query="x">
    <cfset id = x.id />
    <cfset siteurl = x.siteurl />

    <cfoutput>iD: #id#<BR>

    siteurl:#siteurl#<BR>

    </cfoutput>

 <Cfset siteurl = "#x.siteurl#" />
   <!-- Add 'http' if missing -->
    <cfif NOT findNoCase("http", siteurl)>
        <cfset siteurl = "http://" & siteurl />
    </cfif>

    <!-- Extract the root URL -->
    <cfset protocol = listFirst(siteurl, "://") & "://">
    <cfset tempUrl = listRest(siteurl, "://")>
    <cfset domain = listFirst(tempUrl, "/")>
    <cfset rootUrl = protocol & domain>

<cfif left(domain, 4) is "www.">
    <cfset domain = right(domain, len(domain) - 4)>
</cfif>
    
    
    
    
<cfhttp url="https://icon.horse/icon/#domain#?apikey=996ca328-b4b1-47a7-8d41-e5255525ab6b&fallback_bg=406e8e&size=small&ignore_other_sizes=false" method="get" getAsBinary="yes" result="icoResult"></cfhttp>

<cfdump var="#icoResult#" /> 
 <cfif icoResult.statusCode EQ "200 OK">
            <!-- File Paths -->
            <cfset tempDir = GetTempDirectory()>
            <cfset tempFileName = tempDir & CreateObject("java", "java.io.File").separator & "favicon_#mylnks_user.id#.ico">
            <cfset pngFileName = tempDir & CreateObject("java", "java.io.File").separator & "favicon_#mylinks_user.id#.png">
            
            <!-- Write the ICO file -->
            <cffile action="write"
                    file="#tempFileName#"
                    output="#icoResult.fileContent#"
                    mode="777">
            </cffile>
            
            <!-- Convert ICO to PNG using ImageMagick -->
            <cfexecute name="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" 
                       arguments="convert #tempFileName# #pngFileName#"
                       timeout="60">
            </cfexecute>
            
            <!-- Read PNG and Save -->
            <cfimage action="read" source="#pngFileName#" name="imageObj">
            <cfimage action="write" destination="#image_dir#\custom_#id#.png" source="#imageObj#" format="png"></cfimage>
            
            <!-- Update Record -->
            <cfset new_siteicon = "custom_#id#.png">
            <cfquery datasource="abo" name="update">
                update sitelinks_user 
                set siteicon = '#new_siteicon#'
                where id = #mylinks_user.id#
            </cfquery>


</cfloop>
