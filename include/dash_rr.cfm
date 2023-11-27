<cfinclude template="/include/qry/notsactivedash.cfm" />

<style>
    .input-xs,
    select.input-xs {
        height: 24px;
        line-height: 24px;
    }

</style>

<script type="text/javascript">
    $(document).ready(function() {
        $('#submit-button input:checkbox').change(function() {
            var a = $('#submit-button input:checked').filter(":checked").length;
            if (a == 0) {
                $('.btn').prop('disabled', true);
            } else {
                $('.btn').prop('disabled', false);
            }
        });
    });
</script>

<cfoutput>

<div class="card grid-item loaded" data-id="#dashboards.pnid#" >

    <div class="card-header" id="heading_system_#dashboards.currentrow#">

        <h5 class="m-0">

            <a class="text-dark collapsed" data-bs-toggle="collapse"  href="##collapse_system_#dashboards.currentrow#"  >

                #dashboards.pnTitle# 
                (#numberformat(notsActives.recordcount)#)
 
            </a>

        </h5>

    </div>

</cfoutput>

    <div class="card-body">

<form action="/app/dashboard_new/" method="post" id="submit-button">

    <div class="row">

        <div class="col-md-12 d-flex" style="padding-bottom:10px; margin-bottom:10px;">

            <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" name="batchtype" value="complete" style="width:85px;background-color: #406e8e; border: #406e8e;" >Complete</button>

            <input type="hidden" name="pgaction" value="batch" />

      
<span style="margin-left:3px;">
                <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" name="batchtype" value="skip" style="width:85px;color:black;background-color: #DECE8E; border: #d2bd67;" >Skip</button>

         </span>

        </div>
        
        <cfif #notsactive.recordcount# is not "0">

        <cfloop query="notsactive">

            <cfoutput>

                <div class="col-md-12" style="padding-bottom:5px;">

                    <strong>#notsactive.recordname#</strong> <A href="/app/contact?contactid=#notsactive.contactid#&t4=1"><i class="mdi mdi-eye-outline"></i></A> <BR>



                    <cfif #batchlist# contains "#notsactive.notid#">

                        <input type="checkbox" class="custom-control-input" value="#notsactive.notid#" checked name="batchlist" style="margin-left:5px;" />

                        <cfelse>

                            <input type="checkbox" class="custom-control-input" value="#notsactive.notid#" name="batchlist" style="margin-left:5px;" />

                    </cfif>

                    <span class="custom-control-label"><small>#notsActive.actiondetails#</small></span>




                </div>

            </cfoutput>



        </cfloop>
                
                <cfelse>
                    
                         <div class="col-md-12" style="padding-bottom:5px;">
                            <center><small>You currently have no reminders!</small></center> 
                             
                    </div>
                
                </cfif>
            
            

    </div>

</form>



</div><!--card-body end -->
    
    
</div><!--end card -->


