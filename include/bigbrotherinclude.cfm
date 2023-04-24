            <cftry>
    <cfparam name="contactid" default="0" />
                
                
<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="bro_add"  datasource="#dsn#" >
		INSERT INTO bigbrother
		(pgid,userid, remote_addr, query_string, remote_host, script_name, contactid,isInclude)
		VALUES (
        <cfqueryparam value="#cookie.pgid#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">,
		<cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">, 
		<cfqueryparam value="#cgi.query_string#" cfsqltype="cf_sql_varchar">, 
		<cfqueryparam value="#cgi.remote_host#" cfsqltype="cf_sql_varchar">,
		<cfqueryparam value="#script_name_include#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#contactid#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="Y" cfsqltype="cf_sql_varchar">)
		</cfquery>
<cfcatch type="any">
            
            </cfcatch>
   
 </cftry>

