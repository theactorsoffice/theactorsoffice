<cfinclude template="/include/remote_load.cfm"/>

<cfoutput>
    <cfparam name="tag" default=""/>

    <cfset mylist = "#tag#"/>

    <br>#mylist#
    <br>contactid:#contactid#
    <br>
    
</cfoutput>

<cfquery datasource="#dsn#" name="delete">
    DELETE FROM contactitems where valuecategory = 'Tag' and contactid = #contactid#
</cfquery>

<cfif #tag# is not "">
    <cfloop list="#myList#" index="new_valuetext">
    
        <cfquery datasource="#dsn#" name="find">
            select * from tags_user where tagname = '#left(new_valuetext, 40)#' and userid = #userid#
        </cfquery>
    
        <cfif #find.recordcount# is "0">
            <cfquery datasource="#dsn#" name="insert_tag">
                INSERT INTO tags_user (userid,tagname,IsCustom)
                VALUES (#userid#,'#left(new_valuetext, 40)#',1)
            </cfquery>
        
            <cfquery datasource="#dsn#" name="find">
                select * from tags_user where tagname = '#left(new_valuetext, 40)#' and userid = #userid#
            </cfquery>
        </cfif>
    
        <cfquery datasource="#dsn#" name="insert">
            INSERT INTO CONTACTITEMS (CONTACTID,VALUETYPE,VALUECATEGORY,VALUETEXT,ITEMSTATUS)
            VALUES (#CONTACTID#,'Tags','Tag','#left(new_valuetext, 40)#','Active')
        </cfquery>
    
    </cfloop>
</cfif>

<cfquery datasource="#dsn#" name="y">
    select * from tags_user where userid = #userid# and iscustom = 1
</cfquery>

<cfloop query="y">
    <cfquery datasource="#dsn#" name="find_orphan">
        Select * from contactitems where valuecategory = 'Tag' AND contactid IN (SELECT contactid
        FROM contactdetails WHERE userid = #userid#) AND valueText = '#left(y.tagname, 40)#'
    </cfquery>

    <cfif #find_orphan.recordcount# is "0">
        <cfquery datasource="#dsn#" name="d">
            update tags_user_tbl
            set isdeleted = 1
            where userid = #userid# and iscustom = 1 and tagname = '#left(y.tagname, 40)#'
        </cfquery>
    </cfif>
</cfloop>

<cfset script_name_include = "/include/#ListLast(GetCurrentTemplatePath(), "\")#"/>
<cfinclude template="/include/bigbrotherinclude.cfm"/>

<cflocation url="/app/contact/?contactid=#contactid#"/>