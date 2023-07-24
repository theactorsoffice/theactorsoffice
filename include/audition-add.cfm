<!-- Set default parameters -->
<cfparam name="rcontactid" default="0" />
<cfparam name="isdirect" default="0" />
<!-- Define CSS styles -->
<style>
    #hidden_divs,
    #hidden_divss,
    #hidden_divsss,
    #hidden_divssss {
        display: none;
    }
    .output {
        font: 1rem 'Fira Sans', sans-serif;
    }
    fieldset {
        display: block;
        margin-inline-start: 1px;
        margin-inline-end: 1px;
        padding-block-start: 0.35em;
        padding-inline-start: 0.75em;
        padding-inline-end: 0.75em;
        padding-block-end: 0.625em;
        min-inline-size: min-content;
        border-width: 2px;
        border-style: groove;
        border-color: #ced4da;
        border-style: solid border-image: initial;
    }
</style>

<!-- Set debug variable -->
<cfset dbug="N" />

<!-- Include necessary templates -->
<cfinclude template="/include/remote_load.cfm" />
<cfinclude template="/include/qry/audplatforms_user_sel.cfm" />
<cfinclude template="/include/qry/FindUser.cfm" />
<cfinclude template="/include/qry/countries.cfm" />
<cfinclude template="/include/qry/regions.cfm" />
<cfinclude template="/include/qry/cities.cfm" />

<!-- Query to get categories and subcategories -->
<cfquery name="cat" datasource="#dsn#">
    SELECT c.audcatid,c.audcatname,s.audsubcatid,s.audsubcatname
    FROM audcategories c
    INNER JOIN audsubcategories s ON s.audcatid = c.audcatid
    WHERE s.audsubcatid = #new_audsubcatid#
</cfquery>

<!-- Set new category ID -->
<cfset new_audcatid=cat.audcatid />

<!-- Query to get role types -->
<cfquery name="audroletypes_sel" datasource="#dsn#">
    SELECT audroletypeid AS `id`,audroletype AS `name`
    FROM audroletypes
    WHERE audcatid = #cat.audcatid# AND isdeleted IS false
</cfquery>

<!-- Query to get types -->
<cfquery name="audtypes_sel" datasource="#dsn#">
    SELECT audtypeid as id,audtype as name,audcategories
    FROM audtypes
    WHERE isdeleted = 0 and audcategories like '%#cat.audcatid#%'
    ORDER BY audtype
</cfquery>

<!-- Query to get casting types -->
<cfquery name="casting_types" datasource="#dsn#">
    SELECT tagid AS id,tagname AS name
    FROM tags_user
    WHERE iscasting IS TRUE AND userid = #userid# AND isdeleted = 0
    ORDER BY tagname
</cfquery>

