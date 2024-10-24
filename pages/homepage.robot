*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CLOSE_MODAL}        css:.close-modal
${ON_DEMAND_BUTTON}   xpath=//a[contains(text(),'On Demand')]

*** Keywords ***
Open Homepage
    [Arguments]    ${url}
    Go To    ${url}
    Maximize Browser Window

Verify And Close Popup
    [Documentation]    Verifies the pop-up is visible and closes it
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${CLOSE_MODAL}    10s
    Element Should Be Visible    ${CLOSE_MODAL}
    Click Element    ${CLOSE_MODAL}

Verify On Demand Button And Click
    [Documentation]    Verifies the On Demand button is visible and clicks it
    Wait Until Element Is Visible    ${ON_DEMAND_BUTTON}    10s
    Element Should Be Visible    ${ON_DEMAND_BUTTON}
    Click Element    ${ON_DEMAND_BUTTON}
