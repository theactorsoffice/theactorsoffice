<cfinclude template="/include/qry/aud_questions.cfm" />
<cfif #questions.recordcount# is "0">
    
 

<cfquery datasource="#dsn#" name="x">
    SELECT * FROM audquestions_user WHERE userid = #userid#
</cfquery>

<cfloop query="x">

    <cfquery datasource="#dsn#" name="insert">
        INSERT INTO `audanswers` (`qid`, `audid`)
        VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#x.qid#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#audid#">);
    </cfquery>

</cfloop>
        
        

<cfinclude template="/include/qry/aud_questions.cfm" />
</cfif>


<form action="/include/remoteassformUpdate.cfm" method="post" class="parsley-examples" id="remoteass" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <cfoutput>
        <input type="hidden" name="audid" value="#audid#">
 <input type="hidden" name="audprojectid" value="#audprojectid#">

    </cfoutput>


    <div class="row" />

    <cfloop query="questions">
        <cfoutput>
            <div class="form-group col-md-12 p-1">
                <label for="q#questions.qid#">#questions.qtext#</label>

                <cfif #questions.qtype# is "rating">

                    <select id="q#questions.qid#" name="q#questions.qid#">


                        <option value="0"></option>

                        <option value="1" <cfif #questions.aRating# is "1"> Selected
                </cfif>>1</option>

                <option value="2" <cfif #questions.aRating# is "2"> Selected
                    </cfif>>2</option>

                <option value="3" <cfif #questions.aRating# is "3"> Selected
                    </cfif>>3</option>

                <option value="4" <cfif #questions.aRating# is "4"> Selected
                    </cfif>>4</option>

                <option value="5" <cfif #questions.aRating# is "5"> Selected
                    </cfif>>5</option>
                </select>
                </cfif>

            </div>

            <cfif #questions.qtype# is "text">
                <div class="form-group col-md-12 pt-0 pb-3">

                    <input class="form-control" type="text" id="q#questions.qid#" value="#questions.atext#" name="q#questions.qid#">

                </div>
            </cfif>

            <cfif #questions.qtype# is "long">
                <div class="form-group col-md-12 pt-0 pb-3">


                    <textarea class="form-control" type="text" id="q#questions.qid#"  name="q#questions.qid#" rows="4" required>#questions.amemo#</textarea>
                </div>
            </cfif>



        </cfoutput>
    </cfloop>




    <div class="form-group text-center col-md-12">
        <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: #406e8e;">Submit</button>
    </div>



    </div>
</form>

<script>
    $(document).ready(function() {
        $(".parsley-examples").parsley()
    });

</script>
