<CFINCLUDE template="/include/remote_load.cfm" />

<cfset dbug="Y" />

<cfif not #isdefined('tname')#>
    tname required! <cfabort>
</cfif>

<cfset new_userid=cookie.userid />

<cfquery name="allfields" datasource="abod">

    DESCRIBE #tname#

</cfquery>

<cfquery dbtype="query" name="x">
    select *
    from allfields
    WHERE [key] <> 'pri' and [extra] <> 'auto_increment'
</cfquery>

<cfif #dbug# is "Y">

    <cftable query="x" colheaders="true" border="true" htmltable="true">

        <cfcol header="Field" text="#field#" />

        <cfcol header="Type" text="#type#" />

        <cfcol header="Null" text="#Null#" />

        <cfcol header="Key" text="#Key#" />

        <cfcol header="Default" text="#default#" />

    </cftable>

</cfif>

<cfloop query="x">

    <cfif x.type is "bit(1)">

        <Cfset new_default=0 />

    </cfif>

    <cfif x.type is not "bit(1)">

        <Cfset new_default=x.default />

    </cfif>

    <cfif new_default eq "" and x.Null eq "NO">

        <Cfset new_default="0" />

    </cfif>

    <cfparam name="new_#x.field#" default="#new_default#" />

</cfloop>

<cfquery name="#tname#_ins" datasource="#dsn#" result="result">

    INSERT INTO `#tname#` (

    <cfloop query="x">
        <Cfif #x.currentrow# is not "1">,</cfif>`#x.field#`
    </cfloop>

    )

    VALUES (

    <cfloop query="x">

        <cfscript>
            origText = x.type ;
            newText = reReplaceNoCase(origText, "\([0-9]*\).*$", "", "all");

        </cfscript>

        <cfoutput>

            <cfset new_field="#EVALUATE('new_#x.field#')#" />
            <cfset new_maxvalue="#replace('#x.type#','#newtext#','')#" />
            <cfset new_maxvalue="#replace('#new_maxvalue#','(','')#" />
            <cfset new_maxvalue="#replace('#new_maxvalue#',')','')#" />
            <cfset new_maxvalue="#trim(new_maxvalue)#">

                <cfif #newText# is "int">

                    <cfset new_cfsqltype="cf_sql_integer" />

                </cfif>

                <cfif #newText# is "varchar">
                    <cfset new_cfsqltype="cf_sql_varchar" />
                </cfif>

                <cfif #newText# is "tinytext">
                    <cfset new_cfsqltype="cf_sql_varchar" />
                </cfif>

                <cfif #newText# is "mediumtext">
                    <cfset new_cfsqltype="cf_sql_longvarchar" />
                </cfif>

                <cfif #newText# is "longtext">
                    <cfset new_cfsqltype="cf_sql_longvarchar" />
                </cfif>

                <cfif #newText# is "text">
                    <cfset new_cfsqltype="cf_sql_longvarchar" />
                </cfif>
                
                <cfif #newText# is "bit">
                    <cfset new_cfsqltype="cf_sql_bit" />
                </cfif>
                
                <cfif #newText# is "time">
                    <cfset new_cfsqltype="cf_sql_time" />
                </cfif>

                <cfif #newText# is "date">
                    <cfset new_cfsqltype="cf_sql_date" />
                </cfif>
                
                <cfif #newText# is "datetime">
                    <cfset new_cfsqltype="cf_sql_timestamp" />
                </cfif>

                <cfif #newText# is "timestamp">
                    <cfset new_cfsqltype="cf_sql_timestamp" />
                </cfif>
                
                <cfif #newText# is "char">
                    <cfset new_cfsqltype="cf_sql_char" />
                </cfif>

                <Cfif #x.currentrow# is not "1">,</cfif>
                <cfif #new_maxvalue# is not "">
                    <cfqueryparam cfsqltype="#new_cfsqltype#" value="#new_field#" maxlength="#new_maxvalue#" null="#NOT len(trim(new_field))#" />
                    <cfelse>
                        <cfqueryparam cfsqltype="#new_cfsqltype#" value="#new_field#" null="#NOT len(trim(new_field))#" />
                </cfif>
        </cfoutput>
    </cfloop>

    );

</cfquery>
        
        <cfif #dbug# is "Y">
        <Cfdump var="#result#" >
        </cfif>
        
        
        
        
        
        
        
