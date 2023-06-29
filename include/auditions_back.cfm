    <script>
    $(document).ready(function() {
        $("#remoteaudadd").on("show.bs.modal", function(event) {
            // Place the returned HTML into the selected element
            $(this).find(".modal-body").load("/include/remoteaudadd.cfm?userid=#userid#");
        });
    });

</script>
<div id="remoteaudadd" class="modal  fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Audition Type</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>

<cfif #userviewtypeid# is "1">
    <cfparam name="view" default="tbl" />
    
    
    <cfelse>
        <cfparam name="view" default="glry" />
</cfif>


<style>
    .card img {
        border-top-right-radius: 0;
        border-bottom-left-radius: calc(0.25rem - 1px);
    }

</style>
<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="audsteps_sel" datasource="#dsn#">
    SELECT audstepid as id, audstep AS name

    FROM audsteps

    WHERE audstepid IN

    (SELECT audstepid
    FROM auditions
    WHERE userid = #userid# AND isdeleted IS FALSE)

    ORDER BY audstep
</cfquery>

<cfquery name="audtypes_sel" datasource="#dsn#">
    SELECT distinct audtype as id, audtype AS name

    FROM audtypes

    WHERE audtype IN

    (SELECT t.audtype
    FROM events a inner join audtypes t on t.audtypeid = a.audtypeid
    WHERE a.userid = #userid# AND a.isdeleted IS FALSE)

    ORDER BY audtype
</cfquery>



<div class="container px-1">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">










                    <cfset i=0>





                        <form action="/app/auditions/">
                            
                            <cfoutput>
                            <input type="hidden" name="view" value="#view#" />
                            
                            </cfoutput>
                            <div class="row">
                                <div class="col-lg-2 pb-3">
                                    <a href="" class="btn btn-primary waves-effect waves-light"   data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteaudadd" data-bs-placement="top" title="Add Audition" data-bs-original-title="Add Audition">Add Audition</a>
                                </div>


                                <div class="col-lg-2 pb-3">

                                    <select id="audstepid" name="sel_audstepid" class="form-control" onchange="this.form.submit()">

                                        <option value="x">All stages</option>

                                        <cfoutput query="audsteps_sel">

                                            <option value="#id#" <cfif #id# is "#sel_audstepid#"> selected </cfif>>#name#</option>

                                        </cfoutput>

                                    </select>

                                </div>

                                <div class="col-lg-2 pb-3">
                                    <select id="audtype" name="sel_audtype" class="form-control" onchange="this.form.submit()">
                                        <option value="x">All types</option>

                                        <cfoutput query="audtypes_sel">

                                            <option value="#id#" <cfif #id# is "#sel_audtype#"> selected </cfif>>#name#</option>


                                        </cfoutput>
                                    </select>
                                </div>



                                <div class="col-lg-2 pb-3">
                                    <select id="auddate" name="auddate" class="form-control" onchange="this.form.submit()">
                                        <option value="x" <cfif #auddate# is "x"> selected </cfif>>All Dates</option>
                                        <option value="future" <cfif #auddate# is "future"> selected </cfif>>Future Dates</option>
                                        <option value="past" <cfif #auddate# is "past"> selected </cfif>>Past Dates</option>




                                    </select>
                                </div>



                                <div class="col-lg-2 pb-3">
                                    <div class="app-search-box dropdown">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="audsearch" value="<cfoutput>#audsearch#</cfoutput>" id="audsearch" placeholder="Search..." autocomplete="off">&nbsp;
                                            <div class="input-group-append">
                                                <button class="btn btn-xs btn-primary waves-effect waves-light" id="mybtn" style="height:100%;" type="submit">
                                                    <i class="fe-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2   d-flex"> <span class="float-right">

                                        <Cfif #view# is "tbl">
                                            <cfset table_button="btn-secondary" />
                                            <cfset gallery_button="btn-outline-secondary" />
                                        </Cfif>

                                        <Cfif #view# is "glry">
                                            <cfset table_button="btn-outline-secondary" />
                                            <cfset gallery_button="btn-secondary" />

                                        </Cfif>

                                        <a href="<cfoutput>/app/auditions/?sel_audstepid=#sel_audstepid#&sel_audtype=#sel_audtype#&auddate=#auddate#&audsearch=#audsearch#&view=tbl" class="btn btn-xs #table_button# waves-effect waves-light</cfoutput>"><i class="mdi mdi-menu fa-2x"></i></a>
                                        &nbsp;

                                        <a href="<cfoutput>/app/auditions/?sel_audstepid=#sel_audstepid#&sel_audtype=#sel_audtype#&auddate=#auddate#&audsearch=#audsearch#&view=glry" class="btn btn-xs #gallery_button# waves-effect waves-light</cfoutput>"> <i class="mdi mdi-drag  fa-2x"></i></a>

                                    </span>

                                </div>


                            </div>
                        </form>
                </div>

            </div>
            <div class="row">

                <cfif #view# is "glry">

                    <cfloop query="results">
                        <cfoutput>
                            <cfset i=#i# + 1 />
                            <div class="col-lg-4 ">
                                <div class="card ribbon-box border-secondary">

                                    <cfif #isdefined('sdfdsfsdf')#>

                                        <div class="ribbon-two ribbon-two-success"><span>Booked</span></div>
                                    </cfif>


                                    <div class="card-header text-white bg-secondary  d-flex" style="font-size:16px;">
                                        <center> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;#results.col2#</center>
                                        <span class="ms-auto text-light"> <a href="/app/audition/?audprojectid=#audprojectid#&eventid=#results.recid#" class="btn btn-xs btn-primary waves-effect waves-light"><i class="mdi mdi-eye-outline"></i></a></span>
                                    </div>








                                    <div class="row g-0">
                                        <div class="col-md-4 p-2">
                                            <cfif #isdefined('option1')#>
                                                <center><img src="/media-dev/dates/#DateFormat('#results.col1#','yyyy-mm-dd')#.png" style="max-width:75px;" alt="..."></center><BR>
                                                <center>#DateFormat('#results.col1#','yyyy')#</center>
                                        </div>
                </cfif>

                <a href="" title="#DateFormat('#results.col1#','long')# at #timeformat('#results.eventStartTime#')#">
                    <img src="/media-dev/dates/#DateFormat('#results.col1#','yyyy-mm-dd')#.png" style="max-width:75px;" alt="...">
                </a>
            </div>

            <div class="col-md-8">
                <div class="card-body">

                    <cfif #results.audstep# is not "audition">
                        <div class="ribbon ribbon-#results.stepcss# float-end"><i class="mdi mdi-access-point me-1"></i> #results.audstep#</div>
                    </cfif>
                    
                    
                            
                                  
                                  
                        
                        
                        
                        
                    
                    
                    
                    <cfif #results.col5# is not "">

                       <h5 class="card-title">
                           #results.col5#  
                        </h5>

                        <cfelse>
                            <h5 class="card-title">Role: TBD</h5>
                    </cfif>
                        
                        
                        
                                  <button type="button" class="btn btn-xs btn-soft-secondary rounded-pill waves-effect">#results.col4#</button> 

               
                        
                        
                        
                             <p class="card-text"><small class="text-muted">Source: <cfif #results.col3# is not "">#results.col3#<cfelse>TBD</cfif></small></p>
                        
                        
          



                </div>
            </div>










        </div>
    </div> <!-- end card-->
</div> <!-- end col -->
<cfif #i# is "3">
    </div>
    <div class="row">
        <cfset i=0>
</cfif>

</cfoutput>
</cfloop>

</cfif>

<cfif #view# is "tbl">




<div class="container">
 <div class="card pb-3">
<div class="card-body">

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
                        <th width="50">Action</th>




                        <th>#results.head1#</th>
                        
                         <th>Status</th>
                        <th>#results.head2#</th>
                        <th>#results.head3#</th>
                        <th>#results.head4#</th>
                        <th>#results.head5#</th>

                    </tr>
                </cfoutput>
            </cfloop>
        </thead>
        <tbody>
            <cfloop query="results">



                <cfoutput>


                    <tr>

                        <td>

<a href="/app/audition/?eventid=#results.recid#" class="btn btn-xs btn-primary waves-effect waves-light"><i class="mdi mdi-eye-outline"></i></a>
 
                        </td>


                        <td style="word-break: break-all;">    #dateformat('#results.col1#','MM-dd-YYYY')#  </td>
            <td style="word-break: break-all;"> </td>             
 <td style="word-break: break-all;">#results.col2#</td>
 <td style="word-break: break-all;">#results.col3#</td>
 <td style="word-break: break-all;"><button type="button" class="btn btn-xs btn-soft-secondary rounded-pill waves-effect">#results.col4#</button></td>
 <td style="word-break: break-all;">#results.col5#</td>
                    </tr>


                </cfoutput>
                
            </cfloop>


        </tbody>

    </table>

</div>
</div>
</div>


    <SCRIPT>
        $(document).ready(function() {
            $("#basic-datatable").DataTable({
"bFilter":false, "dom": 'rtip',

                "pageLength": 100,
                responsive: true,
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




</div>
<!-- end card body-->
</div> <!-- end card -->
</div><!-- end col-->
</div>


</div>

<!-- Default bootstrap modal example -->

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />
