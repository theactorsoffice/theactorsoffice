<cfparam name="dbug" default="Y" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x"  >
      SELECT tagname,isteam,iscasting,tagtype FROM tags
        </cfquery>


        <cfloop query="x">
            

            
            <cfquery datasource="#dsn#" name="insert"  >
                update tags_user
                set isteam = #x.isteam#,
                iscasting = #iscasting#,
                tagtype = '#x.tagtype#'
                where tagname = '#x.tagname#'
                </cfquery>
                
 
        </cfloop>

 