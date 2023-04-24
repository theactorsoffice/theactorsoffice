<cfparam name="pgaction" default="view" />

<cfparam name="oldverid" default="0" />

<style>
    #hidden_div {
        display: none;
    }
</style>

<cfset pgcol=3 />

<cfif #pgaction# is 'view'>

    <cfoutput query="details">

        <div class="row">

            <div class="col-12">

                <div class="card">

                    <div class="card-body">

                        <h4 class="mt-0">

                            <h4 class="mt-3">Ticket Details</h4>

                            <h5>No. #details.recid#: #details.ticketname#</h5>

                            <p> #details.ticketdetails#</p>

                            <cfif #details.ticketresponse# is not "">

                                <p><strong>Developer Response:</strong> <i>#details.ticketresponse#</i></p>

                            </cfif>

                            <p>#details.ticketpriority# | #details.tickettype# |

                                <cfif #details.environ# is "D">

                                    Development

                                </cfif>

                                <cfif #details.environ# is not "D">

                                    Production

                                </cfif>
                            </p>
                            
                            
                            

                            <hr>
                            
                        
                            </cfoutput>     
                       
                                    
                  <cfif  #details.ticketstatus# is "Implemented">           
                            
                            <cfinclude template="/include/implemented_section.cfm" />
                            
                </cfif>
                            
                            
                         
                  <cfif  #details.ticketstatus# is "Testing">           
                            
                            <cfinclude template="/include/testing_section.cfm" />
                            
                </cfif>

        </div>

        </div>

        </div>

        </div>
            

</cfif>

<script>
    function showDiv(divId, element) {
        document.getElementById(divId).style.display = element.value == 'Rejected' ? 'block' : 'none';
    }
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<cfinclude template="/include/bigbrotherinclude.cfm" />