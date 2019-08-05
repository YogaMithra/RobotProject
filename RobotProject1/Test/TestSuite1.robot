[Documentation]
...    To run particular test in command Line
...    Right click the project and copy the location and then open the cmd prompt, in that type 
...    cd copied location
...    then need to run the command robot -t TestName TestSuite
...    For this program use "robot -t FirstSeleniumTest Test\TestSuite1.robot"
...    
...    To run all the test cases in command line
...    For this program use "robot Test\TestSuite1.robot"
...    
...    To setup the tag --settag=tagname
...    For this program use "robot -t SampleLoginTest --settag=regression2 Test\TestSuite1.robot"
...    
...    To run the specific tag
...    1. For this program use "robot --include Smoke Test\TestSuite1.robot"
...    
...    To run multiple tags
...    2. For this program use "robot -i Sanity -i Smoke -i Regression1 Test\TestSuite1.robot"
...    
...    To exclude particular tag
...    3. For this program use "robot -e Smoke Test\TestSuite1.robot"
...    
...    To include and exclude particular tag
...    4. For this program use "robot -e Smoke -i Sanity Test\TestSuite1.robot"

*** Settings ***
Library       SeleniumLibrary    

Suite Setup    Log    Inside Test Suite Setup
Suite Teardown    Log    Inside Test suite Teardown    
Test Setup    Log    Inside Test Setup
Test Teardown    Log    Inside Test Teardown     

Default Tags    Sanity
       

*** Test Cases ***

My First Test case
    [Tags]    Smoke
    
    Log    Hello World    
    

FirstSeleniumTest
    Set Tags    Regression1
    Open Browser    https://www.google.com    chrome    
    Set Browser Implicit Wait    5
    Input Text    name=q    automation step by step
    Press Keys    name=q    ENTER
    # Click Button    btnK
    Sleep    2    
    Close Browser
    Log    Test Completed    
    
SampleLoginTest
    Set Tags    Regression2
    Remove Tags    Regression2
    [Documentation]    This is sample login test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKeyword
    Click Element    id=welcome     
    Click Element    link=Logout  
    Close Browser
    Log    TestCompleted
    Log    This test was executed by %{username} on %{os}      
    

MySampletest
    Log    TestGit
    
*** Variables ***


# Scalar Variable
 ${URL}    https://opensource-demo.orangehrmlive.com/
# List Variable
@{CREDENTIALS}    Admin    admin123
# Dictionary Variable
&{LOGINDATA}    username=Admin    password=admin123


*** Keywords ***

LoginKeyword
    Input Text    id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin 