 <CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="x" datasource="#dsn#">
SELECT ad.audid,

sc.audcatid

FROM auditions ad

left OUTER JOIN audlocations l on l.audlocid = ad.audlocid    
                    
LEFT OUTER JOIN audroles r ON r.audRoleID = ad.audroleid
            
LEFT OUTER JOIN audprojects pr ON pr.audprojectID = r.audprojectID
        
LEFT OUTER JOIN audcallbacktypes cbt on cbt.callbacktypeid = ad.callbacktypeid               

LEFT OUTER JOIN audtypes t ON t.audtypeid = ad.audtypeid

LEFT OUTER JOIN audplatforms pl on pl.audplatformid = ad.audplatformid

LEFT OUTER JOIN audsteps s ON s.audstepid = ad.audstepid
        
LEFT OUTER JOIN audbooktypes bt on bt.audbooktypeid = ad.audbooktypeid

LEFT OUTER JOIN audsubcategories sc ON sc.audSubCatId = pr.audsubcatid

WHERE  cbt.callbacktype is null and s.audstep = 'Callback' and ad.isdeleted is false


</cfquery>


<cfloop query="x">


<cfquery name="f" datasource="#dsn#" maxrows="1">
select callbacktypeid from audcallbacktypes where audcategoryid = #x.audcatid# order by rand()
</cfquery>

<cfloop query="f">
    <cfquery name="update" datasource="#dsn#"  >
 update auditions set callbacktypeid = #f.callbacktypeid# where audid = #x.audid#
    </cfquery>
    
    </cfloop>


</cfloop>