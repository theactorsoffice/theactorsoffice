<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="audmedia_details"  datasource="#dsn#"  >
    select * from audmedia where mediaid = #mediaid#
</cfquery>
 
 <cfoutput>
<center>Are you sure you want<BR>to delete <strong>#audmedia_details.medianame#</strong>?</center></cfoutput>
<p></p>

<cfsavecontent variable="dqry" >
<cfoutput>
update audmedia set IsDeleted = 1 WHERE mediaid = #mediaid#
</cfoutput>
</cfsavecontent>

    <form action="/include/remoteDeleteaudMedia2.cfm" method="post" class="needs-validation" novalidate>
        <cfoutput><input type="hidden" name="mediaid" value="#mediaid#" />

                <input type="hidden" name="secid" value="#secid#" />
        <input type="hidden" name="dqry" value="#dqry#" />
 
            
            
        </cfoutput>

<p>&nbsp;</p>
     <div class="form-group text-center  col-md-12">
            <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: red; border: red"  type="submit">Delete</button>
        </div>
</form>



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
