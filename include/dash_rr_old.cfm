<cfinclude template="/include/qry/dash_rr.cfm" />
<div class="row scroll">
    <cfloop query="r">
        <div class="col-md-12 col-lg-12">
            <cfoutput>
                <a href="/app/contact/?contactid=#r.contactid#&t4=1" class="text-reset font-14 py-1 px-1 d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="#r.recordname#" data-bs-original-title="#r.recordname#">
                    <img src="/app/assets/images/reminder.png" style="width:14px;" alt="reminder">


                    <small <cfif #r.ispastdue# is "1">style="color:red;"</cfif>>
                        #r.total_count# <cfif #r.IspastDue# is not "1">due</cfif> for #r.recordname# </small> </a>



            </Cfoutput>

        </div>
    </cfloop>
</div>



<cfif #isdefined('blahblah')#>
    <cfoutput>
        <a href="/app/contact/?contactid=#r.contactid#&t4=1" class="text-reset font-14 py-1 px-1 d-inline-block" data-bs-toggle="tooltip" data-bs-placement="top" title="#r.recordname#" data-bs-original-title="#r.recordname#">
            <img src="/app/assets/images/reminder.png" style="width:14px;" alt="reminder">


            <small <cfif #r.ispastdue# is "1">style="color:red;"
</cfif>>
#r.total_count# <cfif #r.IspastDue# is "1">overdue</cfif> reminder<cfif #r.total_count# is not "1">s</cfif>
<cfif #r.IspastDue# is not "1">due</cfif> for #r.recordname# </small> </a>



</Cfoutput>

</cfif>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />