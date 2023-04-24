<cfparam name="pgaction" default="view" />

<script src="/app/assets/js/jquery.bootstrap-touchspin.js"></script>

<cfset pgcol=3 />

<cfif #pgaction# is "view">

    <div class="row">

        <div class="col-12">

            <div class="card">

                <div class="card-body">

                    <h4 class="header-title">Tickets need testing</h4>

                    <p class="text-muted font-13 mb-4">

                    </p>

                    <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                        
                        <thead>
                            
                            <cfloop query="results" endrow="1">
                                <cfoutput>
                                    <cfif (Results.CurrentRow MOD 2)>
                                        <Cfset rowtype="Odd" />
                                        <cfelse>
                                            <Cfset rowtype="Even" />
                                    </cfif>


                                    <tr class="#rowtype#">
                                        <th>Action</th>

                                        <th>#head1#</th>
                                        <th>#head2#</th>
                                        <cfif #isdefined('safddfs')#>
                                            <th>#head3#</th>
                                        </cfif>
                                        <cfif #isdefined('safddfs')#>
                                            <th>#head4#</th>
                                        </cfif>
                                        <th>#head45#</th>
                                        <th>#head5#</th>
                                        <th>#head6#</th>
                                        <th>#head7#</th>
                                        <th>Testing</th>
                                    </tr>
                                </cfoutput>
                            </cfloop>
                        </thead>
                        <tbody>
                            <cfloop query="results">


       
                                      
<cfquery name="ticketusers" datasource="#dsn#" >                       
SELECT tu.id
,tu.ticketid
,tu.userid
,u.recordname
,tu.teststatus
,tu.rejectnotes

 FROM tickettestusers tu
 INNER JOIN taousers u ON u.userid = tu.userid
 WHERE tu.ticketid = #results.recid# and tu.userid <> #session.userid#
</cfquery> 
                
<cfquery name="ticketme" datasource="#dsn#" >                       
SELECT tu.id
,tu.ticketid
,tu.userid
,u.recordname
,tu.teststatus
,tu.rejectnotes

 FROM tickettestusers tu
 INNER JOIN taousers u ON u.userid = tu.userid
 WHERE tu.ticketid = #results.recid# 
    and tu.userid = #session.userid#
 
