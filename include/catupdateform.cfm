<cfset dbug = "N" />

<cfinclude template="/include/qry/audcategories_sel.cfm" />
<cfinclude template="/include/qry/audsubcategories_sel.cfm" />
<cfquery name="auditionprojectDetails" datasource="#dsn#">
SELECT 
a.audprojectid,
a.projname,
a.projDescription,
a.userid,
a.audSubCatID,
a2.audcatid,
a.unionid,
a.networkID,
a.toneid,
a.contracttypeid,
a.isdeleted,
a.contactid,
a.recordname
 
FROM audprojects a 
	LEFT OUTER JOIN audnetworks a1 ON ( a.`networkID` = a1.networkid  )  
	LEFT OUTER JOIN audsubcategories a2 ON ( a.`audSubCatID` = a2.`audSubCatId`  )  
	LEFT OUTER JOIN audunions a3 ON ( a.`unionID` = a3.`unionID`  )  
	LEFT OUTER JOIN audroles a4 ON ( a.`audprojectID` = a4.`audprojectID`  )  
   
WHERE  a.audprojectid = #audprojectid#
</cfquery>

<cfset dbug = "N" />
     <script src="/app/assets/js/jquery.chained.js"></script>
<p>Enter the information below and press the update button to continue.</p>
<form action="/include/catupdateform2.cfm" method="post"  class="parsley-examples" name="event-form" id="form-event"  data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden"
  data-parsley-trigger="keyup" data-parsley-validate>
<cfoutput> 
   <input type="hidden" name="audprojectid" value="#audprojectid#" />
        <input type="hidden" name="new_userid" value="#userid#" />
    <input type="hidden" name="new_audprojectid" value="#audprojectid#" />
       <input type="hidden" name="secid" value="#secid#" />
</cfoutput>
    <div class="row" />

    <div class="form-group col-md-6 col-sm-12">

        <label for="audcatid">Category<span class="text-danger">*</span></label>

        <select id="audcatid" class="form-control" name="new_audcatid" data-parsley-required data-parsley-error-message="Category is required">
            <option value="">--</option>
            <cfoutput query="audcategories_sel">
                
                     <cfif #auditionprojectDetails.audcatid# is "#audcategories_sel.id#">
                       <option value="#audcategories_sel.id#" Selected >#audcategories_sel.name#</option>
                    <Cfelse>
                <option value="#audcategories_sel.id#"   >#audcategories_sel.name#</option>
          
                    </Cfif>
                         
                         
     
            </cfoutput>
        </select>

    </div>


    <div class="form-group col-md-6 col-sm-12">
        <label for="new_audsubcatid">Subcategory<span class="text-danger">*</span></label>

        <select id="new_audsubcatid" name="new_audsubcatid" class="form-control" data-parsley-required data-parsley-error-message="Subcategory is required">
            <option value="">--</option>

            <cfoutput query="audsubcategories_sel">
                <cfif #auditionprojectDetails.audsubcatid# is "#audsubcategories_sel.id#">
                       <option value="#audsubcategories_sel.id#" Selected  data-chained="#audsubcategories_sel.audcatid#">#audsubcategories_sel.name#</option>
                    <Cfelse>
                <option value="#audsubcategories_sel.id#"   data-chained="#audsubcategories_sel.audcatid#">#audsubcategories_sel.name#</option>
          
                    </Cfif>
                                                                                                                        
             </cfoutput>

        </select>


    </div>


    <div class="form-group text-center  col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;" type="submit">Update</button>
    </div>

    </div>
</form>
        
            <script src="/app/assets/js/libs/parsleyjs/parsley.min.js"></script>

  <script>$("#new_audsubcatid").chained("#audcatid");</script>
 