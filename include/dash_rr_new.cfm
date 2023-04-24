<cfinclude template="/include/qry/notsactivedash.cfm" />
<div class="row scroll">
    <cfloop query="notsactive">

        <small>


            <cfoutput>

                <div class="col-md-12" style="padding-bottom:5px;">

                    <a href="/include/complete_not.cfm?src=d&notid=#notsactive.notid#&notstatus=Completed&hide_completed=Y">

                        <i class="mdi mdi-checkbox-#notsactive.checktype#-outline font-12 mr-1" style="vertical-align: middle;color:###notsactive.status_color#"></i>

                    </a>

                   <strong>#notsactive.recordname#</strong> -
                        <span>
                        #notsactive.delstart# #notsActive.actiondetails# #notsactive.delend#

             


                            <a href="/include/complete_not.cfm?src=d&notid=#notsactive.notid#&notstatus=Skipped&hide_completed=Y" title="Skip reminder"> <span class="badge badge-blue" style="margin-left:2px;padding:1px;">skip</span> </a></span>


                </div>

        </small>



        </Cfoutput>


    </cfloop>
</div>
