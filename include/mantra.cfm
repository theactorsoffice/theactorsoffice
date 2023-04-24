     <Cfset new_quotedate=dateFormat(Now(),'yyyy-mm-dd') />


<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery datasource="#dsn#" name="x"  >
SELECT * FROM quotes where quotedate = <cfqueryparam cfsqltype="cf_sql_date" value="#new_quotedate#"  >
</cfquery>
                        
                            <div class="row">
 <div class="col-md-12 col-lg-12">&nbsp;</div>
                    <Cfoutput>
                        <div class="col-md-12 col-lg-12" style="text-align:center;">
                             
                                <h5>"#x.quotename#"</h5>
                                <BR>
                                <h6>-#x.quoteauthor#</h6>

                            
                        </div>
                            </cfoutput>
                </div>
                        
                        
                        
  <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 