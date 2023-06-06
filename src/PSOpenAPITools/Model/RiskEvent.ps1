#
# Okta Management
# Allows customers to easily access the Okta Management APIs
# Version: 3.0.0
# Contact: devex-public@okta.com
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.SYNOPSIS

No summary available.

.DESCRIPTION

No description available.

.PARAMETER ExpiresAt
Time stamp at which the event expires (Expressed as a UTC time zone using ISO 8601 format: yyyy-MM-dd'T'HH:mm:ss.SSS'Z'). If this optional field is not included, Okta automatically expires the event 24 hours after the event is consumed.
.PARAMETER Subjects
No description available.
.PARAMETER Timestamp
Time stamp at which the event is produced (Expressed as a UTC time zone using ISO 8601 format: yyyy-MM-dd'T'HH:mm:ss.SSS'Z').
.OUTPUTS

RiskEvent<PSCustomObject>
#>

function Initialize-RiskEvent {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[System.DateTime]]
        ${ExpiresAt},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject[]]
        ${Subjects},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[System.DateTime]]
        ${Timestamp}
    )

    Process {
        'Creating PSCustomObject: PSOpenAPITools => RiskEvent' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($null -eq $Subjects) {
            throw "invalid value for 'Subjects', 'Subjects' cannot be null."
        }


        $PSO = [PSCustomObject]@{
            "expiresAt" = ${ExpiresAt}
            "subjects" = ${Subjects}
            "timestamp" = ${Timestamp}
        }


        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to RiskEvent<PSCustomObject>

.DESCRIPTION

Convert from JSON to RiskEvent<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

RiskEvent<PSCustomObject>
#>
function ConvertFrom-JsonToRiskEvent {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: PSOpenAPITools => RiskEvent' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in RiskEvent
        $AllProperties = ("expiresAt", "subjects", "timestamp")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        If ([string]::IsNullOrEmpty($Json) -or $Json -eq "{}") { # empty json
            throw "Error! Empty JSON cannot be serialized due to the required property 'subjects' missing."
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "subjects"))) {
            throw "Error! JSON cannot be serialized due to the required property 'subjects' missing."
        } else {
            $Subjects = $JsonParameters.PSobject.Properties["subjects"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "expiresAt"))) { #optional property not found
            $ExpiresAt = $null
        } else {
            $ExpiresAt = $JsonParameters.PSobject.Properties["expiresAt"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "timestamp"))) { #optional property not found
            $Timestamp = $null
        } else {
            $Timestamp = $JsonParameters.PSobject.Properties["timestamp"].value
        }

        $PSO = [PSCustomObject]@{
            "expiresAt" = ${ExpiresAt}
            "subjects" = ${Subjects}
            "timestamp" = ${Timestamp}
        }

        return $PSO
    }

}
