function Should-BeNullOrEmpty {

  [CmdletBinding()]
  param(
    [Parameter(ValueFromPipeline=$TRUE)]
    $value
  )             

  if (($value -ne $null) -and ($value -ne "") -and ($value -gt 0)) {
    throw New-Object PesterFailure("Expected the value to be null or empty", "Got $value")
  }
}

Describe "Should-BeNullOrEmpty" {

Context("when dealing with an array") {
 It "throws a PesterFailure when the variable is an array with an element" {
      $nonNullArray = @("Element1")

      try {
       Should-BeNullOrEmpty $nonNullArray
        $failure_thrown = $false
      } catch {
        $failure_thrown = $true
      }

      $failure_thrown.should.be($true)
    }

    It "passes the test when the array is empty" {
        $emptyArray = @()

      try {
       Should-BeNullOrEmpty $emptyArray
        $failure_thrown = $false
      } catch {
        $failure_thrown = $true
      }

      $failure_thrown.should.be($false)
    }

}

Context("when dealing with strings") {

It "throws a PesterFailure when the variable has a string value" {
      $string = "this is a non empty string"

      try {
       Should-BeNullOrEmpty $string
        $failure_thrown = $false
      } catch {
        $failure_thrown = $true
      }

      $failure_thrown.should.be($true)
    }

    It "passes the test when the string is empty" {
        $string = ""

      try {
       Should-BeNullOrEmpty $string
        $failure_thrown = $false
      } catch {
        $failure_thrown = $true
      }

      $failure_thrown.should.be($false)
    }
}  
}
