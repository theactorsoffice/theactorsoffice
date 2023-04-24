<div class="mobile">
    
    <cfparam name="target_id" default="0" />

    <div class="row">

        <div class="col-xl-12">

            <div id="accordion_systems" class="mb-3">
                
                
                <cfloop query="eventresults">
                    
  <cfset new_eventid = eventresults.eventid />
 

            <cfoutput>
                
               
                
                <cfset k=#k# + 1 />
            
            </cfoutput>

            <cfset cardclass="" />
         
<cfif #new_eventID# is "#target_id#">

    <cfset header_aria_exanded="true" />
    
    <cfset collapse_show = "collapse show" />

</cfif>

<cfif #new_eventID# is not "#target_id#">

    <cfset header_aria_exanded="false" />
    
    <cfset collapse_show = "collapse" />

</cfif>              

    <div class="card mb-1">
               
                    <div class="card-header" id="heading_system_<cfoutput>#eventresults.currentrow#</cfoutput>">

                        <h5 class="m-0" style="width:100%'">

                            <a class="text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_<cfoutput>#eventresults.currentrow#</cfoutput>" aria-expanded="#header_aria_expanded#">
 
                                
                                
                                <cfoutput> #dateformat('#eventresults.col3#','m-d-YYYY')# - #timeformat('#eventresults.eventStartTime#','medium')# </cfoutput>  

                            </a>
                            
                            <cfoutput>#eventresults.col5#</cfoutput>

                        </h5>

                    </div>

                    <div id="collapse_system_<cfoutput>#eventresults.currentrow#</cfoutput>" class="<cfoutput>#collapse_show#</cfoutput>" aria-labelledby="collapse_system_<cfoutput>#eventresults.currentrow#</cfoutput>" data-bs-parent="#accordion_systems"  >


                        <div class="card-body">
                            
                            <h6>#eventresults.col1#</h6>
      <h6>Location</h6><p>#eventresults.col2#</p> 
                            
                            <h6>Description</h6> 
                            <p><cfoutput>
                           #eventresults.eventDescription#
</cfoutput>
                            </p>

                        </div>

                    </div>

                </div>
                 
            </cfloop>  

            </div>

        </div>

    </div>

</div>

