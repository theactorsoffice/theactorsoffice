 <cftry>
    <!-- Your code here -->
 


<cfquery datasource="abo" name="x" maxrows=10>
SELECT id,sitename,siteurl,siteicon FROM sitelinks_user WHERE iscustom = 1 AND siteicon = 'unknown.png' 
</cfquery>

<cfloop query="x">
    <cfset id = x.id />
    <cfset siteurl = x.siteurl />

    <cfoutput>
    
    iD: #id#<BR>

    siteurl:#siteurl#<BR>

    </cfoutput>

 



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
    
    
    <cfset image_dir = "/app/assets/images/retina-circular-icons/32" />
    
<cfhttp url="https://icon.horse/icon/#domain#?apikey=996ca328-b4b1-47a7-8d41-e5255525ab6b&fallback_bg=406e8e&size=small&ignore_other_sizes=false" method="get" getAsBinary="yes" result="icoResult"></cfhttp>

 
 <cfif icoResult.statusCode EQ "200 OK">


            
        
        
            <!-- Read PNG and Save -->
       
            <cfimage action="write" destination="#image_dir#/custom_#id#.png" source="#icoResult.filecontent#" format="png"></cfimage>
            
            <!-- Update Record -->
            <cfset new_siteicon = "custom_#id#.png">
            <cfquery datasource="abo" name="update">
                update sitelinks_user 
                set siteicon = '#new_siteicon#'
                where id = #x.id#
            </cfquery>
</cfif>

</cfloop>
   <cfcatch>
 






         <p><strong>Error Type:</strong> #cfcatch.type#</p>
      <p><strong>Error Message:</strong> #cfcatch.message#</p>
      <p><strong>Error Detail:</strong> #cfcatch.detail#</p>
    </cfcatch>
</cftry>