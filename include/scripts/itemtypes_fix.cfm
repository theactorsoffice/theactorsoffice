<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x">
    SELECT count(typeid),valuetype,userid
    FROM itemtypes_user

    group by valuetype,userid
    HAVING COUNT(typeid) > 1
</cfquery>

<cfloop query="x">
        <cfquery datasource="#dsn#" name="upd" >
        update itemtypes_user_tbl
        set isdeleted = 1
        where userid = #x.userid#
        and valuetype='#x.valuetype#'
    </cfquery>
    

    <cfquery datasource="#dsn#" name="find" maxrows="1">
        select * from itemtypes_user_tbl
        where isdeleted = 1
        and userid = #x.userid#
        and valuetype='#x.valuetype#'
    </cfquery>

    <cfif #find.recordcount# is "1">

        <cfquery datasource="#dsn#" name="update">
            update itemtypes_user_tbl
            set isdeleted = 0
            where typeid = #find.typeid#
        </cfquery>

    </cfif>

</cfloop>
