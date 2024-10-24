*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MOVIES_SECTION}    xpath=//*[text()='Movies']

*** Keywords ***
Scroll To Movies Section
    [Documentation]    Scrolls until the 'Movies' section is visible and clicks it
    Wait Until Element Is Visible    ${MOVIES_SECTION}    15s
    Scroll Element Into View    ${MOVIES_SECTION}
    Element Should Be Visible    ${MOVIES_SECTION}
    Click Element    ${MOVIES_SECTION}
