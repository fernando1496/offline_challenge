*** Settings ***
Library    SeleniumLibrary
Library    ../venv/lib/site-packages/robot/libraries/String.py

*** Variables ***
${PARENT_LOCATOR}    xpath=//h2[@data-testid='wallContentCategory' and contains(@class, 'details-badge-wrap')]    # Parent <h2> element
${METADATA_LOCATOR}  xpath=//h2[@data-testid='wallContentCategory' and contains(@class, 'details-badge-wrap')]//span[contains(@class, 'no-scores-line-metadata')]    # Child <span> element inside the parent

*** Keywords ***
Verify E Rating On Movie Page
    [Documentation]    Verifies that the movie rating contains 'E' before the first '|'
    
    # Verify the parent element exists
    Wait Until Element Is Visible    ${PARENT_LOCATOR}    10s    # Wait until the parent element is visible
    Log To Console    Parent element located.

    # Now get the metadata text from the child element
    ${metadata_text}=    Get Text    ${METADATA_LOCATOR}    # Get the text of the metadata element inside the parent
    Log To Console    Movie metadata text: ${metadata_text}
    
    # Split the text by the first '|' and extract the rating part
    ${parts}=    Split String    ${metadata_text}    |    # Split the text by the first '|'
    ${rating}=    Strip String    ${parts[0]}    # The rating is the part before the first '|'
    
    Log To Console    Extracted rating: ${rating}
    
    # Validate that the rating contains 'E'
    Should Contain    ${rating}    E    # Verify that the rating contains 'E'

    Log To Console    Verified that the rating contains 'E' before the first '|'.