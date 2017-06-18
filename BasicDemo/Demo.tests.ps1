# demos from the presentation

Describe "Demo" {
    It "is true" {
        $true | Should Be $true
    }
}

function Get-Number
{
    param
    (
        [int]
        $Number
    )

    $Number
}

Describe "Get-Number" {
    It "outputs 1" { Get-Number -Number 1 | Should Be 1 }

    It -Name "outputs 1" -Test { Get-Number -Number 1 | Should Be 1 }

    It "outputs 1" { Get-Number -Number 1 | Should Be 1 } -Skip

    $TestCases = @(
        @{ num = 1 }
        @{ num = 2 }
    )

    It "outputs <num>" -testcases $TestCases {
        param ($num)
        Get-Number -Number $num | Should Be $num
    }

    It "outputs a number" { Get-Number -Number 1 | Should Be 2 }

    It "outputs type [int]" { Get-Number -Number 1 | Should BeOfType [int] }

    It "outputs type [double]" { Get-Number -Number 1 | Should BeOfType [double] }
}

Describe "strings" {
    It "matches lower" { 'string' | Should BeExactly 'string' }

    It "matches upper" { 'string' | Should BeExactly 'String' }

    It "matches super" { 'SuperMan' | Should Match 'Super' }

    It "matches woman" { 'SuperMan' | Should Match 'Woman' }
}
