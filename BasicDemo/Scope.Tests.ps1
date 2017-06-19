Describe "Variable Scope" {
    $Variable = 1

    It "Variable exists" {
        $Variable | Should Be 1
    }
}

Describe "Variable doesn't exist" {
    It "Variable does not exist" {
        $Variable | Should BeNullOrEmpty
    }
}
