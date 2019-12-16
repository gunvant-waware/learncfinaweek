<!--- <cfloop from="1" to="10" index="i">
	<cfset startDate = now() />
	<cfset endDate = dateAdd('d', startDate, randRange(1,5))/>
	<cfquery>
		INSERT INTO ceritificates(certificationTypeId, title, startDate, endDate, isProcessed)
		VALUES(#randRange(1,5)#, 'Title - #LISTLAST(CREATEUUID(), '-')#', #startDate#, #endDate#, 1)
	</cfquery>
</cfloop> --->

<cfquery name="cert">
	SELECT * FROM (

	-- CUrrent Certificates
	SELECT id, title, startDate, endDate,  IF(startDate < NOW() && endDate > NOW(), TRUE, false) AS isCurrent,
	0 AS isUpcoming, 0 AS isExpired FROM ceritificates 
	WHERE startDate < NOW() AND endDate > NOW()

	UNION

	-- UPcoming certificates
	SELECT id, title, startDate, endDate, 0, 
	IF(startDate > NOW() && endDate > NOW(), TRUE, FALSE) AS isUpcoming, 0 
	FROM ceritificates
	WHERE startDate > NOW() AND endDate > NOW()

	UNION

	-- Expired Certificates
	SELECT id,title, startDate, endDate, 0, 0,
	IF(startDate < NOW() && endDate < NOW(), TRUE, FALSE) AS isExpired
	FROM ceritificates
	WHERE startDate < NOW() AND endDate < NOW()
	
	) AS a
	
	ORDER BY a.isCurrent DESC, a.isUpcoming DESC, a.isExpired DESC, a.endDate ASC
</cfquery>

<cfif cert.recordCOunt>
	<!--- IF Only One certificate available --->
	<cfif cert.recordCOunt LTE 2>
		<p>Single certificate available</p>
		<table>
			<tr>
				<th>Id</th>
				<th>Certification Type ID</th>
				<th>Title</th>
				<th>Start Date</th>
				<th>End Date</th>
			</tr>
			<tr>
				<td>#cert.id#</td>
				<td>#cert.certificationTypeId#</td>
				<td>#cert.title#</td>
				<td>#cert.startDate#</td>
				<td>#cert.endDate#</td>
			</tr>
		</table>
		<!--- If MUltiple certificate available --->
	<cfelse>
		<!--- <p>There are multiple certificates available</p> --->

	</cfif>
<cfelse>
	<p>No Certificate Available at the moment</p>
</cfif>
<cfdump var="#cert#">