</cfquery>        
                
                
                
                




                                <cfoutput>
                                    <div id="approve#results.recid#" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header" style="background-color: ##f3f7f9;">
                                                    <h4 class="modal-title" id="standard-modalLabel">TestingNo. 0000#results.recid# - #results.col4# </h4>
                                                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">x</button>
                                                </div>
                                                <div class="modal-body">

                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>


                                    <tr>

                                        <td>
                                            
                                            
                                            
                                            

                                            <cfif #results.col45# is "Testing">

                                                <cfif #ticketme.recordcount# is "0">

                                                    <a style="text-align:right;" href="/app/testing/?recid=#results.recid#">

                                                        <button class="btn btn-xs btn-warning" id="btn-new-event">

                                                            <i class="mdi mdi-text-recognition"></i>

                                                            Test

                                                        </button>

                                                    </a>

                                                </cfif>
                                                
                                                
                                                       <cfif #ticketme.recordcount# is "1" and #session.userid# is "17" >

                                                    <a style="text-align:center;" href="/app/testing/?recid=#results.recid#">

                                                        <button class="btn btn-sm btn-primary" id="btn-new-event">

                                                            <i class="mdi mdi-bug-check-outline"></i>

                                                            Approve/Reject

                                                        </button>

                                                    </a>
                                                           
                                                          
                                                
                                          
                                                               
                                                               

                                                </cfif>
                                                
                                                
                                                

                                            </cfif>
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            <cfif #results.col45# is "Implemented">
                                              <cfif #session.userid# is "17">
                                                
                                                                         <a style="text-align:right;" href="/app/testing/?recid=#results.recid#">

                                                        <button class="btn btn-xs btn-primary" id="btn-new-event">

                                                            <i class="mdi mdi mdi-square-edit-outline"></i>

                                                            Review

                                                        </button>

                                                    </a>
                                                  
                                                  
                                                  
                                                
                                                </cfif>  
                                                
                                                
                                                
                                            </cfif>

                                        </td>










                                        <TD>   <A HREF="/app/testing/?recid=#results.recid#">#results.recid#</A> 
                                     
                                        
                                        </TD>

                                        <td>#results.col2#</td>

                                        <td>
                                            <cfif #results.col45# is "Implemented">
                                                <A HREF="/app/testing/?recid=#results.recid#">#results.col45#</A>
                                            </cfif>


                                            <cfif #results.col45# is not "Implemented">
                                                #results.col45#
                                            </cfif>

                                        </td>
                                        <td>#results.col5#</td>
                                        <td>#results.col6#</td>
                                        <td>#results.col7#</td>
                                </cfoutput>

                                <td>
                                    
                                    


                    
                
                            <cfif #ticketme.recordcount# is "1">
                
                 <cfoutput>
                                <cfif #ticketme.teststatus# is "Approved">
                               <a href="" title="#ticketme.recordname#"> <i class="mdi mdi-thumb-up" style="color:green;"></i></a>
                                    
                                    <cfelse>
                                    <a href="##" title="#ticketme.recordname#<cfif #ticketme.rejectnotes# is not "">#ticketme.rejectnotes#</cfif>"> <i class="mdi mdi-thumb-down"  style="color: red;"></i></a>
                                
                                </cfif>
                                
                                
                           </cfoutput>
                
                
                </cfif>
                                
                                 <cfif #ticketme.recordcount# is "0">
                                      <a href="" title="Me"> <i class="mdi mdi-thumb-up" style="color:lightgrey;"></i></a>
                                     
                                </cfif>
                        
                      <Cfloop query="ticketusers">
                            <cfoutput>
                                <cfif #ticketusers.teststatus# is "Approved">
                               <a href="##" title="#ticketusers.recordname#"> <i class="mdi mdi-thumb-up" style="color:darkseagreen;"></i></a>
                                    
                                    <cfelse>
                                    <a href="##" title="#ticketusers.recordname#<cfif #ticketusers.rejectnotes# is not "">#ticketusers.rejectnotes#</cfif>"> <i class="mdi mdi-thumb-down"  style="color: darkred;"></i></a>
                                
                                </cfif>
                                
                                
                           </cfoutput>
                            
                            
                            </Cfloop>  
                        
                        
                        
                        </td>
                  

                       
                                </tr>


                            </Cfloop>

                        </tbody>
                    </table>


                </div>

                <!-- end card body-->
            </div> <!-- end card -->


        </div><!-- end col-->
    </div>


    <SCRIPT>
        $(document).ready(function() {
            $("#basic-datatable").DataTable({
                columnDefs: [{
                        targets: [0, 1, 2, 3, 4, 5, 6],
                        searchable: true,
                        visible: true
                    }

                ],
                "iDisplayLength": 100,



                language: {
                    paginate: {
                        previous: "<i class='mdi mdi-chevron-left'>",
                        next: "<i class='mdi mdi-chevron-right'>"
                    }
                },
                drawCallback: function() {
                    $(".dataTables_paginate > .pagination").addClass("pagination-rounded")
                }
            });
            var a = $("#datatable-buttons").DataTable({

                lengthChange: !1,
                buttons: [{
                    extend: "copy",
                    className: "btn-light"
                }, {
                    extend: "print",
                    className: "btn-light"
                }, {
                    extend: "pdf",
                    className: "btn-light"
                }],
                language: {
                    paginate: {
                        previous: "<i class='mdi mdi-chevron-left'>",
                        next: "<i class='mdi mdi-chevron-right'>"
                    }
                },
                drawCallback: function() {
                    $(".dataTables_paginate > .pagination").addClass("pagination-rounded")
                }
            });

        });
    </SCRIPT>


</cfif>




<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />