 

<cfquery datasource="abo" name="x">
SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon = 'unknown.png' 
</cfquery>

<cfloop query="x">
    <cfset id = x.id />
    <cfset siteurl = x.siteurl />

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

<cfdump var="#icoResult#" /><cfabort>



</cfloop>