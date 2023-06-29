<cfquery name="results"  datasource="#dsn#"  >
SELECT 
a.eventid AS recid
,'Date' AS head1

,'Project' AS head2
,'Source' as head3
,'Type' as head4
,'Role' AS head5
,a.audstepid

,a.eventStart AS col1
,p.projname AS col2
,s.audsourceid AS col3
,t.audtype AS col4
,rt.audroletype AS col5
,st.audstep

 FROM events a
    
 LEFT JOIN audroles r ON r.audroleid = a.audroleid 
 LEFT JOIN audprojects p ON p.audprojectID = r.audprojectID
 LEFT JOIN audsources s ON s.audSourceID = r.audSourceID
 LEFT JOIN audtypes t ON t.audtypeid = a.audtypeid
 LEFT JOIN audroletypes rt ON rt.audroletypeid = r.audroletypeid
     LEFT JOIN audsteps st ON st.audstepid = a.audstepid
 WHERE a.isdeleted = 0 
and r.audroleid = #audroleid#
    and a.eventid <> #eventid#
    and a.audstepid <> 4
 
 ORDER BY a.eventStart
 </cfquery>    

<div class="row">
     <div class="col-12">
   
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 <cfset i = 0>
                 <div class="row">
                     
                     <cfloop query="results">
                         <cfoutput>
                         <cfset i = #i# + 1 />
                            <div class="col-lg-4">
                                <div class="card ribbon-box">
                                    
                                    <cfif #isdefined('ssfdd')# >
                      
                                    <div class="ribbon-two ribbon-two-success"><span>Booked</span></div>
                                    </cfif>
                                    
                                    
                                    <div class="card-header d-flex">
   <center> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;#DateFormat("#results.col1#","mm-dd-yy")#</center>
    <span class="ms-auto text-muted">#results.col4#</span>
  </div>
                                    
                                    
                                
                                    <div class="card-body">
                                        
                                           <cfif #results.audstep# is not "audition">
                                    <div class="ribbon ribbon-info float-end"><i class="mdi mdi-access-point me-1"></i> #results.audstep#</div>
                                    </cfif>
                                        <h5 class="card-title"><cfif #results.col2# is "">Unknown Project</cfif>#results.col2#</h5>
                                        <p class="card-text"><strong>Source: </strong>#results.col3#</p>
                                        <p class="card-text"><strong>Role: </strong>#results.col5#</p>
                                        <a href="/app/audition/?audprojectid=#audprojectid#&eventid=#results.recid#" class="btn btn-primary waves-effect waves-light">View</a>
                                    </div>
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                     <cfif #i# is "3">
                        </div>
                   <div class="row">
                       <cfset i = 0>
                       </cfif>
                       
                       </cfoutput>
                     </cfloop>
                 
                 
                 
                 
 
             </div>
             <!-- end card body-->
         </div> <!-- end card -->
 
                     </div>
 


 <!-- Default bootstrap modal example -->

 <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
 <cfinclude template="/include/bigbrotherinclude.cfm" />
