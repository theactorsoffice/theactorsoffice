<cfinclude template="/include/qry/toasts.cfm" />


<cfif #isdefined('bringtoast')#>
    <cfif #toasts.recordcount# is not "0">
        <div aria-live="polite" aria-atomic="true" data-delay="2000" style="z-index: 99">
            <div style="position: absolute; top: 4.5rem; right: 0;">
                <cfloop query="toasts">
                    <cfoutput>
                        <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-toggle="toast">
                            <div class="toast-header">
                                <img src="../assets/images/logo-sm.png" alt="brand-logo" height="12" class="mr-1" />
                                <strong class="mr-auto">#toasts.notiftitle#</strong>
                                <button type="button" class="ml-2 mb-1 close" data-bs-dismiss="toast" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="toast-body">
                                <A Href="#toasts.notifurl#"><small class="text-muted">#toasts.subtitle# </small></A><BR/>
                                <center><A Href="#toasts.notifurl#"> <small class="text-muted"><i class="mdi mdi-square-edit-outline"></i></small></A></center>
                            </div>
                        </div>
                    </cfoutput>
                </cfloop>
            </div>
        </div>
    </cfif>
</cfif>

