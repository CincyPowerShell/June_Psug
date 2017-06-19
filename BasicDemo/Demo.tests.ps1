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

    It "outputs 1" { Get-Number -Number 1 | Should Be 1 } -Skip

    $TestCases = @(
        @{ num = 1 }
        @{ num = 2 }
    )

    It "outputs <num>" -testcases $TestCases {
        param ($num)
        Get-Number -Number $num | Should Be $num
    }

    # fails
    It "outputs a number" { Get-Number -Number 1 | Should Be 2 }

    # passes
    It "outputs type [int]" { Get-Number -Number 1 | Should BeOfType [int] }

    # fails
    It "outputs type [double]" { Get-Number -Number 1 | Should BeOfType [double] }
}

Describe "strings" {
    # passes
    It "matches lower" { 'string' | Should BeExactly 'string' }

    # fails
    It "matches upper" { 'string' | Should BeExactly 'String' }

    # passes
    It "matches eight chars" { 'SuperMan' | Should Match '\w{8}' }

    # fails
    It "matches nine chars" { 'SuperMan' | Should Match '\w{9}' }
}
