<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="x">
    SELECT
    rangeid,
    rangename,
    rangestart,
    rangeend
    FROM reportranges where rangeid not in (1,7)
</cfquery>

<Cfoutput>

    <cfset current_year="#year(now())#" />

    <cfset current_month="#month(now())#" />

</Cfoutput>

<cfset last_year=current_year - 1 />

<cfloop query="x">

    <cfset current_rangeid=x.rangeid />

    <cfif #x.rangename# is "Current Year">

        <cfoutput>

            <cfset new_year="#year(now())#" />

            <cfset new_rangestart="#new_year#-01-01" />

            <cfset new_rangeend="#new_year#-12-31" />

        </cfoutput>

    </cfif>

    <cfif #x.rangename# is "Last Year">

        <cfset new_year=year(now()) - 1 />

        <cfoutput>

            <cfset new_rangestart="#new_year#-01-01" />

            <cfset new_rangeend="#new_year#-12-31" />

        </cfoutput>

    </cfif>

    <cfif #x.rangename# is "Current Month">

        <cfif #current_month# is "12">

            <cfset next_month=1 />

            <cfset new_year=current_year +1 />

        </cfif>

        <cfif #current_month# is not "12">

            <cfset next_month=current_month + 1 />

            <cfset new_year=current_year />

        </cfif>

        <cfoutput>

            <cfset next_date="#new_year#-#next_month#-01" />

        </cfoutput>

        <cfset new_rangeend=DateAdd("d",-1,next_date) />
 <cfset new_rangeend="#dateformat('#new_rangeend#','YYYY-MM-dd')#" />
        <cfoutput>

            <cfset new_rangestart="#current_year#-#current_month#-01" />

        </cfoutput>

    </cfif>

    <cfif #x.rangename# is "Last 3 Months">

        <cfset current_month=month(now()) />

        <cfset current_day=day(now()) />

        <cfif #current_month# is "3">

            <cfset three_month=12 />

            <cfset three_year=last_year />

            <cfelseif #current_month# is "2">

                <cfset three_month=11 />

                <cfset three_year=last_year />

                <cfelseif #current_month# is "1">

                    <cfset three_month=10 />

                    <cfset three_year=last_year />

                    <cfelse>

                        <cfset three_year=current_year />

                        <cfset three_month=current_month - 3 />

        </cfif>

        <cfoutput>

            <cfset new_rangeend="#dateformat('#now()#','YYYY-MM-dd')#" />

            <cfset new_rangestart="#dateformat('#now()#','#three_year#-#three_month#-#current_day#')#" />

        </cfoutput>

    </cfif>

    <cfif #x.rangename# is "Last 6 Months">

        <cfset current_month=month(now()) />

        <cfset current_day=day(now()) />

        <cfif #current_month# is "6">

            <cfset six_month=12 />

            <cfset six_year=last_year />

            <cfelseif #current_month# is "5">

                <cfset six_month=11 />

                <cfset six_year=last_year />

                <cfelseif #current_month# is "4">

                    <cfset six_month=10 />
                    
                    <cfset six_year=last_year />

                    <cfelseif #current_month# is "3">

                        <cfset six_month=8 />

                        <cfset six_year=last_year />

                        <cfelseif #current_month# is "2">

                            <cfset six_month=7 />

                            <cfset six_year=last_year />

                            <cfelseif #current_month# is "1">

                                <cfset six_month=6 />

                                <cfset six_year=last_year />

                                <cfelse>

                                    <cfset six_year=current_year />

                                    <cfset six_month=current_month - 6 />

        </cfif>

        <cfoutput>

            <cfset new_rangeend="#dateformat('#now()#','YYYY-MM-dd')#" />

            <cfset new_rangestart="#dateformat('#now()#','#six_year#-#six_month#-#current_day#')#" />

        </cfoutput>

    </cfif>
                     

    <cfquery datasource="#dsn#" name="update2">
        update reportranges
        set rangestart =
        <cfqueryparam cfsqltype="cf_sql_date" value="#new_rangestart#" />,
        rangeend =
        <cfqueryparam cfsqltype="cf_sql_date" value="#new_rangeend#" />
        where rangeid = #current_rangeid#
    </cfquery>

</cfloop>
                        
                            <cfquery datasource="#dsn#" name="update2">
        update reportranges
        set rangestart =
        <cfqueryparam cfsqltype="cf_sql_date" value="#customstart#" />,
        rangeend =
        <cfqueryparam cfsqltype="cf_sql_date" value="#customend#" />
        where rangename = 'Custom'
    </cfquery>

                        
                        
                        
                        
                    <cfset new_rangeend="" />

            <cfset new_rangestart="" />                
                        