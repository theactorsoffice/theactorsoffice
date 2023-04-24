  
<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindModalTitle"  >
    SELECT p.pgTitle,
    c.compname
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    WHERE p.pgid = #rpgid#
</cfquery>


  
    


<div id="remoteNewForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header" style="background-color: #f3f7f9;">
													<h4 class="modal-title" id="standard-modalLabel"><cfoutput> #FindModalTitle.compname#</cfoutput> Add Form</h4>
													<button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">x</button>
												</div>
											<div class="modal-body">
													
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
    
    

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
