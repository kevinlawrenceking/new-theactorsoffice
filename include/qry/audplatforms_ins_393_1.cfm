<cfset auditionPlatformsService = createObject("component", "services.AuditionPlatformsService")>
<cfset new_audplatformid = auditionPlatformsService.INSaudplatforms(new_audplatform=trim(new_audplatform), new_isDeleted=new_isDeleted)>