<!-- Include casting directors template -->
<cfinclude template="/include/qry/castingdirectors_sel.cfm">

    <!-- Check if direct -->
    <cfif #isdirect# is "1">
        <style>
            #hidedirectbooking {
                display: none;
            }

            .input {
                margin: 0 auto;
            }
        </style>
    </cfif>

    <!-- Define more CSS styles -->
    <style>
        #hidden_div {
            display: none;
        }

        .input {
            margin: 0 auto;
        }
    </style>

    <!-- Start of form -->
    <div class="row">
        <div class="col-xl-6 col-lg-8 col-md-12">
            <div class="card">
                <div class="card-body">
                    <form method="post" action="/include/audition-add2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>

                        <!-- Hidden form inputs -->
                        <cfoutput>
                            <input type="hidden" name="new_audStepID" value="1">
                            <input type="hidden" name="new_audcatid" value="#cat.audcatid#">
                            <input type="hidden" name="new_audsubcatid" value="#cat.audsubcatid#">
                            <input type="hidden" name="new_userid" value="#session.userid#">
                            <input type="hidden" name="isdirect" value="#isdirect#">
                        </cfoutput>

                        <!-- Check if direct -->
                        <cfif #isdirect# is "1">
                            <h4 class="col-md-12">Direct Booking</h4>
                        </cfif>

                        <!-- Display category -->
                        <h4 class="col-md-12">
                            <cfoutput>Category: #cat.audcatname# - #cat.audsubcatname#</cfoutput>
                        </h4>

                        <!-- Start of form fields -->
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="new_projname">Project Name (Title)<span class="text-danger">*</span></label>
                                <input class="form-control" type="text" id="new_projname" autocomplete="off" required data-parsley-required data-parsley-error-message="Project Name is required" name="new_projname" placeholder="Project Name">
                            </div>

                            <div class="form-group col-md-12">
                                <label for="new_projDescription">Project Description/Logline<span class="text-danger">*</span></label>
                                <input class="form-control" type="text" id="new_projDescription" data-parsley-required data-parsley- name="new_projDescription" error-message="Project Description is required" placeholder="Project Description">
                            </div>

                            <!-- JavaScript functions to show/hide divs -->
                            <script>
                                function showDivss(divId, element) {
                                    document.getElementById(divId).style.display = element.value == 1 ? 'block' : 'none';
                                }
                            </script>
                            <script>
                                function showDivs(divId, element) {
                                    document.getElementById(divId).style.display = element.value == 2 ? 'block' : 'none';
                                }
                            </script>
                            <script>
                                function showDivsss(divId, element) {
                                    document.getElementById(divId).style.display = element.value == 0 ? 'block' : 'none';
                                }
                            </script>
                            <script>
                                function showDivssss(divId, element) {
                                    document.getElementById(divId).style.display = element.value == 0 ? 'block' : 'none';
                                }
                            </script>
                            <script>
                                function showdirectbooking(divId, element) {
                                    document.getElementById(divId).style.display = element.value == 23 ? 'none' : 'block';
                                }
                            </script>

                            <!-- More form fields -->
                            <div id="hidden_divs">
                                <div class="form-group col-md-12">
                                    <!-- Label for Zoom Link -->
                                    <label for="new_eventStart">Zoom Link (optional)</label>
                                    <!-- Input field for Zoom Link -->
                                    <input class="form-control" type="text" id="new_audLocation" autocomplete="off" name="new_audLocation" placeholder="Zoom link">
                                </div>
                                <div class="form-group col-md-12">
                                    <!-- Label for Audition Platform -->
                                    <label for="audplatformid">Audition Platform </label>
                                    <!-- Select field for Audition Platform -->
                                    <select id="audplatformid" name="new_audplatformid" class="form-control">
                                        <option value="">--</option>
                                        <!-- Loop through audplatforms_user_sel query and populate options -->
                                        <cfoutput query="audplatforms_user_sel">
                                            <option value="#audplatforms_user_sel.id#"> #audplatforms_user_sel.name# </option>
                                        </cfoutput>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-md-6 col-sm-12">
                                <!-- Label for Role Name -->
                                <label for="new_audrolename">Role Name <span class="text-danger">*</span></label>
                                <!-- Input field for Role Name -->
                                <input class="form-control" type="text" id="new_audrolename" autocomplete="off" required data-parsley-required data-parsley-error-message="Role Name is required" name="new_audrolename" placeholder="Role Name" />
                            </div>
                            <!-- Check if new_audcatid is 5 -->
                            <CFIF #new_audcatid# IS "5">
                                <!-- If true, set new_audroletypeid to 33 -->
                                <input type="hidden" name="new_audroletypeid" value="33" />
                                <CFELSE>
                                    <!-- If false, display Role Type select field -->
                                    <div class="form-group col-md-6 col-sm-12">
                                        <!-- Label for Role Type -->
                                        <label for="new_audroletypeid">Role Type</label>
                                        <!-- Select field for Role Type -->
                                        <select id="new_audroletypeid" name="new_audroletypeid" class="form-control" data-parsley-required data-parsley-error-message="Role Type is required">
                                            <option value="">--</option>
                                            <!-- Loop through audroletypes_sel query and populate options -->
                                            <cfoutput query="audroletypes_sel">
                                                <option value="#audroletypes_sel.id#">#audroletypes_sel.name#</option>
                                            </cfoutput>
                                        </select>
                            </CFif>
                        </div>

                        <div class="form-group col-md-12">
                            <!-- Label for Casting Director -->
                            <label for="new_contactid">Casting Director </label>
                            <!-- Select field for Casting Director -->
                            <select id="new_contactid" class="form-control" name="new_contactid" onChange="showDivssss('hidden_divssss', this)" data-parsley-required data-parsley-error-message="CD is required">
                                <option value="">--</option>
                                <option value="0">***ADD NEW***</option>
                                <!-- Loop through castingdirectors_sel query and populate options -->
                                <cfoutput query="castingdirectors_sel">
                                    <option value="#castingdirectors_sel.id#">#castingdirectors_sel.name#</option>
                                </cfoutput>
                            </select>
                        </div>

                        <div id="hidden_divssss">
                            <!-- Fieldset for Add New Casting -->
                            <fieldset>
                                <legend>Add New Casting </legend>
                                <div class="row">
                                    <div class="form-group col-md-10">
                                        <!-- Radio button for Casting Director known -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="casting_info" id="casting_director_known" value="casting_director_known" checked />
                                            <label class="form-check-label" for="casting_director_known">
                                                Casting Director known
                                            </label>
                                        </div>
                                        <!-- Radio button for Only company known -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="casting_info" id="only_company_known" value="only_company_known" />
                                            <label class="form-check-label" for="only_company_known">
                                                Only company known
                                            </label>
                                        </div>
                                    </div>
                                    <!-- Input field for Casting Director -->
                                    <div class="form-group col-md-6">
                                        <label for="cdfirstname">Casting Director</label>
                                        <input class="form-control" type="text" id="cdfullname" name="cdfullname" autocomplete="off" placeholder="Casting Director" />
                                        <div id="nameResults"></div>
                                        <div class="invalid-feedback">
                                            Please enter a Casting Director.
                                        </div>
                                    </div>
                                    <!-- Select field for Casting Director Role -->
                                    <div class="form-group col-md-6">
                                        <div id="cdrole">
                                            <label for="cdtype">Casting Director Role<span class="text-danger">*</span></label>
                                            <select id="cdtype" name="cdtype" class="form-control" data-parsley-required data-parsley-error-message="Casting Director Role is required">
                                                <option value="">--</option>
                                                <!-- Loop through casting_types query and populate options -->
                                                <cfoutput query="casting_types">
                                                    <option value="#casting_types.name#">#casting_types.name#</option>
                                                </cfoutput>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- Input field for Casting Company -->
                                <div class="form-group col-md-6">
                                    <label for="cdco">Casting Company</label>
                                    <input class="form-control" type="text" id="companySearch" name="cdco" autocomplete="off" placeholder="Casting Company" />
                                    <div id="results"></div>
                                    <div class="invalid-feedback">
                                        Please enter a Casting Company.
                                    </div>
                                </div>
                            </fieldset>
                        </div>

                        <!-- Styling for fieldset -->
                        <style>
                            .field_set {
                                border-color: #ced4da;
                                border-width: 1px;
                            }
                        </style>

                        <!-- Fieldset for Appointment details -->
                        <fieldset class="answer" id="hidedirectbooking">
                            <legend>Appointment details</legend>
                            <div class="row">
                                <!-- Form fields for appointment details -->
                                <!-- ... -->
                            </div>
                        </fieldset>
                </div>

                <!-- Row for save button -->
                <div class="row mt-2">
                    <div class="">
                        <!-- Back button -->
                        <a href="javascript:history.go(-1)"><button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button></a>
                        <!-- Save button -->
                        <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Add</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>

    <!-- jQuery script to enable parsley validation -->
    <script>
        $(document).ready(function() {
            $(".parsley-examples").parsley()
        });
    </script>

    <!-- jQuery script to chain select fields -->
    <script>
        $("#regionid").chained("#countryid");
        $("#audtypeid").chained("#audcatid");
        $("#new_audroletypeid").chained("#audcatid");
        $("#new_audsubcatid").chained("#audcatid");
    </script>

    <!-- JavaScript function to show or hide div based on checkbox selection -->
    <script>
        function showDiv(divId, element) {
            var checked = document.querySelectorAll('input:checked');
            if (checked.length === 0) {
                document.getElementById(divId).style.display = 'none';
            } else {
                document.getElementById(divId).style.display = 'block';
                $("#divId").prop('required', true);
            }
        }
    </script>

    <!-- JavaScript function to update form inputs based on radio button selection -->
    <script>
        // get references to the radio buttons and the relevant form inputs
        const castingDirectorKnown = document.getElementById('casting_director_known');
        const onlyCompanyKnown = document.getElementById('only_company_known');
        const cdFullNameInput = document.getElementById('cdfullname');
        const cdTypeInput = document.getElementById('cdtype');
        const companySearchInput = document.getElementById('companySearch');
        const cdroleInput = document.getElementById('cdrole');

        // function to update the required status and default value of the form inputs
        function updateFormInputs() {
            if (onlyCompanyKnown.checked) {
                cdFullNameInput.required = false;
                cdTypeInput.required = false;
                companySearchInput.required = true;
                cdTypeInput.value = "Casting Director";
                cdroleInput.parentElement.style.display = "none";
                cdFullNameInput.parentElement.style.display = "none";
            } else {
                cdFullNameInput.required = true;
                cdTypeInput.required = true;
                companySearchInput.required = false;
                cdTypeInput.value = "";
                cdFullNameInput.parentElement.style.display = "block";
                cdroleInput.parentElement.style.display = "block";
            }
        }

        // add event listeners to the radio buttons
        castingDirectorKnown.addEventListener('change', updateFormInputs);
        onlyCompanyKnown.addEventListener('change', updateFormInputs);

        // set the initial required status and default value of the form inputs based on the default checked radio button
        updateFormInputs();
    </script>