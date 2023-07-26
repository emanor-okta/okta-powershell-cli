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



.PARAMETER Id
No description available.
.PARAMETER Name
No description available.
.PARAMETER SecretKey
No description available.
.PARAMETER SiteKey
No description available.
.PARAMETER Type
No description available.
.PARAMETER Links
No description available.
.OUTPUTS

CAPTCHAInstance<PSCustomObject>
#>

function Initialize-OktaCAPTCHAInstance {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Id},
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true)]
        [String]
        ${Name},
        [Parameter(Position = 2, ValueFromPipelineByPropertyName = $true)]
        [String]
        ${SecretKey},
        [Parameter(Position = 3, ValueFromPipelineByPropertyName = $true)]
        [String]
        ${SiteKey},
        [Parameter(Position = 4, ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("HCAPTCHA", "RECAPTCHA_V2")]
        [PSCustomObject]
        ${Type},
        [Parameter(Position = 5, ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject]
        ${Links}
    )

    Process {
        'Creating PSCustomObject: Okta.PowerShell => OktaCAPTCHAInstance' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


        $PSO = [PSCustomObject]@{
            "id" = ${Id}
            "name" = ${Name}
            "secretKey" = ${SecretKey}
            "siteKey" = ${SiteKey}
            "type" = ${Type}
            "_links" = ${Links}
        }


        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to CAPTCHAInstance<PSCustomObject>

.DESCRIPTION

Convert from JSON to CAPTCHAInstance<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

CAPTCHAInstance<PSCustomObject>
#>
function ConvertFrom-OktaJsonToCAPTCHAInstance {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: Okta.PowerShell => OktaCAPTCHAInstance' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in OktaCAPTCHAInstance
        $AllProperties = ("id", "name", "secretKey", "siteKey", "type", "_links")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "id"))) { #optional property not found
            $Id = $null
        } else {
            $Id = $JsonParameters.PSobject.Properties["id"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "name"))) { #optional property not found
            $Name = $null
        } else {
            $Name = $JsonParameters.PSobject.Properties["name"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "secretKey"))) { #optional property not found
            $SecretKey = $null
        } else {
            $SecretKey = $JsonParameters.PSobject.Properties["secretKey"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "siteKey"))) { #optional property not found
            $SiteKey = $null
        } else {
            $SiteKey = $JsonParameters.PSobject.Properties["siteKey"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "type"))) { #optional property not found
            $Type = $null
        } else {
            $Type = $JsonParameters.PSobject.Properties["type"].value
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "_links"))) { #optional property not found
            $Links = $null
        } else {
            $Links = $JsonParameters.PSobject.Properties["_links"].value
        }

        $PSO = [PSCustomObject]@{
            "id" = ${Id}
            "name" = ${Name}
            "secretKey" = ${SecretKey}
            "siteKey" = ${SiteKey}
            "type" = ${Type}
            "_links" = ${Links}
        }

        return $PSO
    }

}
