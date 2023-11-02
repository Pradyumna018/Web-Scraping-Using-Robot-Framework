*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${page_title}  https://stackoverflow.com/

*** Test Cases ***
LoginTest
#    Create Webdriver    chrome  executable_path="C:\Users\mohan\Downloads\chromedriver_win32\chromedriver.exe"
    Open Browser    ${page_title}     ${browser}
    LogInToApplication
    CheckingTitle
    CapturePage

SuccFully Login to your Website
    Close Browser

*** Keywords ***
LogInToApplication
    Maximize Browser Window
    Sleep    2sec
    Click Link    xpath://a[@class='s-topbar--item s-topbar--item__unset s-btn s-btn__filled ws-nowrap js-gps-track']
    Sleep    2sec
    Input Text    id:email    mohanty.subha176@gmail.com
    Sleep    2sec
    Input Text    id:password    Apple@24789
    Sleep    2sec
    Click Button    xpath://button[@id='submit-button']
    Sleep    2sec
    Click Button    xpath://button[@class="flex--item6 s-btn s-btn__primary js-accept-cookies js-consent-banner-hide"]
    Sleep    2sec

CheckingTitle
    #Check and Verify Page Title
    Go To    ${page_title}
    ${actual_title}    Get Title
    ${expected_title}    Set Variable    Stack Overflow - Where Developers Learn, Share, & Build Careers   # Set your expected page title here
    Should Be Equal As Strings    ${expected_title}    ${actual_title}

CapturePage
    Capture Element Screenshot      xpath://span[@class='-img _glyph']      logo.png
    Capture Page Screenshot     screenshot.png
