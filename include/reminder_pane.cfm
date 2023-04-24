<cfset dbug="N" />

<cfparam name="zquery" default="" />

<cfset unchecked_style="mdi mdi-checkbox-blank-outline font-24 mr-1" />

<cfset checked_style="mdi mdi-checkbox-marked-outline font-24 mr-1" />

<cfparam name="hide_completed_check" default="" />

<cfparam name="hide_completed" default="N" />

<cfif #hide_completed# is "Y">

    <cfset hide_completed_check="checked" />

</cfif>


<cfoutput>

    <div class="d-flex justify-content-between">

        <div class="float-left">

            <form >
                <cfoutput>
                <input type="hidden" name="contactid" value="#currentid#">
                <input type="hidden" name="t4" value="1">
</cfoutput>
                <div class="checkbox checkbox-success form-check-inline">

                    <input type="checkbox" id="hide_completed" value="Y" name="hide_completed" onChange="this.form.submit()" #hide_completed_check# />

                    <label for="hide_completed"> Hide Completed & Skipped </label>

                </div>

            </form>

        </div>

    </div>

</cfoutput>

<div id="tab-relationship-view" style="flex: 1 1 auto;">

    <cfloop query="sysActive">

        <cfinclude template="/include/qry/notsActive.cfm" /> 
        <cfoutput>

            <div class="row">

                <div class="col-md-12">

                    <h4>#sysActive.systemName# 

                        <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="##action#sysactive.suid#-modal">

                            <i class="fe-info font-14 mr-1"></i>

                        </a>

                        <cfif #sysActive.sustatus# is "Completed">

                            <span class="badge bg-warning rounded-pill">Completed</span>

                        </cfif>

                        <span> <a title="Delete System" href="DeleteModal.cfm?rpgid=40&recid=#sysActive.suid#&t4=1" data-bs-toggle="modal" data-bs-target="##remoteDeleteForm#sysActive.suid#"><i class="fe-trash-2"></i></a></span>

                    </h4>

        </cfoutput>

        <cfif #notsActive.recordcount# is "0">

            <p>No action items to show!</p>

        </cfif>
                
                
                
                
                
                
                

        <cfif #notsActive.recordcount# is not "0">

            <cfloop query="notsActive">

                <cfoutput>

                    <div class="col-md-12" style="padding-bottom:10px; margin-left:30px;">
<cfif #notsActive.notstatus# is "Pending">
                        <a href="/include/complete_not.cfm?notid=#notsactive.notid#&notstatus=Completed&hide_completed=#hide_completed#">
</cfif>
                            <i class="mdi mdi-checkbox-#notsactive.checktype#-outline font-24 mr-1" style="vertical-align: middle;color:###notsactive.status_color#"></i>
<cfif #notsActive.notstatus# is "Pending">
                        </a>
                        </cfif>
                        #notsactive.delstart# #notsActive.actiondetails# #notsactive.delend#

                        <cfif #notsactive.notEndDate# is not "">

                            (#notsactive.notstatus# #dateformat('#notsactive.notEndDate#','m/d')#)

                        </cfif>

                        <cfif #notsactive.notEndDate# is "">

                            (Due Date #dateformat('#notsactive.notstartdate#','m/d')#)

                        </cfif>

                        <cfif #notsactive.ispastdue# is "1">

                            <span class="badge badge-soft-danger">Past Due</span>

                        </cfif>

                        <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="##action#notsActive.actionid#-modal">

                            <i class="fe-info font-14 mr-1"></i>

                        </a>
                        <cfif #notsactive.notstatus# is  "Pending">
                         <a href="/include/complete_not.cfm?notid=#notsactive.notid#&notstatus=Skipped&hide_completed=#hide_completed#" title="Skip reminder"> <span class="badge badge-blue" style="margin-left:10px">x Skip</span>    </a>               
</cfif>
                        
                        
                        

                    </div> <!-- end col-md-12 -->
 
                </cfoutput>

            </cfloop>

        </cfif>
                
                
            
                
              
                
                
                
                
                
                
                
                
                
                
                
                
                
                <cfif #isdefined('showstuff')#>
                <cfif #hide_completed# is "N">
                
                        <cfif #notsinactive.recordcount# is not "0">
                        <hr style="color:purple;">
                            <p style="color:purple;"><cfoutput>#zquery#</cfoutput></p>
                        <p style="color:purple;">The reminders below are future and will NOT be shown to the user.  These are shown for testing purposes only:</p>
                        
                        </cfif>

            <cfloop query="notsInActive">

                <cfoutput>

                    <div class="col-md-12" style="padding-bottom:10px; margin-left:30px;">
<cfif #notsinactive.notstatus# is "Pending">
                        <a href="/include/complete_not.cfm?notid=#notsinactive.notid#&notstatus=Completed&hide_completed=#hide_completed#">
</cfif>
                            <i class="mdi mdi-checkbox-#notsinactive.checktype#-outline font-24 mr-1" style="vertical-align: middle;color:###notsinactive.status_color#"></i>
<cfif #notsinactive.notstatus# is "Pending">
                        </a>
                        </cfif>
                        <span style="color:purple;">      #notsinactive.delstart# #notsinactive.actiondetails# #notsinactive.delend#</span>

                        <cfif #notsinactive.notstartDate# is not "">

                     <span style="color:purple;">     (FUTURE DATE: #dateformat('#notsinactive.notstartDate#','m/d')#)</span>  
                            
                            <cfelse>
                                
                                <span style="color:purple;">    (FUTURE DATE: TBD)</span>  

                        </cfif>

            

                        <cfif #notsinactive.ispastdue# is "1">

                            <span class="badge badge-soft-danger">Past Due</span>

                        </cfif>

                        <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="##action#notsinactive.actionid#-modal">

                            <i class="fe-info font-14 mr-1"></i>

                        </a>
                        <cfif #notsinactive.notstatus# is  "Pending">
                         <a href="/include/complete_not.cfm?notid=#notsinactive.notid#&notstatus=Skipped&hide_completed=#hide_completed#" title="Skip reminder"> <span class="badge badge-blue" style="margin-left:10px">x Skip</span>    </a>               
</cfif>
                        
                        
                        

                    </div> <!-- end col-md-12 -->
 
                </cfoutput>

            </cfloop>

       
                
           
                </cfif>
                
                </cfif>
                
                

</div>

</cfloop>

</div>

</div>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \ ")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" />