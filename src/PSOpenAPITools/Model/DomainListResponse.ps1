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

.PARAMETER Domains
No description available.
.OUTPUTS

DomainListResponse<PSCustomObject>
#>

function Initialize-DomainListResponse {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject[]]
        ${Domains}
    )

    Process {
        'Creating PSCustomObject: PSOpenAPITools => DomainListResponse' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug


        $PSO = [PSCustomObject]@{
            "domains" = ${Domains}
        }


        return $PSO
    }
}

<#
.SYNOPSIS

Convert from JSON to DomainListResponse<PSCustomObject>

.DESCRIPTION

Convert from JSON to DomainListResponse<PSCustomObject>

.PARAMETER Json

Json object

.OUTPUTS

DomainListResponse<PSCustomObject>
#>
function ConvertFrom-JsonToDomainListResponse {
    Param(
        [AllowEmptyString()]
        [string]$Json
    )

    Process {
        'Converting JSON to PSCustomObject: PSOpenAPITools => DomainListResponse' | Write-Debug
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        $JsonParameters = ConvertFrom-Json -InputObject $Json

        # check if Json contains properties not defined in DomainListResponse
        $AllProperties = ("domains")
        foreach ($name in $JsonParameters.PsObject.Properties.Name) {
            if (!($AllProperties.Contains($name))) {
                throw "Error! JSON key '$name' not found in the properties: $($AllProperties)"
            }
        }

        if (!([bool]($JsonParameters.PSobject.Properties.name -match "domains"))) { #optional property not found
            $Domains = $null
        } else {
            $Domains = $JsonParameters.PSobject.Properties["domains"].value
        }

        $PSO = [PSCustomObject]@{
            "domains" = ${Domains}
        }

        return $PSO
    }

}
