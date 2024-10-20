<cfcomponent displayname="UsersAPI" output="false" hint="API endpoints for user-related operations.">

    <!-- Dependency Injection (Optional): Initialize the UserService -->
    <cfset variables.userService = new "/services/UserService.cfc"()>

    <!-- API Method to Create a New User -->
    <cffunction name="createUser" access="remote" returntype="struct" httpmethod="POST" output="false">
        <cfargument name="userData" type="struct" required="true">

        <cfset var result = variables.userService.createUser(arguments.userData)>
        <cfreturn result>
    </cffunction>

    <!-- API Method to Get User Details by ID -->
    <cffunction name="getUser" access="remote" returntype="struct" httpmethod="GET" output="false">
        <cfargument name="userId" type="numeric" required="true">

        <cfset var user = variables.userService.getUserById(arguments.userId)>
        <cfif structIsEmpty(user)>
            <cfreturn {
                "success": false,
                "message": "User not found"
            }>
        <cfelse>
            <cfreturn {
                "success": true,
                "data": user
            }>
        </cfif>
    </cffunction>

    <!-- API Method to Update User Details -->
    <cffunction name="updateUser" access="remote" returntype="struct" httpmethod="PUT" output="false">
        <cfargument name="userId" type="numeric" required="true">
        <cfargument name="userData" type="struct" required="true">

        <cfset var result = variables.userService.updateUser(arguments.userId, arguments.userData)>
        <cfreturn result>
    </cffunction>

    <!-- API Method to Delete a User -->
    <cffunction name="deleteUser" access="remote" returntype="struct" httpmethod="DELETE" output="false">
        <cfargument name="userId" type="numeric" required="true">

        <cfset var result = variables.userService.deleteUser(arguments.userId)>
        <cfreturn result>
    </cffunction>

</cfcomponent>
