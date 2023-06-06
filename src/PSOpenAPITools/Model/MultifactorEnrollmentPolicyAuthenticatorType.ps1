#
# Okta Management
# Allows customers to easily access the Okta Management APIs
# Version: 3.0.0
# Contact: devex-public@okta.com
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.SYNOPSIS

Enum MultifactorEnrollmentPolicyAuthenticatorType.

.DESCRIPTION

No description available.
#>

enum MultifactorEnrollmentPolicyAuthenticatorType {
    # enum value: "custom_app"
    custom_app
    # enum value: "custom_otp"
    custom_otp
    # enum value: "duo"
    duo
    # enum value: "external_idp"
    external_idp
    # enum value: "google_otp"
    google_otp
    # enum value: "okta_email"
    okta_email
    # enum value: "okta_password"
    okta_password
    # enum value: "okta_verify"
    okta_verify
    # enum value: "onprem_mfa"
    onprem_mfa
    # enum value: "phone_number"
    phone_number
    # enum value: "rsa_token"
    rsa_token
    # enum value: "security_question"
    security_question
    # enum value: "symantec_vip"
    symantec_vip
    # enum value: "webauthn"
    webauthn
    # enum value: "yubikey_token"
    yubikey_token
}
