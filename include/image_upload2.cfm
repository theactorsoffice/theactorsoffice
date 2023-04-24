<cfset pictureImg = imageReadBase64(form.picturebase)>
    
 
        
        
<cfimage 
    source="#pictureImg#"
    destination="#cookie.uploadDir#" 
          overwrite="true"
    action="write">
    
         <cfoutput>
                <cfsavecontent variable="diagnostics">
                <cfif #isdefined('pgid')#>pgid: #pgid#<br /></cfif> 
                    <cfif #isdefined('ref_pgid')#>ref_pgid: #ref_pgid#<br /></cfif>
                <cfif #isdefined('userid')#>userid: #userid#<br /></cfif>
                <cfif #isdefined('cookie.uploadDir')#>cookie.uploadDir: #cookie.uploadDir#<br /></cfif>
                <cfif #isdefined('cookie.return_url')#>cookie.return_url: #cookie.return_url#<br /></cfif>
                <cfif #isdefined('browser_contact_avatar_loc')#>browser_contact_avatar_loc: #browser_contact_avatar_loc#<br /></cfif>
                <cfif #isdefined('image_url')#>image_url: #image_url#<br /></cfif>
                    </cfsavecontent>
                    
           
                   
 
                
                </cfoutput>
    
    
    
<cfmail from="support@theactorsoffice.com" to="kevinking7135@gmail.com" subject="#cookie.uploaddir#" type="HTML">
             <p>#diagnostics#</p>
 
    </cfmail>