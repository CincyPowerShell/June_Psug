Describe "Variable Scope" {
    $Variable = 1

    It "Variable Exists" {
        $Variable | Should Be 1
    }
}

Describe "Variable doesn't exist" {
    It "Variable exists" {
        $Variable | Should Be 1
    }
}
