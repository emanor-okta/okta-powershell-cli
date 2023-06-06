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

.PARAMETER Conditions
No description available.
.PARAMETER Settings
No description available.
.OUTPUTS

PasswordPolicyAllOf<PSCustomObject>
#>

function Initialize-PasswordPolicyAllOf {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject]
        ${Conditions},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject]
        ${Settings}
    )

    Process {
        'Creating PSCustomObject: PSOpenAPITools => PasswordPolicyAllOf' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


        $PSO = [PSCustomObject]@{
            "conditions" = ${Conditions}
            "settings" = ${Settings}
        }


        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to PasswordPolicyAllOf<PSCustomObject>

.DESCRIPTION

Convert from JSON to PasswordPolicyAllOf<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

PasswordPolicyAllOf<PSCustomObject>
#>
function ConvertFrom-JsonToPasswordPolicyAllOf {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: PSOpenAPITools => PasswordPolicyAllOf' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PasswordPolicyAllOf
        $AllProperties = ("conditions", "settings")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "conditions"))) { #optional property not found
            $Conditions = $null
        } else {
            $Conditions = $JsonParameters.PSobject.Properties["conditions"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "settings"))) { #optional property not found
            $Settings = $null
        } else {
            $Settings = $JsonParameters.PSobject.Properties["settings"].value
        }

        $PSO = [PSCustomObject]@{
            "conditions" = ${Conditions}
            "settings" = ${Settings}
        }

        return $PSO
    }

}
