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

.PARAMETER SkipUnlock
No description available.
.OUTPUTS

PasswordPolicyDelegationSettingsOptions<PSCustomObject>
#>

function Initialize-PasswordPolicyDelegationSettingsOptions {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName = $true)]
        [System.Nullable[Boolean]]
        ${SkipUnlock}
    )

    Process {
        'Creating PSCustomObject: PSOpenAPITools => PasswordPolicyDelegationSettingsOptions' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


        $PSO = [PSCustomObject]@{
            "skipUnlock" = ${SkipUnlock}
        }


        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to PasswordPolicyDelegationSettingsOptions<PSCustomObject>

.DESCRIPTION

Convert from JSON to PasswordPolicyDelegationSettingsOptions<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

PasswordPolicyDelegationSettingsOptions<PSCustomObject>
#>
function ConvertFrom-JsonToPasswordPolicyDelegationSettingsOptions {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: PSOpenAPITools => PasswordPolicyDelegationSettingsOptions' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in PasswordPolicyDelegationSettingsOptions
        $AllProperties = ("skipUnlock")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "skipUnlock"))) { #optional property not found
            $SkipUnlock = $null
        } else {
            $SkipUnlock = $JsonParameters.PSobject.Properties["skipUnlock"].value
        }

        $PSO = [PSCustomObject]@{
            "skipUnlock" = ${SkipUnlock}
        }

        return $PSO
    }

}
