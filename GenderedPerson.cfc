<cfcomponent
    extends="Person"
    output="false"
    hint="I am a gendered Person.">


    <cffunction
        name="Init"
        access="public"
        returntype="any"
        output="false"
        hint="I return an initialized component.">

        <!--- Define arguments. --->
        <cfargument
            name="Name"
            type="string"
            required="true"
            hint="I am the name of this person."
            />

        <cfargument
            name="Gender"
            type="string"
            required="true"
            hint="I am the gender of this person."
            />

        <!---
            Call SUPER constructor and pass in the required
            argument. The super contsructor will take care
            of creating our instance variable structures;
            afterwards, we simply will need to add to it (not
            create it).
        --->
        <cfset SUPER.Init( ARGUMENTS.Name ) />

        <!--- Set up instance variables. --->
        <cfset VARIABLES.Instance.Gender = ARGUMENTS.Gender />
        
        <!--- Return This reference. --->
        <cfreturn THIS />
    </cffunction>


    <cffunction
        name="GetGender"
        access="public"
        returntype="string"
        output="false"
        hint="I return the person gender.">

        <cfreturn VARIABLES.Instance.Gender />
    </cffunction>

</cfcomponent>