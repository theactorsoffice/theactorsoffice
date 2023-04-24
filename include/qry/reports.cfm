<cfparam name="new_rangeid" default="1" />
<cfparam name="customstart" default="" />
<cfparam name="customend" default="" />
<cfparam name="new_audsourceid" default="1" />
<cfparam name="anchortag" default="" />
<cfparam name="new_audcatid" default="1" />
<cfparam name="refreshdata_yn" default="y" />

<cfinclude template="/include/remote_load.cfm" />





<cfquery datasource="#dsn#" name="reportcheck">
    SELECT * from reports_user where userid = #userid#
</cfquery>


<cfif #reportcheck.recordcount# is "0">


    <cfquery datasource="#dsn#" name="u">
        SELECT * from taousers where userid = #userid#
    </cfquery>

    <cfloop query="u">

        <cfquery datasource="#dsn#" name="x">
            SELECT reportid,reportname,reportorderno,reporttypeid,reportdescription,colmd,colxl,datalabel,colorid FROM reports_master
        </cfquery>

        <cfloop query="x">


            <cfquery datasource="#dsn#" name="find">
                SELECT reportid,reportname,reportorderno,reporttypeid,reportdescription,colorid
                FROM reports_user
                where reportid = '#x.reportid#' and userid = #u.userid# and reportname = '#x.reportname#'
            </cfquery>

            <cfif #find.recordcount# is "0">

                <cfquery datasource="#dsn#" name="insert">
                    INSERT INTO `reports_user` (`reportid`,`reportname`,`reportorderno`,`reporttypeid`,`reportdescription`,`userid`,`colmd`,`colxl`,`datalabel`,`colorid`)
                    VALUES (#x.reportid#,'#x.reportname#',#x.reportorderno#,#x.reporttypeid#,'#x.reportdescription#', #u.userid#,#x.colmd#,#colxl#,
                    '#x.datalabel#',#x.colorid#);
                </cfquery>

            </cfif>

        </cfloop>


    </cfloop>










</cfif>










<cfquery datasource="#dsn#" name="finditems">
    select * from reportitems
    where userid = #session.userid#
</cfquery>

<cfif #finditems.recordcount# is "0">
    <CFLOCATION addtoken="false" url="/include/reportsRefresh.cfm?anchortag=#anchortag#&new_rangeid=#new_rangeid#&new_audcatid=#new_audcatid#&new_audsourceid=#new_audsourceid#">

</cfif>



<cfset reportdate="" />

<cfquery datasource="#dsn#" name="ranges">
    SELECT
    rangeid,
    rangename,
    rangestart,
    rangeend
    FROM reportranges
</cfquery>

<cfquery datasource="#dsn#" name="rangeselected">
    SELECT
    rangeid,
    rangename,
    rangestart,
    rangeend
    FROM reportranges where rangeid = #new_rangeid#
</cfquery>

<cfif #new_rangeid# is "7" and #customstart# is not "" and #customend# is not "">

    <cfset new_rangestart=customstart />

    <cfset new_rangeend=customend />

    <cfelse>

        <cfset new_rangestart=rangeselected.rangestart />

        <cfset new_rangeend=rangeselected.rangeend />

</cfif>

<cfif #new_rangeid# is "1">

    <cfset rangedisplay="All dates" />

    <cfelse>

        <cfoutput>

            <cfset rangedisplay="#dateformat('#new_rangestart#','MM/d/YY')#-#dateformat('#new_rangeend#','MM/d/YY')#" />

        </cfoutput>

</cfif>

<cfquery datasource="#dsn#" name="reports">
    SELECT r.ID,
    r.reportid,
    r.userid,
    r.reportname,
    r.reportorderno,
    r.reporttypeid,
    r.datalabel,
    t.reporttypename,
    r.reportdescription,
    r.colmd,
    r.colxl,
    r.colorid,
    c.colorname,
    c.colorscheme
    FROM reports_user r

    INNER JOIN reporttypes t ON t.reporttypeid = r.reporttypeid
    INNER JOIN reportcolors c on c.colorid = r.colorid
    WHERE r.userid = #session.userid# and t.reporttypeid <> 4
        ORDER BY r.reportorderno
</cfquery>

<cfquery datasource="#dsn#" name="stats">
    SELECT r.ID,
    r.reportid,
    r.userid,
    r.reportname,
    r.reportorderno,
    r.reporttypeid,
    r.datalabel,
    t.reporttypename,
    r.reportdescription,
    r.colmd,
    r.colxl,
    i.itemvalueint as statvalue

    FROM reports_user r
    INNER JOIN reporttypes t ON t.reporttypeid = r.reporttypeid
    inner join reportitems i ON i.id = r.id

    WHERE r.userid = #session.userid# and t.reporttypeid = 4
    and i.userid = r.userid
    ORDER BY r.reportorderno
</cfquery>

<cfquery datasource="#dsn#" name="categories">
    SELECT audcatid,audcatname
    FROM audcategories
    WHERE isdeleted IS NOT TRUE

    ORDER BY audcatname
</cfquery>




<cfquery datasource="#dsn#" name="ratio_13" maxrows="1">
    SELECT i.itemvalueint AS item_13
    FROM reports_user u inner join reportitems i ON i.ID = u.id
    where u.userid = #session.userid# AND u.reportid = 13
</cfquery>


<cfquery datasource="#dsn#" name="ratio_17" maxrows="1">
    SELECT i.itemvalueint AS item_17
    FROM reports_user u inner join reportitems i ON i.ID = u.id
    where u.userid = #session.userid# AND u.reportid = 17
</cfquery>


<cfif #ratio_13.recordcount# is "1" and #ratio_17.recordcount# is "1">


    <cfset new_item_13=ratio_13.item_13 />
    <cfset new_item_17=ratio_17.item_17 />
    <cfif #new_item_17# is not "0">
        <cfscript>
            bookratio=new_item_13/new_item_17*100;
        </cfscript>

        <cfelse>

            <cfset bookratio=0 />
    </cfif>

    <cfelse>

        <cfset bookratio=0 />




</cfif>