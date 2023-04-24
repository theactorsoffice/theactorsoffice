<cfset dbug="N" />

<cfparam name="focusid" default="" />

<script src="/app/assets/js/selectize.min.js"></script>
<cfinclude template="/include/qry/audition.cfm" />
<cfinclude template="/include/qry/auddialects_user_sel.cfm" />
<cfinclude template="/include/qry/essence_sel.cfm" />

<cfinclude template="/include/qry/audroletypes_sel.cfm" />
<cfinclude template="/include/qry/myteam.cfm" />

<script src="/app/assets/js/jquery.chained.js"></script>
<p>Enter the information below and press the update button to continue.</p>
<form action="/include/roleupdateform2.cfm" method="post" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <cfoutput>
        <input type="hidden" name="audprojectid" value="#audprojectid#" />
        <input type="hidden" name="new_catid" value="#new_audcatid#" />
        <input type="hidden" name="new_audroleid" value="#audroleid#" />
        <input type="hidden" name="secid" value="176" />
    <input type="hidden" name="userid" value="#userid#" />
        <div class="row" />

        <div class="form-group col-md-6 col-sm-12">

            <label for="new_audrolename">Role Name <span class="text-danger">*</span></label>

            <input class="form-control" type="text" id="new_audrolename" autocomplete="off" required data-parsley-required data-parsley-error-message="Role Name is required" name="new_audrolename" value="#roledetails.audrolename#" placeholder="Role Name">
        </div>

    </cfoutput>


    <div class="form-group col-md-6 col-sm-12">

        <CFIF #new_audcatid# IS "5">
            <input type="hidden" name="new_audroletypeid" value="33" />

            <CFELSE>



                <label for="new_audroletypeid">Role Type <span class="text-danger">*</span></label>
                <select id="new_audroletypeid" name="new_audroletypeid" class="form-control" data-parsley-required data-parsley-error-message="Role Type is required">
                    <option value="">--</option>

                    <cfoutput query="audroletypes_sel">
                        <cfif #audroletypes_sel.id# is "#roledetails.audroletypeid#">
                            <option value="#audroletypes_sel.id#" selected>#audroletypes_sel.name#</option>
                            <cfelse>
                                <option value="#audroletypes_sel.id#">#audroletypes_sel.name#</option>
                        </cfif>

                    </cfoutput>

                </select>
        </cfif>
    </div>


    <cfoutput>



        <div class="form-group col-md-12">
            <label for="projDescription">Character Description </label>
            <textarea class="form-control" type="text" id="new_projcharDescription" name="new_charDescription" placeholder="Character Description  ">#roledetails.charDescription#</textarea>

            <div class="invalid-feedback">
                Please enter a Character Description
            </div>


        </div>

    </cfoutput>




    <cfif #auddialects_user_sel.recordcount# is "0">
        <cfoutput> <input type="hidden" name="new_auddialectid" value="#roledetails.auddialectid#" /></cfoutput>
        <cfelse>

            <div class="form-group col-md-6">
                <label for="new_auddialectid">Dialect</label>
                <select class="form-control" name="new_auddialectid" id="new_auddialectid"  onchange="if (this.value=='CustomDialect'){this.form['CustomDialect'].style.visibility='visible',this.form['CustomDialect'].required=true} else {this.form['CustomDialect'].style.visibility='hidden',this.form['CustomDialect'].required=true};">

                    <option value="">--</option>
  <option value="CustomDialect">***ADD CUSTOM</option>
                    <cfoutput query="auddialects_user_sel">

                        <cfif #roledetails.auddialectid# is "#auddialects_user_sel.id#">
                            <option value="#auddialects_user_sel.id#" Selected data-chained="#auddialects_user_sel.audcatid#">#auddialects_user_sel.name#</option>
                            <Cfelse>

                                <option value="#auddialects_user_sel.id#" data-chained="#auddialects_user_sel.audcatid#">#auddialects_user_sel.name#</option>
                        </Cfif>

                    </cfoutput>




                </select>

                <div class="invalid-feedback">
                    Please select a Dialect.
                </div>
                    
                                <cfoutput>
              

              
            </cfoutput>

                    
                    
                    

            </div>  <div class="form-group col-md-6" id="CustomDialects" style="visibility:hidden;">  <label for="CustomDialect">Custom Dialect</label>
                    <input class="form-control" type="text" id="CustomDialect" name="CustomDialect"  value="" placeholder="Enter a Custom Dialect">
                </div>

    </cfif>








    <cfif #roledetails.audsourceid# is not "1">

        <style>
            #hidden_div {
                display: none;
            }

            ;

        </style>
    </cfif>


    <cfif #roledetails.audsourceid# is not "2">

        <style>
            #hidden_divss {
                display: none;
            }

            ;

        </style>
    </cfif>


    <cfif #roledetails.audsourceid# is "2">

        <style>
            #hidden_divss {
                display: block;
            }

            ;

        </style>
    </cfif>





    <cfif #roledetails.audsourceid# is not "3">

        <style>
            #hidden_divs {
                display: none;
            }

            ;

        </style>
    </cfif>



    <cfif #roledetails.audsourceid# is not "4">

        <style>
            #hidden_divx {
                display: none;
            }

            ;

        </style>
    </cfif>




    <div class="form-group col-md-6">
        <label for="new_audsourceid">Source </label>
        <select class="form-control" name="new_audsourceid" id="new_audsourceid" onChange="showDivx('hidden_divx', this);showDiv('hidden_div', this);showDivs('hidden_divs', this);showDivss('hidden_divss', this);requiredDiv('require_div', this);">

            <option value="">--</option>

            <cfoutput query="audsources_sel">

                <cfif #roledetails.audsourceid# is "#audsources_sel.id#">
                    <option value="#audsources_sel.id#" selected>#audsources_sel.name#</option>
                    <Cfelse>

                        <option value="#audsources_sel.id#">#audsources_sel.name#</option>
                </Cfif>

            </cfoutput>




        </select>

        <div class="invalid-feedback">
            Please select an Source.
        </div>



    </div>
        
        
    <div id="hidden_divx" class="form-group col-md-12">

        <div class="col-md-12">

            <cfquery datasource="#dsn#" name="opencalls">
                
                SELECT opencallid,opencallname FROM audopencalloptions_user WHERE userid = #userid# ORDER BY opencallname

            </cfquery>

            <div class="form-group">

                <label for="select-opencall">Click in the box to select an open call option OR type a new one:</label>

                <select id="select-opencall" name="new_opencallname" class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select the option...">

                    <option value="">Select an open call option...</option>

                    <cfloop query="opencalls">

                        <cfif #roledetails.opencallid# is "">
                            <cfset new_opencallid=0 />

                            <cfelse>

                                <cfset new_opencallid=roledetails.opencallid />


                        </cfif>

                        <cfquery datasource="#dsn#" name="findc">

                          SELECT opencallid,opencallname FROM audopencalloptions_user WHERE opencallid = #new_opencallid#

                        </cfquery>

                        <cfif #opencalls.opencallid# is "#roledetails.opencallid#">

                            <cfset new_selectd="selected" />

                            <cfelse>

                                <cfset new_selectd="" />

                        </cfif>

                        <cfoutput>

                            <option value="#opencalls.opencallname#" #new_selectd#>#opencalls.opencallname#</option>

                        </cfoutput>

                    </cfloop>

                </select>

            </div>


            <script>
                $("#select-opencall").selectize({

                    persist: !1,
                    createOnBlur: !0,
                    create: !0,
                    maxItems: 1,
                    plugins: ["remove_button"],
                    delimiter: ",",
                    persist: false,
                    create: function(input) {
                        return {
                            value: input,
                            text: input,
                        };
                    },


                });

            </script>




        </div>

    </div>
            
            
            
            
            
            

    <div id="hidden_div" class="form-group col-md-12">


        <label for="new_contactid">Select referral source from your team </label>

        <select id="new_contactid" class="form-control" name="new_contactid" <cfif #roledetails.audsourceid# is "1">required="true"<cfelse>required="false"</cfif> >
                <option value="">--</option>
                <cfoutput query="myteam">
                    <option value="#myteam.contactid#" <cfif #myteam.contactid# is "#roledetails.contactid#"> Selected </cfif> >#myteam.contactname#</option>
                </cfoutput>
        </select>


    </div>


    <div id="hidden_divs" class="form-group col-md-12">

        <div class="col-md-12">

            <cfquery datasource="#dsn#" name="referrals">
                SELECT contactid, recordname FROM contactdetails WHERE userid = #userid# and recordname <> '' order by recordname
            </cfquery>

            <div class="form-group">

                <label for="select-tag">Click in the box to select a Referral Source OR type a new one:</label>

                <select id="select-referral" name="referral" class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select the referral...">

                    <option value="">Select an referral...</option>

                    <cfloop query="referrals">

                        <cfif #roledetails.contactid# is "">
                            <cfset role_contactid=0 />

                            <cfelse>

                                <cfset role_contactid=roledetails.contactid />


                        </cfif>

                        <cfquery datasource="#dsn#" name="findc">

                            SELECT * FROM contactdetails WHERE contactid = #role_contactid#

                        </cfquery>

                        <cfif #referrals.contactid# is "#roledetails.contactid#">

                            <cfset new_selectc="selected" />

                            <cfelse>

                                <cfset new_selectc="" />

                        </cfif>

                        <cfoutput>

                            <option value="#referrals.recordname#" #new_selectc#>#referrals.recordname#</option>

                        </cfoutput>

                    </cfloop>

                </select>

            </div>


            <script>
                $("#select-referral").selectize({

                    persist: !1,
                    createOnBlur: !0,
                    create: !0,
                    maxItems: 1,
                    plugins: ["remove_button"],
                    delimiter: ",",
                    persist: false,
                    create: function(input) {
                        return {
                            value: input,
                            text: input,
                        };
                    },


                });

            </script>




        </div>

    </div>










    <div id="hidden_divss" class="form-group col-md-12">

        <div class="col-md-12">

            <cfquery datasource="#dsn#" name="subsites">
                SELECT submitsiteid,submitsitename
                FROM audsubmitsites_user
                WHERE userid = #userid# and catlist LIKE '%#new_audcatid#%'
                order by submitsitename
            </cfquery>

            <div class="form-group">

                <label for="select-submitsitename">Click in the box to select a Submission Site OR type a new one:</label>

                <select id="select-submitsitename" name="new_submitsitename" class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select the site...">

                    <option value="">Select the site...</option>

                    <cfloop query="subsites">

                        <cfif "#subsites.submitsiteid#" is "#roledetails.submitsiteid#">
                            <Cfset new_selectd="selected" />

                            <cfelse>
                                <Cfset new_selectd="" />

                        </cfif>

                        <cfoutput>

                            <option value="#subsites.submitsitename#" #new_selectd#>#subsites.submitsitename#</option>

                        </cfoutput>

                    </cfloop>

                </select>

            </div>


            <script>
                $("#select-submitsitename").selectize({

                    persist: !1,
                    createOnBlur: !0,
                    create: !0,
                    maxItems: 1,
                    plugins: ["remove_button"],
                    delimiter: ",",
                    persist: false,
                    create: function(input) {
                        return {
                            value: input,
                            text: input,
                        };
                    },


                });

            </script>




        </div>

    </div>










    <div class="col-md-12">

        <cfquery datasource="#dsn#" name="ranges">
            SELECT rangeid,rangename FROM
            audageranges
            WHERE isdeleted IS FALSE
            ORDER BY rangeid
        </cfquery>


        <div class="form-group mb-3">
            <label for="select-tag">Age Range:</label>
            <select id="select-age" name="rangename" multiple class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select an age range...">
                <option value="">Select an age range...</option>
                ranges

                <cfloop query="ranges">
                    <cfset new_rangeid=ranges.rangeid />
                    <cfquery datasource="#dsn#" name="findt">
                        SELECT * FROM audageranges_audtion_xref WHERE audroleid = #audroleid# AND rangeid = #new_rangeid#
                    </cfquery>

                    <cfif #findt.recordcount# is "1">
                        <cfset new_select="selected" />

                        <cfelse>
                            <cfset new_select="" />

                    </cfif>
                    <cfoutput>
                        <option value="#ranges.rangeid#" #new_select#>#ranges.rangename#</option>
                    </cfoutput>
                </cfloop>


            </select>
        </div>



        <script>
            function showDiv(divId, element) {
                document.getElementById(divId).style.display = element.value == 1 ? 'block' : 'none';

            }

        </script>
            
                    <script>
            function showDivx(divId, element) {
                document.getElementById(divId).style.display = element.value == 4 ? 'block' : 'none';

            }

        </script>
            
            
            
        <script>
            function requireDiv(require_div, element) {
                document.getElementById(require_div).style.display = element.value == 1 ? 'required' : 'true';

            }

        </script>


        <script>
            function showDivss(divId, element) {
                document.getElementById(divId).style.display = element.value == 2 ? 'block' : 'none';
            }

        </script>


        <script>
            function showDivs(divId, element) {
                document.getElementById(divId).style.display = element.value == 3 ? 'block' : 'none';
            }

        </script>
        <script>
            function showDivsss(divId, element) {
                document.getElementById(divId).style.display = element.value == 1 ? 'block' : 'none';
            }

        </script>


        <script>
            $("#select-age").selectize({

                persist: !1,
                createOnBlur: !0,
                create: !0,


                plugins: ["remove_button"],
                delimiter: ",",
                persist: false,
                create: false


            });

        </script>




    </div>










    <cfif #projectDetails.audcatid# is "5">

        <div class="col-md-12">

            <cfquery datasource="#dsn#" name="vocals">
                SELECT vocaltypeid,vocaltype FROM
                audvocaltypes
                WHERE isdeleted IS FALSE
                ORDER BY vocaltype
            </cfquery>


            <div class="form-group">
                 <label for="select-tag">Click in the box to select a Vocal Quality OR type a new one:</label>
                <select id="select-vocal" name="vocaltype" multiple class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select a vocal type...">
                    <option value="">Click in the box to select a V OR type a new one</option>


                    <cfloop query="vocals">
                        <cfset new_vocaltypeid=vocals.vocaltypeid />
                        <cfquery datasource="#dsn#" name="findt">
                            SELECT * FROM audvocaltypes_audition_xref WHERE audroleid = #audroleid# AND vocaltypeid = #new_vocaltypeid#
                        </cfquery>

                        <cfif #findt.recordcount# is "1">
                            <cfset new_select="selected" />

                            <cfelse>
                                <cfset new_select="" />

                        </cfif>
                        <cfoutput>
                            <option value="#vocals.vocaltypeid#" #new_select#>#vocals.vocaltype#</option>
                        </cfoutput>
                    </cfloop>


                </select>
            </div>


            <script>
                $("#select-vocal").selectize({

                    persist: !1,
                    createOnBlur: !0,
                    create: !0,


                    plugins: ["remove_button"],
                    delimiter: ",",
                    persist: false,
                    create: function(input) {
                        return {
                            value: input,
                            text: input,
                        };
                    },


                });

            </script>




        </div>

    </cfif>


    <div class="col-md-12">

        <cfquery datasource="#dsn#" name="essences">
            SELECT essenceid,essencename FROM essences WHERE userid = #userid# AND isdeleted IS FALSE ORDER BY essencename
        </cfquery>

        <div class="form-group">

                 <label for="select-tag">Click in the box to select an Essence OR type a new one:</label>

            <select id="select-essence" name="essence" multiple class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select an essence...">

                <option value="">Select an essence...</option>

                <cfloop query="essences">



                    <cfquery datasource="#dsn#" name="findg">

                        SELECT * from audessences_audtion_xref x INNER JOIN essences e ON e.essenceid = x.essenceid where e.essencename = '#essences.essencename#' and x.audroleid = #audroleid# and e.userid = #userid# AND e.isdeleted = 0

                    </cfquery>

                    <cfif #findg.recordcount# is "1">

                        <cfset new_select="selected" />

                        <cfelse>

                            <cfset new_select="" />

                    </cfif>

                    <cfoutput>

                        <option value="#essences.essencename#" #new_select#>#essences.essencename#</option>

                    </cfoutput>

                </cfloop>

            </select>

        </div>


        <script>
            $("#select-essence").selectize({

                persist: !1,
                createOnBlur: !0,
                create: !0,


                plugins: ["remove_button"],
                delimiter: ",",
                persist: false,
                create: function(input) {
                    return {
                        value: input,
                        text: input,
                    };
                },


            });

        </script>




    </div>


        
        
        
        
        
        
        
        
        



