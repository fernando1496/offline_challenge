*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Open Browser For Test
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window

Close Browser After Test
    Close Browser

Scroll Down
    [Documentation]    Scrolls down the page using JavaScript scrollBy to load more results
    FOR    ${i}    IN RANGE    5    # Scroll multiple times to ensure more content loads
        Execute Javascript    window.scrollBy(0, 1000)    # Scroll down by 1000 pixels
        Sleep    1s    # Pause to let the new content load
    END
