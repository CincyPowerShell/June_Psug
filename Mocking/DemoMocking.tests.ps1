<#
    .NOTES
    Mocking replaces the output of a command with 
#>

function Get-ReplacementText
{
    [CmdletBinding()]
    [OutputType([string])]
    param
    (
        [Parameter(Mandatory = $true)]
        [string]
        $Path,

        [string]
        $ToReplace,

        [string]
        $ReplaceWith
    )
    
    $Text = Get-Content -Path $Path
    $Text -replace $ToReplace, $ReplaceWith
}

Describe "Get-ReplacementText" {
    $Start = "The quick brown fox jumps over the lazy dog"
    $Result = "The quick brown ostrich jumps over the lazy dog"

    Mock Get-Content { $Start }

    It "replaces text" {
        Get-ReplacementText -Path c:\temp\file.txt -ToReplace 'fox' -ReplaceWith 'ostrich' | Should Be $Result
    }

    It "doesn't replace text" {
        Get-ReplacementText -Path c:\temp\file.txt -ToReplace 'fox' -ReplaceWith 'ostrich' | Should Be $Start
    }
}
