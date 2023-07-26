# Okta.PowerShell - The PowerShell CLI for the Okta Management API

* [Release status](#release-status)
* [Need help?](#need-help)
* [Getting started](#getting-started)
* [Usage guide](#usage-guide)
* [Contributing](#contributing)

This repository contains the Okta management PowerShell CLI. This CLI can be used to easily interact with the Okta management API and:
 
* Create and update users with the [Users API](https://developer.okta.com/docs/api/resources/users)
* Add security factors to users with the [Factors API](https://developer.okta.com/docs/api/resources/factors)
* Manage groups with the [Groups API](https://developer.okta.com/docs/api/resources/groups)
* Manage applications with the [Apps API](https://developer.okta.com/docs/api/resources/apps)
* Manage logs with the [Logs API](https://developer.okta.com/docs/api/resources/system_log)
* Manage sessions with the [Sessions API](https://developer.okta.com/docs/api/resources/sessions)
* Manage templates with the [Custom Templates API](https://developer.okta.com/docs/reference/api/templates/)
* Manage identity providers with the [Identity Providers API](https://developer.okta.com/docs/reference/api/idps/)
* Manage authorization servers with the [Authorization Servers API](https://developer.okta.com/docs/reference/api/authorization-servers/)
* Manage event hooks with the [Event Hooks Management API](https://developer.okta.com/docs/reference/api/event-hooks/)
* Manage inline hooks with the [Inline Hooks Management API](https://developer.okta.com/docs/reference/api/inline-hooks/).
* Manage features with the [Features API](https://developer.okta.com/docs/reference/api/features/).
* Manage linked objects with the [Linked Objects API](https://developer.okta.com/docs/reference/api/linked-objects/).
* Manage trusted origins with the [Trusted Origins API](https://developer.okta.com/docs/reference/api/trusted-origins/).
* Manage user types with the [User Types API](https://developer.okta.com/docs/reference/api/user-types/).
* Manage custom domains with the [Domains API](https://developer.okta.com/docs/reference/api/domains/).
* Manage network zones with the [Zones API's endpoints](https://developer.okta.com/docs/reference/api/zones/).
* Much more!

> Note: For more details about the APIs and models the SDK support, check out the [API docs](/API_README.md) 

## Release status

This library uses semantic versioning and follows Okta's [library version policy](https://developer.okta.com/code/library-versions/).

| Version | Status                    |
| ------- | ------------------------- |
| 0.x.0-beta | :warning: Beta |
 
The latest release can always be found on the [releases page][github-releases]. For more information about our SDKs' lifecycle, check out [our docs](https://developer.okta.com/code/library-versions/).

## Need help?
 
If you run into problems using the Okta PowerShell CLI, you can
 
* Ask questions on the [Okta Developer Forums][devforum]
* Post [issues][github-issues] here on GitHub (for code errors)


## Getting started

This PowerShell module is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 3.0.0
- SDK version: 0.1.0-beta
- Build package: org.openapitools.codegen.languages.PowerShellClientCodegen
    For more information, please visit [https://developer.okta.com/](https://developer.okta.com/)

<a id="frameworks-supported"></a>
## Frameworks supported
- PowerShell 6.2 or later

<a id="installation"></a>
## Installation

To install from the source, run the following command to build and install the PowerShell module locally:
```powershell
Build.ps1
Import-Module -Name '.\src\Okta.PowerShell' -Verbose
```

To avoid function name collision, one can use `-Prefix`, e.g. `Import-Module -Name '.\src\Okta.PowerShell' -Prefix prefix`

To uninstall the module, simply run:
```powershell
Remove-Module -FullyQualifiedName @{ModuleName = "Okta.PowerShell"; ModuleVersion = "0.1.0"}
```

<a id="tests"></a>
## Tests

To install and run `Pester`, please execute the following commands in the terminal:

```powershell
Install-module -name Pester -force

Invoke-Pester
```

For troubleshooting, please run `$DebugPreference = 'Continue'` to turn on debugging and disable it with `$DebugPreference = 'SilentlyContinue'` when done with the troubleshooting.

## Usage guide

### Prerequisites 

The PowerShell CLI uses the [device authorization flow](https://developer.okta.com/docs/guides/device-authorization-grant/main/) to obtain an access token, so it requires, at least, three configuration values. These are the
values for the [Okta Org
domain](https://developer.okta.com/docs/guides/find-your-domain/main/), the client ID of the [OIDC Native Application](https://developer.okta.com/blog/2021/11/12/native-sso) and the scope for the API grants you are gonna need. For example, if you are going to get groups then you will need the grant `okta.group.read` configured in your scope.

### Set your configuration and execute commands 

1. Set your configuration

```sh
$Configuration = Get-OktaConfiguration
$Configuration.BaseUrl = 'https://myorg.okta.com'
$Configuration.ClientId = 'MY_CLIENT_ID'
$Configuration.Scope = "okta.groups.read" # or "okta.groups.read okta.apps.read"
```

2. Authorize your device

```sh
Invoke-OktaEstablishAccessToken
```
> Note: You have to open the browser and navigate to the provided URL to complete the flow. Once the device is authorized, go back to the PowerShell terminal.

3. Invoke commands

```sh
Invoke-OktaListGroups

id                    : 00g9erf7s3ydK79IX5d7
created               : 5/5/23 1:45:05 PM
lastUpdated           : 5/5/23 1:45:05 PM
lastMembershipUpdated : 5/5/23 1:45:05 PM
objectClass           : {okta:user_group}
type                  : OKTA_GROUP
profile               : @{name=Sales; description=}
_links                : @{logo=System.Object[]; users=; apps=}
```

> Note: For more details about commands, check out the [documentation for API endpoints](/API_README.md)

### Get a user

```sh
$User = Get-OktaUser -UserId "foo"
```         

### Create a user

```sh
$UserProfile = [PSCustomObject]@{
                firstName = 'John'
                lastName = 'Doe'
                login = 'john.doe@mail.com'
                email = 'john.doe@mail.com'
            }

$CreateUserRequest = Initialize-OktaCreateUserRequest -VarProfile $UserProfile -GroupIds 'foo'
$TestResult = New-OktaUser -Body $CreateUserRequest
```

### List users

```sh
$Users  = Invoke-OktaListUsers -Limit 10 
```

Use the `-withHttpInfo` flag to get additional response properties, such as, headers to get the next page of results:

```sh
$UsersResponse  = Invoke-OktaListUsers -Limit 10 -withHttpInfo
$NextPageUri = ''

 if ($null -ne $UsersResponse.Headers.Link) {
    foreach($Link in $LocalVarResult.Headers.Link)   {
        # Link looks like '<https://testorg.com/api/v1/users?after=00g9erhe4rJGXhdYs5d7&limit=10>;rel="next"
        if ($Link.Contains('rel="next"')) {
            $LinkValue = $Link.split(";")[0].ToString()
            $NextPageUri = $LinkValue -replace '[<>]',''
        }
    }
}

# HeaderParameters should contain the bearer token available in the $Configuration object
# $HeaderParameters['Authorization'] = "Bearer " + $Configuration["AccessToken"]
# $Method = 'GET'

$NextPageResponse = Invoke-WebRequest -Uri $NextPageUri `
                                -Method $Method `
                                -Headers $HeaderParameters 
```

> Note: We're planning to improve the pagination experience in future releases.

### Create an application

```sh
$OAuthClient = [PSCustomObject]@{
                Client_Uri = "https://example.com/client"
                Logo_Uri = "https://example.com/assets/images/logo-new.png"
                Response_Types = @("token", "id_token", "code")
                Redirect_Uris = @("https://example.com/oauth2/callback", "myapp://callback")
                Post_Logout_Redirect_Uris = @("https://example.com/postlogout", "myapp://postlogoutcallback")
                Grant_Types = @("implicit", "authorization_code")
                Application_Type = "native"
                Tos_Uri = "https://example.com/client/tos"
                Policy_Uri = "https://example.com/client/policy"
            }
# a simple test to create an object
$Settings = Initialize-OktaOpenIdConnectApplicationSettings -OauthClient $OAuthClient

$NewApp = Initialize-OktaOpenIdConnectApplication -Label "New App" -SignOnMode "OPENID_CONNECT" -Settings $Settings

```

> Note: For more API samples checkout our [tests](https://github.com/okta/okta-powershell-cli/tree/main/tests/)

We're happy to accept contributions and PRs! Please see the [contribution guide](CONTRIBUTING.md) to understand how to structure a contribution.

[devforum]: https://devforum.okta.com/
[lang-landing]: https://developer.okta.com/code/dotnet/
[github-issues]: https://github.com/okta/okta-sdk-dotnet/issues
[github-releases]: https://github.com/okta/okta-powershell-cli/releases
[Rate Limiting at Okta]: https://developer.okta.com/docs/api/getting_started/rate-limits