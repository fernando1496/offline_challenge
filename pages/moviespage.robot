*** Settings ***
Library    SeleniumLibrary
Library    ../venv/lib/site-packages/robot/libraries/String.py
Resource    ../resources/common.robot

*** Variables ***
${SUBTITLE_LOCATOR}      css:.subtitle
${FILTER_BUTTON}         xpath=//*[text()='Filter']
${ANIMATED_OPTION}       xpath=//*[text()='Animated']
${APPLY_BUTTON}          xpath=//*[text()='Apply']

*** Keywords ***
Find And Click Subtitle With E
    [Documentation]    Scrolls through lazy loading results until it finds a subtitle containing 'E' and clicks it
    [Arguments]    ${max_scrolls}=5   # Optional safeguard for the maximum number of scrolls
    ${found}=    Set Variable    False    # Initialize ${found} to False at the beginning
    ${scroll_attempts}=    Set Variable    0    # Initialize scroll counter
    WHILE    '${found}' == 'False' and ${scroll_attempts} < ${max_scrolls}   # Add condition to stop at max scrolls
        ${elements}=    Get WebElements    ${SUBTITLE_LOCATOR}    # Get all subtitle elements
        FOR    ${element}    IN    @{elements}
            ${text}=    Get Text    ${element}
            ${text}=    Strip String    ${text}    # Remove any leading/trailing spaces
            Run Keyword If    'E' in '${text}'    Log To Console    Found subtitle containing 'E': ${text}
            Run Keyword If    'E' in '${text}'    Set Variable    ${found}    True    # Set ${found} to True if 'E' is found
            Exit For Loop If    '${found}' == 'True'    # Exit loop if found
        END
        IF    '${found}' == 'True'
            BREAK
        END
        ${scroll_attempts}=    Evaluate    int(${scroll_attempts}) + 1    # Increment scroll attempts by converting to integer
        Scroll Down    # Scroll down if 'E' is not found
        Sleep    2s    # Pause between scrolls for loading
    END

    # Re-locate elements and click on the one containing 'E'
    ${elements}=    Get WebElements    ${SUBTITLE_LOCATOR}    # Re-locate all subtitle elements
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        ${text}=    Strip String    ${text}
        Run Keyword If    'E' in '${text}'    Scroll Element Into View    ${element}    # Scroll to the element if found
        Run Keyword If    'E' in '${text}'    Click Element    ${element}    # Click the element containing 'E'
        Exit For Loop If    'E' in '${text}'    # Exit loop after clicking the correct element
    END

Filter And Apply Animated
    [Documentation]    Clicks on Filter, selects the 'Animated' option, and applies the filter
    Log To Console    Clicking the Filter button
    Click Element    ${FILTER_BUTTON}    # Click the Filter button
    Sleep    2s    # Wait for the filter options to load

    Log To Console    Selecting 'Animated' filter
    Click Element    ${ANIMATED_OPTION}    # Click the 'Animated' filter option
    Sleep    2s    # Wait for the option to be selected

    Log To Console    Clicking the Apply button
    Click Element    ${APPLY_BUTTON}    # Click the Apply button
    Sleep    2s    # Wait for the filter to be applied
