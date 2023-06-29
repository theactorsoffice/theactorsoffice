<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="audlink_details"  datasource="#dsn#"  >
    select * from audlinks where linkid = #linkid#
</cfquery>
 
 <cfoutput>
<center>Are you sure you want<BR>to delete <strong>#audlink_details.linkname#</strong>?</center></cfoutput>
<p></p>

 

    <form action="/include/remoteDeletelink2.cfm" method="post" class="needs-validation" novalidate>
        <cfoutput><input type="hidden" name="eventid" value="#eventid#" /><input type="hidden" name="audprojectid" value="#audprojectid#" />
                   <input type="hidden" name="linkid" value="#linkid#" />
                <input type="hidden" name="secid" value="177" />
    
 
            
            
        </cfoutput>

<p>&nbsp;</p>
     <div class="form-group text-center  col-md-12">
            <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: red; border: red"  type="submit">Delete</button>
        </div>
</form>



<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