<cfquery datasource="#dsn#" name="findit"  >
SELECT * FROM audgenres_user WHERE audcatid = #new_audcatid# and userid = #userid#;
         </cfquery>
    
    <cfif #int(findit.recordcount)# is not "0">
    <cfif #new_audcatid# is not "5" or #new_audcatid# is "5" and #new_subcatid# is "34" >
        
        
        
        




    <div class="col-md-12">

        <cfquery datasource="#dsn#" name="genres">
            SELECT audgenreid,audgenre,audcatid FROM audgenres_user WHERE userid = #userid# and audcatid = #new_audcatid# ORDER BY audgenre
        </cfquery>

        <div class="form-group">

            <label for="select-tag">Click in the box to select a Genre OR type a new one:</label>

            <select id="select-genre" name="Genre" multiple class="demo-default selectize-close-btn" style="width: 100%" placeholder="Select a genre...">

                <option value="">Select a genre...</option>

                <cfloop query="genres">



                    <cfquery datasource="#dsn#" name="findge">

                        SELECT * from audgenres_audition_xref x INNER JOIN audgenres_user g ON g.audgenreid = x.audgenreid where g.audgenre = '#genres.audgenre#' and x.audroleid = #audroleid# 

                    </cfquery>

                    <cfif #findge.recordcount# is "1">

                        <cfset new_select_genre="selected" />

                        <cfelse>

                            <cfset new_select_genre="" />

                    </cfif>

                    <cfoutput>

                        <option value="#genres.audgenre#" #new_select_genre#>#genres.audgenre#</option>

                    </cfoutput>

                </cfloop>

            </select>

        </div>


        <script>
            $("#select-genre").selectize({

                persist: !1,
                createOnBlur: !0,
              


                plugins: ["remove_button"],
                delimiter: ",",
                persist: false,
                create: true


            });

        </script>




    </div>


<cfelse>
    <input type="hidden" name="" value="" />

        </cfif>
        
        </cfif>





    <div class="form-group text-center  col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;" type="submit">Update</button>
    </div>

    </div>
</form>

<script src="/app/assets/js/libs/parsleyjs/parsley.min.js"></script>
