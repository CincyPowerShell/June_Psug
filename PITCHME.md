## What is Pester?

+++

- A unit testing framework for testing PowerShell scripts (it's a DSL :frowning:)
- Written with PowerShell
- Included in Windows
- Used by the PowerShell Team
- Pester is tested with Pester

---

## Pester Story

+++

- Created by Scott Muc
- Maintained by Dave Wyatt and Jakub Jares
- First truly open-source/community software included in Windows

---

## How to Get Pester?

+++

- Windows does not contain the current version
- Run `Install-Module Pester`

---

## What is Unit Testing?

+++

- Methodology for programmatically testing software
- One part of a full testing process
- Isolates the most basic "units" of code
- Validates the correctness of the code

---

## Concepts/Theory

+++

### Test-Driven Development (TDD)
Write your tests before your implementation

+++

### Behavior-Driven Development (BDD)
Write your tests in simple, natural language

---

## Tell Me More...
![](assets/willy-wonka.jpg)

+++

- Find problems automatically
- Confidence/Evidence
- Prevent regression bugs
- Makes code maintencance easier

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

+++

### It
- test cases
- tags

+++

### Describe

+++

### Context

---

## Assertions

+++

## Should

+++

## Be

+++

## BeOfType

+++

## BeExactly

+++

## Match

+++

## Contain

---

## Mocking

---

## TestDrive

---

## Code Coverage

---

## Testing a Function

---

## Testing a Module

---

## Help Driven Development

+++

- Proposed by June Blender
- Use help examples as your module specification
- Design your first tests to validate those examples

## Challenges

+++

### Testing is Hard!

+++

- knowing what to test
- knowing what to expect
- edge cases
- mocking
- tests don't match realistic conditions
- organizing code to fit unit tests

+++

### Extra Effort
3-5 times as much test code as production code

+++

### Integration
Unit tests are good, but units don't work together

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

- Operational Validation/Infrastructure Testing
- Integration Tests
- Testing an API?
- Anything that can be tested programmatically

---

## Links

+++

[Pester](https://github.com/pester/pester)
[Pester Dashboard](https://github.com/doesitscript/PSPesterDashboardKickstarter)
[June Blender](https://www.youtube.com/watch?v=gssAtCeMOoo&feature=youtu.be&list=PLDCEho7foSoruQ-gL5GJw-lRkASPJOukl)
