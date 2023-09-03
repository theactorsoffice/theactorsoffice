<script>
function unlock(){
    document.getElementById('buttonSubmit').removeAttribute("disabled");
}
</script>
<cfinclude template="/include/qry/auditionsimport.cfm" />

<cfparam name="step" default="1" />

<cfif #isdefined('uploadid')#>
   <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="upload_details"      >
    select contactid from contactsimport where uploadid = #uploadid# and status = 'Added'
    </cfquery>
    
    <cfset conlist = valuelist(upload_details.contactid) />
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="results"      >
SELECT d.contactid,
'Name' as 'head1',
'Tags' as 'head2',
'Phone' as 'head3',
'Email' as 'head4',
'Company' as 'head5',
'Status' as 'head6',
        c.status,
d.contactfullname AS col1
,(SELECT GROUP_CONCAT(CONCAT("<span class='badge badge-blue'>",valueText,"</span>") separator ' ')
			FROM contactitems 
			WHERE valueCategory = 'Tag' 
			AND contactID = d.ContactID AND itemstatus = 'Active' LIMIT 1) AS col2

,   (SELECT valueText 
			FROM contactitems 
			WHERE valueCategory = 'Phone'
			AND contactID = d.ContactID AND itemstatus = 'Active' limit 1) AS col3
			
,   (SELECT valueText 
			FROM contactitems 
			WHERE valueCategory = 'Email' 
			AND contactID = d.ContactID AND itemstatus = 'Active' limit 1) AS col4	
			
			
,   (SELECT valueCompany
			FROM contactitems 
			WHERE  contactID = d.ContactID and valueCategory = 'Company' and itemstatus = 'active' limit 1) AS col5
				
FROM contactdetails d
        inner join contactsimport c on c.contactid = d.contactid

WHERE d.contactStatus = 'Active' and d.userid = <Cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER" />
    
 
    
    
    and c.uploadid = #uploadid#
  
	
ORDER BY d.contactfullname
</cfquery>


<h6><cfoutput>#results.recordcount# relationship contacts were imported. Click on a name to view details.</cfoutput></h6>
  <table id="basic-datatable" class="table display dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead>
                        <cfoutput query="results" maxrows="1">

                            <cfif (Results.CurrentRow MOD 2)>
                                <Cfset rowtype="Odd" />
                                <cfelse>
                                    <Cfset rowtype="Even" />
                            </cfif>


                            <tr class="#rowtype#">
                                <th>#head1#</th>
                                <th>#head2#</th>
                                <th>#head3#</th>
                                <th>#head4#</th>
                                <th>#head5#</th>
                                     <th>#head6#</th>

                            </tr>
                        </cfoutput>
                    </thead>
                    <tbody>
                        <cfloop query="results">

<cfset phonenumber = results.col3 />
                    
<cfset cleanPhoneNumber = reReplace(phoneNumber, "[^0-9]", "", "ALL")>
    
<cfif "#len(cleanPhoneNumber)#" is "10">
 
    <cfoutput>
    <cfset formatPhoneNumber = "(#left(cleanPhoneNumber, 3)#) #mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" />
    <cfset anchorPhoneNumber = "#left(cleanPhoneNumber, 3)#-#mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" />
        
        </cfoutput>
        
<cfelse>
    <Cfoutput>
    <cfset formatPhoneNumber = "#phoneNumber#*" /> 
    <cfset anchorPhoneNumber = "#cleanPhoneNumber#*" /> 
        </Cfoutput>
    </cfif>
        
        
            
                    

                            <cfoutput>



                                <cfset cur_link="/app/contact/index.cfm?contactid=#results.contactid#" />



                                <tr role="row">
                                    <td>

                                        <a href="#cur_link#" class="text-body font-weight-semibold">

                                            #results.col1#

                                        </a>
                                    </td>
                                    <td>#col2#</td>
                                    <td><a href="tel:#anchorPhoneNumber#">#formatPhoneNumber#</a></td>
                                    <td>#col4#</td>
                                    <td>#col5#</td>
                                    <td><cfif #status# is not "Added"><font color="red"></cfif>#status#<cfif #status# is not "Added"></font></cfif></td>

                                </tr>
                            </cfoutput>
                        </cfloop>
                    </tbody>
                </table>
     








<cfelse>

    
    
                  <div class="row">

    <div class="col-12">

        <div class="card">

            <div class="card-body">
                
                
                
 
<h5>Step One: Import Template</h5>    
          
<p>Download the <A href="/include/ImportTemplate2.xlsx" target="new"><strong><i class="fe-upload"></i> Import Template</strong></A> to copy and paste all the contacts you'd like to import. <strong>Imports must be in this format.</strong></p>
        
        
             <cfif #isdefined('dsfdsfdfs')#>
<A href="/include/Sample.xlsx" target="new"><button  class="btn btn-xs btn-primary waves-effect mb-2 waves-light" >Download</button></A>    </cfif>
 
 
<p></p><p></p><p></p><p></p>

    <h5>Step Two: Upload Template</h5>   
    <p>Once you've populated and saved the Import Template as an .xlsx file, select the file and upload.</p>
                        
                        
                        
                        

                <form action="/include/upload.cfm" method="post" enctype="multipart/form-data" id="upload" >
    
    <cfoutput>

    <input type="hidden" name="userid" value="#userid#" />

    </cfoutput>


    <input name="file" onchange="unlock();" type="file"  />
<p></p><p></p><p></p>
    <input type="submit" value="Upload" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e" id="buttonSubmit" disabled >
                                        
</form>   
               
            
               
               
                        
                        
                        
                        
                  
 

<div class="dropzone-previews mt-3" id="file-previews"></div>  
 

</cfif>




        </div></div>    
                        
                        
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
                            <th width="50">Total Import</th>
                            <th>Batch ID</th>
                            <th>Date</th>
                            <th>Time</th>
            
                        </tr>


                    </thead>

                    <tbody>
                        <cfloop query="imports">



                            <cfoutput>



                                <TR>
                                    <TD><a title="View" href="/app/contacts/?byimport=#imports.uploadid#">#imports.total_adds#</i></a></TD>
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

        
        
        
        
        
     
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
