<div class="row">

    <div class="col-12">

        <div class="card">

            <div class="card-body">

                <h4 class="header-title">

                    Import History <span class="small right"></span>

                </h4>

                <div class="d-flex justify-content-between">

                    <div class="float-left">


                        <cfoutput>

                            <p> You have <strong>#imports.recordcount#</strong> imports.

                            </p>

                        </cfoutput>

                    </div>

                </div>




                <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead>



                        <tr class="#rowtype#">
                            <th width="50">Total Imported</th>
                            <th>Batch ID</th>
                            <th>Date</th>
                            <th>Time</th>
          
                        </tr>


                    </thead>

                    <tbody>
                        <cfloop query="imports">



                            <cfoutput>



                                <TR>
                                    <TD><a title="View" href="/app/contacts/?byimport=#imports.uploadid#">#imports.total_adds#</a></TD>
                                    <TD>#imports.uploadid#</TD>
                                    <TD>#dateformat(imports.timestamp)#</TD>
                                    <TD>#timeformat(imports.timestamp)#</TD>
                             
                                </TR>

                            </cfoutput>

                        </cfloop>

                    </tbody>
                </table>

            </div>
        </div>










        <script>
            $(document).ready(function() {
                $("#basic-datatable").DataTable({


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

        </script>

        
        
        
        
        
