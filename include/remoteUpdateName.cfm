<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="pronouns" datasource="#dsn#">
    SELECT genderPronoun FROM genderpronouns_users where userid = #userid#
</cfquery>



<cfquery name="details" datasource="#dsn#">
    SELECT * from contactdetails where contactid = #contactid#
</cfquery>


<form action="/include/remoteUpdateNameUpdate.cfm" method="post" class="parsley-examples" id="profile-form" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <cfoutput>

        <input type="hidden" name="contactid" value="#details.contactid#">
    </cfoutput>


    <div class="row" />




    <cfoutput>




        <div class="form-group col-md-6">
            <label for="contactFirst">First Name<span class="text-danger">*</span></label>
            
            <cfif #details.Contactfirst# is "Unknown">
                
                        <input class="form-control" type="text" id="contactFirst" name="contactFirst" value="" data-parsley-maxlength="50" data-parsley-maxlength-message="Max length 50 characters" data-parsley-required data-parsley-error-message="Valid First Name is required" placeholder="Enter First Name">

            
            </cfif>
            
            <cfif #details.Contactfirst# is not "Unknown">

            <input class="form-control" type="text" id="contactFirst" name="contactFirst" value="#details.contactFirst#" data-parsley-maxlength="50" data-parsley-maxlength-message="Max length 50 characters" data-parsley-required data-parsley-error-message="Valid First Name is required" placeholder="Enter First Name">

            </cfif>

        </div>




        <div class="form-group col-md-6">
            <label for="contactFirst">Last Name<span class="text-danger">*</span></label>

            <input class="form-control" type="text" id="contactLast" name="contactLast" value="#details.contactLast#" data-parsley-maxlength="50" data-parsley-maxlength-message="Max length 50 characters" data-parsley-required data-parsley-error-message="Valid Last Name is required" placeholder="Enter Last  Name">


        </div>



        <div class="form-group col-md-6">
            <label for="contactFirst">Suffix (Jr, II, etc.)</label>

            <input class="form-control" type="text" id="contactSuffix" name="contactSuffix" value="#details.contactSuffix#" placeholder="Enter Suffix">


        </div>








        <div class="form-group col-sm-6 mb-6">
            <label for="simpleinput">Next Birthday</label>


            <input class="form-control" id="contactbirthday" value="#details.contactbirthday#" type="date" name="contactbirthday">

        </div>









        <div class="form-group col-sm-6 mb-6">
            <label for="simpleinput">Initial Meeting Date</label>


            <input class="form-control" id="contactmeetingdate" value="#details.contactmeetingdate#" type="date" name="contactmeetingdate">
        </div>



        <div class="form-group col-sm-6 mb-6">
            <label for="contactmeetingloc">Initial Meeting Location</label>


            <input class="form-control" id="contactmeetingloc" type="text" name="contactmeetingloc" value="#details.contactmeetingloc#">
        </div>



    </cfoutput>

    <div class="form-group col-sm-6 mb-6">


        <label for="contactPronoun">Gender Pronoun</label>

        <select id="contactPronoun" name="contactPronoun" class="form-control" onchange="if (this.value=='custom'){this.form['custom'].style.visibility='visible',this.form['custom'].required=true}else {this.form['custom'].style.visibility='hidden',this.form['custom'].required=false};">


            <option value="">Select a Pronoun</option>
            <cfoutput query="pronouns">
                <option value="#pronouns.genderPronoun#" <cfif #pronouns.genderPronoun# is "#details.contactPronoun#"> Selected</cfif>>#pronouns.genderPronoun#</option>


            </cfoutput>
    <option value="custom">Custom</option>
        </select>



    </div>

    <div class="form-group col-sm-6 mb-6">
        

        
 <div class="input-group">
<input class="form-control" type="text"  name="custom" id="custom" style="visibility:hidden;"   data-parsley-maxlength="50"  placeholder="Add a Gender Pronoun in single/plural format.">
       

 


      

 


    </div>


<input type="hidden" name="deleteitem" value="0" />




    <div class="form-group text-center col-md-12">
        <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: #406e8e;">Update</button>
    </div>



    </div>
</form>
<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley()
    });

</script>





<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
<cfinclude template="/include/bigbrotherinclude.cfm" />
