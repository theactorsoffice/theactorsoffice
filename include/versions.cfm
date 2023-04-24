 


<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Versions</h4>
                <p class="text-muted font-13 mb-4">
                </p>
                <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead>
                        <cfloop query="results"  endrow="1">
                            <cfoutput>
                                <cfif (Results.CurrentRow MOD 2) >
                                    <Cfset rowtype="Odd" />
                                    <cfelse>
                                        <Cfset rowtype="Even" />
                                </cfif>


                                <tr class="#rowtype#">
                               
                                    <th>#head1# </th>
                                    <th>#head2#</th>
                                    <th>#head3#</th>
                                    <th>#head4#</th>
                                  <th>#head5#</th>
                                    <th>#head6#</th>
                          
                                </tr>
                            </cfoutput>
                        </cfloop>
                    </thead>
                    <tbody>
                        <cfloop query="results">

<cfif #results.isActive# is "1">
            <cfset verweight = "700">
                
                <cfelse>
                    
                <cfset verweight = "400">      
                            
                            </cfif>

                                    <cfoutput>
 

                                            <tr>
                                                
                                     
                                                <td style="font-weight:#verweight#;">
                                                    
                                   <A HREF="/app/version/?recid=#results.verid#">#results.col1#</A>
                                                
                                                
                                                
                                                </td>
                                                     <td style="font-weight:#verweight#;">#Dateformat("#results.col2#","mmm-dd-yyyy")#</td>
                                <td style="font-weight:#verweight#;">#DateFormat("#results.col3#","mmm-dd-yyyy")#</td>
                                                
                                       
                                                <td style="font-weight:#verweight#;">#results.col4#</td>
                                         
                                                <td style="font-weight:#verweight#;">#results.col5#</td>
                                 <td style="font-weight:#verweight#;">
                                     #numberformat(results.col6,9.99)#
                                     
                                  </td>
                                            </tr>
                                        
                                      
                                        
                                        
                                        
                                        
                                        
                                        
                                            
                                    </cfoutput>
                        </cfloop>
                        
                
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


<!-- Default bootstrap modal example -->

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
