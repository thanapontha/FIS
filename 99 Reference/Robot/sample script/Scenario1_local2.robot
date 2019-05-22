*** Settings ***
Resource          common2.txt

*** Variable ***
${Prefix_Scenario}    Scenario1_local
${System_URL}     http://localhost:8080/kv0-web/

*** Test Cases ***
Access System
    [Documentation]    Access TIM System
    [Tags]    OK
    Open Browser    about:blank    ie
    Go To    ${System_URL}
    Maximize Browser Window

System Master Search (Found Data)
    [Documentation]    System Master Search (Found Data)
    [Tags]    OK
    Set Suite Variable    ${image_Prefix}    ${Prefix_Scenario}_System Master Search - Seach found data
    Go To    ${System_URL}/master/systemMaster
    Select From List By Value    name=categorySearch    LIST
    Select From List By Value    id=subCategorySearch    INS_CLASS
    Input Text    id=codeSearch    C0*
    Click Button    id=WST33060Search
    ${curDate}=    Get Current Date    result_format=%Y%m%d%H%M%S
    Capture Page Screenshot    ${image_Prefix}_${curDate}-{index}.png

System Master Search (Edit)
    [Documentation]    System Master Search (Edit)
    [Tags]    OK
    Set Suite Variable    ${image_Prefix}    ${Prefix_Scenario}_System Master Search - Edit data
    Select Checkbox Datatable    id=checkbox2ctrl1
    Click Button    id=WST33060Edit
    ${curDate}=    Get Current Date    result_format=%Y%m%d%H%M%S
    Capture Page Screenshot    ${image_Prefix}_${curDate}-{index}.png
    Click Button    id=WST33060Cancel
    ${curDate}=    Get Current Date    result_format=%Y%m%d%H%M%S
    Capture Page Screenshot    ${image_Prefix}_${curDate}-{index}.png
    Click Button    id=WST3Cancel
    Input Text    id=remark    Update2 Configuration for authorized to access each report by company : All / TDEM / TMAP-MS
    Input Text    id=value    2nd class
    Click Button    id=WST33060Save
    Click Button    id=WST3Ok
    Check Message    ${info_msg_div}    MSTD0101AINF: Saving data is completed successfully.

*** Keywords ***
