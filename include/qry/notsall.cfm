<cfquery datasource="#dsn#" name="notsall">
    SELECT
    n.notID
    FROM funotifications n

    INNER JOIN fusystemusers f ON f.suID = n.suID

    INNER JOIN fusystems s ON s.systemID = f.systemID

    INNER JOIN fuactions a ON a.actionID = n.actionID
    WHERE f.contactID = #currentid#

    AND f.contactid = #currentid#

</cfquery>