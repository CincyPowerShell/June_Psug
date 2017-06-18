# Cincinnati PowerShell User Group
# June 2017 - Introduction to Pester

---

## About

- Matt McNabb
- mmcnabb@outlook.com
- @mcnabbmh
- https://github.com/mattmcnabb

---

## What is Pester?

+++

![](assets/Pester.png)

- A unit testing framework for testing PowerShell scripts (it's a DSL ) |
- Written with PowerShell |
- Included in Windows |
- Used by the PowerShell Team |
- Pester is tested with Pester |

---

## Pester Story

+++

- Created by Scott Muc |
- Maintained by Dave Wyatt and Jakub Jares |
- First truly open-source/community software included in Windows |

---

## How to Get Pester?

+++

Windows does not contain the current version

```powershell
Install-Module Pester
```

---

## How to Use Pester

+++

- Formal: `Invoke-Pester`
- Ad-Hoc: just run a script containing tests
- Other: create test functions or parameterized scripts

---

## What is Unit Testing?

+++

- Methodology for programmatically testing software |
- One part of a full testing process |
- Isolates the most basic "units" of code |
- Validates the correctness of the code |

---

## Concepts/Theory

+++

### Test-Driven Development (TDD)

Write your tests before your implementation

+++

### Behavior-Driven Development (BDD)

Write your tests in simple, natural language

Black box testing

+++

### AAA Pattern
Arrange -> Act -> Assert

---

## Tell Me More...
![](assets/willy-wonka.jpg)

+++

- Find problems automatically |
- Confidence/Evidence |
- Prevent regression bugs |
- Makes code maintenance easier |

---

## A Simple Example

+++

```powershell
Describe "Demo" {
    It "is true" {
        $true | Should Be $true
    }
}
```

---

## Pester Features

+++

- Scriptblocks
- Assertions
- Mocking
- TestDrive
- Code Coverage

---

## Scriptblocks
Define a scope for mocks, drives, and variables

+++

### It
Defines an assertion

```powershell
It "outputs 1" { Get-Number -Number 1 | Should Be 1 }
```

+++

```powershell
It -Name "outputs 1" -Test { Get-Number -Number 1 | Should Be 1 }
``` 

+++

### It Parameters
- Skip

Don't run this test - not implented yet

```powershell
It "outputs 1" { Get-Number -Number 1 | Should Be 1 } -Skip
```

- TestCases

```powershell
$TestCases = @(
    @{ num = 1 }
    @{ num = 2 }
)

It "outputs <num>" -testcases $TestCases {
    Get-Number -Number $num | Should Be $num
}
```

+++

### Describe
The highest level scope for Pester (required)

```powershell
Describe "Get-Number" {
    It "Outputs a 1" {
        Get-Number -Number 1 | Should Be 1
    }

    It "Outputs a 2" {
        Get-Number -Number 2 | Should Be 2
    }
}
```

+++

### Context
A nested scope within a Describe

```powershell
Describe "Get-Number" {
    Context "outputs numbers" {
        It "outputs a number" {
            Get-Number -Number 1 | Should Be 1
        }
    }

    Context "negation" {
        It "negates a number" {
            Get-Number -Number 1 -Negate | Should Be -1
        }
    }
}
```
---

## Assertions

+++

## Should
defines an assertion

+++

### Should Operators

+++

### Be

equivalence assertion

```powershell
# passes
It "outputs a number" { Get-Number -Number 1 | Should Be 1 }

# fails
It "outputs a number" { Get-Number -Number 1 | Should Be 2 }
```

+++

### BeExactly

case-sensitive equivalence assertion

```powershell
# passes
It "matches lower" { 'string' | Should BeExactly 'string' }

# fails
It "matches upper" { 'string' | Should BeExactly 'String' }
```

+++

### BeOfType

output is a particular data type

```powershell
# passes
It "outputs a number" { Get-Number -Number 1 | Should BeOfType [int] }

# fails
It "outputs a number" { Get-Number -Number 1 | Should BeOfType [double] }
```

+++

### Match

regex equivalence assertion

```powershell
# passes
It "matches super" { 'SuperMan' | Should Match 'Super' }

# fails
It "matches woman" { 'SuperMan' | Should Match 'Woman' }
```

+++

### Contain

text match in a file using regex

```powershell
It "contains superman" { Get-Childitem .\file.txt | Should Contain 'SuperMan' }
```
---

## Mocking

- isolate calling code
- simulate the output of a command
- prevent state change

```powershell
Mock Get-Content { "The quick brown fox jumps over the lazy dog" }
```

---

## TestDrive

A virtual file system for your test

+++

- test independent of system state
- scoped to the describe block
- created on execution of the describe
- destroyed when execution ends
- referenced via the PS drive "testdrive:\"

---

## Code Coverage
Validate that all your code is tested

---

## Help Driven Development

+++

- Proposed by June Blender
- Use help examples as your module specification
- Design your first tests to validate those examples

---

## Challenges

+++

### Testing is Hard!

+++

- knowing what to test |
- knowing what to expect |
- edge cases |
- mocking |
- tests don't match realistic conditions |
- organizing code to fit unit tests |

+++

### Extra Effort

3-5 times as much test code as production code

+++

### Integration

Unit tests are good, but units don't work together

---

## Demo

---

## Other Ways To Run Pester Tests

+++

### Continuous Integration Platforms
- Appveyor
- Team City
- Visual Studio Team Services

---

## Leveraging Your Editor

+++

### Visual Studio Code
- Tasks
- Problem Matchers
- Code Lens

---

### Visual Studio
- Test Explorer

---

## Other Uses For Pester

+++

- Operational Validation/Infrastructure Testing |
- Integration Tests |
- Testing an API? |
- Anything that can be tested programmatically |

---

## Links

+++

[Pester](https://github.com/pester/pester)

[The Pester Book](https://leanpub.com/pesterbook)

[Michael Sorens Blog](https://www.simple-talk.com/sysadmin/powershell/practical-powershell-unit-testing-getting-started)

[PowerShell Magazine](http://www.powershellmagazine.com/tag/pester)

[June Blender](https://www.youtube.com/watch?v=gssAtCeMOoo&feature=youtu.be&list=PLDCEho7foSoruQ-gL5GJw-lRkASPJOukl)

[Pester Dashboard](https://github.com/doesitscript/PSPesterDashboardKickstarter)

[Clean Code](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882/ref=sr_1_6?ie=UTF8&qid=1496976520&sr=8-6&keywords=unit+testing)

[Pester Story](http://scottmuc.com/growing-an-open-source-project-the-pester-story)