

<div id="diagnostics" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">

                    <cfoutput>Diagnostics</cfoutput>

                </h4>

                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>

            </div>

            <div class="modal-body">
                
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
                    
                    <p>#diagnostics#</p>
                   
 
                
                </cfoutput>

            </div>

        </div>

    </div>

</div>


<footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <cfoutput> #devicetype# version.   
                                #dateformat('#now()#','YYYY')# <cfif #session.userid# is "30"><cfif #isdefined('currentStartDate')#>current date: #dateformat('#currentstartdate#')#</cfif></cfif></cfoutput>&reg; The Actor's Office LLC - All rights reserved      </div>
                        <div class="col-md-6">
                            <div class="text-md-end footer-links d-none d-sm-block">
                                <a href="https://www.theactorsoffice.com" target="_blank">TAO Website</a>
                           <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#diagnostics" data-bs-placement="top" title="Diagnostics" data-bs-original-title="Relationship ">Diagnostics</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 