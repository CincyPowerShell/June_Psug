# Don't mock Set-Variable
# Use a function instead

# .\Script.ps1
function Get-Url
{
    param
    (
        $Server,
        $FileName
    )

    "http://$ServerFqdn/$FileName"
}

$ServerFqdn = 'contoso.com'
$Filename = 'test.txt'

# Set-Variable -name url -Value "http://$ServerFqdn/$Filename"
$Url = Get-Url -Server $ServerFqdn -FileName $Filename
Invoke-WebRequest -Uri $url -OutFile "c:\temp\$Filename"

# .\Script.Tests.ps1
Describe 'test' {
    # Mock -CommandName Set-Variable -ParameterFilter {$Name -eq 'Url'} -MockWith {'https://test.contoso.com/test.txt'}
    Mock Get-Url {"https://test.contoso.com/test.txt"}

    It 'download file' {
        .\Script.ps1
        Test-Path c:\temp\test.txt | Should be $true
    }
    It 'download file hash is correct' {
        .\Script.ps1
        (Get-FileHash -Path C:\temp\test.txt).hash | Should be '18478CCFAE2055D8E1497F89EAABD3BD7C616EB3A2195C543EC31907B86E9C6A'
    }
}
