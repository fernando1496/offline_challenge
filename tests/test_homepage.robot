*** Settings ***
Resource   ../pages/homepage.robot
Resource   ../pages/ondemandpage.robot
Resource   ../pages/moviespage.robot
Resource   ../pages/moviepage.robot 
Resource   ../resources/common.robot

Suite Setup    Open Browser For Test    https://telustvplus.com
Suite Teardown    Close Browser After Test

*** Test Cases ***
Test Close Popup, Click On Demand, and Scroll to Movies
    [Documentation]    Open homepage, close pop-up, click 'On Demand', scroll to Movies section, filter by 'Animated', find and click subtitle with 'E', and verify movie rating contains 'E' before the first '|'.
    Open Homepage    https://telustvplus.com
    Verify And Close Popup
    Verify On Demand Button And Click
    Scroll To Movies Section
    Filter And Apply Animated
    Find And Click Subtitle With E  
    Verify E Rating On Movie Page
    Sleep    5s
