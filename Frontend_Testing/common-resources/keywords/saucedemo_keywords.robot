*** Settings ***
Documentation   Specific keywords used on the test suite: "saucedemo.robot" script.

Resource   ${CURDIR}${/}login_keywords.robot

*** keywords ***
Add "${itemName}" item to cart   

    ${itemName}=    Convert To Lower Case    ${itemName}
    ${itemName}=    Replace String    ${itemName}     ${SPACE}   -    
    ${xpathItemInStore}=  Replace String    ${xpathItemInStore}    nameOftheProduct    ${itemName}

    Click button     ${xpathItemInStore}

    

Remove "${itemName}" item from the cart

    ${itemName}=    Convert To Lower Case    ${itemName}
    ${itemName}=    Replace String    ${itemName}     ${SPACE}   -    
    ${xpathRemoveItem}=  Replace String    ${xpathRemoveItem}    nameOftheProduct    ${itemName}

    Click button     ${xpathRemoveItem}
    


Open cart

    Click Element    ${shoppingCarElement}
    


Click all items button     

    Open Left Menu
    Click Element    ${xpathAllItemsButton}
    Wait Until Location Is    ${urlInventory}   timeout=5s
    


Change sort order
    [Arguments]    ${sortOrder}
    
    ${xpathDropDownListOption}=   Replace String    ${xpathDropDownListOption}    optionList    ${sortOrder}
    
    Click Element    ${xpathDropDownListOption}



Get the price of all items
    [Documentation]  Creates a dictionary test variables which
    ...              relates the name of the item with its price.

    &{itemsNamesAndPricesDictionary}=   Create Dictionary
    @{allItemsNames}=    Get list of the names of the items 

    FOR  ${itemName}  IN  @{allItemsNames}
      ${itemPrice}=       Get item price    ${itemName}
      Set to Dictionary   ${itemsNamesAndPricesDictionary}    ${itemName}   ${itemPrice}
    END

      Set Test Variable    ${itemsNamesAndPricesDictionary}



Get list of the names of the items

    @{itemsNamesList}=   Create List
    @{itemsNamesWebElementsList}=   Get WebElements   ${xpathInventoryItemName}

    FOR   ${itemNameDiv}   IN   @{itemsNamesWebElementsList}
      ${itemName}=    Get Text    ${itemNameDiv}
      Append To List    ${itemsNamesList}    ${itemName}
    END

    [Return]    ${itemsNamesList}



Sum of values
    [Arguments]   @{listOfItemsPrices}
    
    ${totalPriceOftheItems}=  Set Variable
    
    FOR   ${itemPrice}   IN    @{listOfItemsPrices}
        ${itemPrice}=    Remove String   ${itemPrice}    $
        ${totalPriceOftheItems}=    Evaluate   ${totalPriceOftheItems} + ${itemPrice}    
    END
    
    [Return]   ${totalPriceOftheItems} 

        
    
Get the quantity of a item to buy
    [Arguments]     ${itemName}

    ${xpathItemQuantity}=   Replace String    ${xpathItemQuantity}    nameOftheProduct    ${itemName}
    ${itemQuantity}=    Get Text    ${xpathItemQuantity}
    
    [Return]    ${itemQuantity}
    


Get item price
    [Arguments]    ${itemName}     ${xpath_item_price}=${xpathItemPrice}    

    ${xpathItemPrice}=   Replace String    ${xpath_item_price}    nameOftheProduct    ${itemName}
    ${itemPrice}=    Get Text    ${xpath_item_price}

    [Return]    ${itemPrice}



Go to the checkout page

    Click button    ${xpathCheckoutButton}
    Wait Until Location Is   ${urlCheckout}          timeout=5s



Go to the checkout:overview page

    Click Button  ${checkoutContinueButton}
    Wait Until Location Is   ${urlCheckoutOverview}   timeout=5s      



Go to the checkout page input customer data and go to checkout:overview
    [Arguments]    ${firstName}     ${lastname}     ${postalCode} 

    Go to the checkout page
    Input Text    ${checkoutFirstName}   ${firstName}
    Input Text    ${checkoutLastName}    ${lastname}
    Input Text    ${checkoutPostalCode}  ${postalCode}
    Go to the checkout:overview page



Get total value on the checkout:overview page

    ${totalPriceValueCheckoutPage}=   Get Text    ${xpathTotalPriceValueCheckoutPage}

    #  the total value begins with: "Total: " meaning that this substring needs to be removed
    ${totalPriceValueCheckoutPage}=   Remove String    ${totalPriceValueCheckoutPage}    Total:${Space}
    
    [Return]    ${totalPriceValueCheckoutPage}

    

Open Left Menu

    Click Button    ${xpathOpenMenuButton}



Validate the quantity of a item
    [Arguments]     ${itemToBuy}      ${expectedQuantityOfTheItemToBuy}   

    ${itemQuantityInTheShoppingCar}=   Get the quantity of a item to buy    ${itemToBuy}
    Should Be Equal As Strings    ${expectedQuantityOfTheItemToBuy}    ${itemQuantityInTheShoppingCar}

    
    
Validate the subtotal price on the checkout:overview page
    [Arguments]   ${expectedSubTotalPrice}

    ${subTotalPrice}=    Get Text    ${xpathSubTotalPriceCheckoutPage}
    ${subTotalPrice}=   Remove String    ${subTotalPrice}    Item total:${Space}

    Should Be Equal As Strings   ${subTotalPrice}    $${expectedSubTotalPrice}



Validate the total price on the checkout:overview page
    [Arguments]     ${expectedTaxValue}     ${totalPriceOftheItems}
    
    ${totalPriceValueCheckoutPage}=    Get total value on the checkout:overview page

    # calculate the sum of the expected tax value plus the subtotal price of the Items
    ${expectedItemTotalPrice}=  Evaluate    round((${totalPriceOftheItems} + ${expectedTaxValue}),2)

    Should Be Equal As Strings    $${expectedItemTotalPrice}    ${totalPriceValueCheckoutPage}



Validate the prices of the items
    [Arguments]        @{listOfItemsNames} 
    
    FOR    ${itemName}  IN  @{listOfItemsNames}
      ${itemPrice}=   Get item price    ${itemName}     xpath_item_price=${xpathItemPriceCheckoutOverview}
      Should Be Equal As Strings        ${itemPrice}    ${itemsNamesAndPricesDictionary['${itemName}']}
    END



Validate the names of the items
    [Arguments]    @{expectedListOfItemsNames}
    
    @{listOfItemsNames}=   Get list of the names of the items
    
    Lists Should Be Equal    ${listOfItemsNames}    ${expectedListOfItemsNames}



Validate that the cart is empty

    Open cart
    ${count}=	Get Element Count	 class:cart_item
    Should Be Equal As Strings    ${count}    0



Validate total number of items
    [Arguments]    ${totalNumberOfItemsToBuy}
  
    # validating number of elements in the shopping car
    Element Text Should Be        ${xpathShoppingCarElement}    ${totalNumberOfItemsToBuy}

    ${count}=	Get Element Count	 class:cart_item
    Should Be Equal As Strings    ${count}    ${totalNumberOfItemsToBuy}



Validate the tax value on the checkout:overview page
    [Arguments]      ${expectedTaxValue}

    #  getting the value of the tax in the checkout page
    ${taxValueCheckoutPage}=   Get Text    ${xpathTaxCheckoutPage}

    #  the value of the tax begins with: "Tax: " meaning that this substring needs to be removed
    ${taxValueCheckoutPage}=   Remove String    ${taxValueCheckoutPage}    Tax:${Space}

    Should Be Equal As Strings    $${expectedTaxValue}    ${taxValueCheckoutPage}
    


Go to checkout:complete page and validate successful order completion

    Go to checkout:complete page
    Page Should Contain Element    ${xpathThankYouOrder}
    


Go to checkout:complete page    

    Click Element   ${xpathFinishButtonCheckoutPage}
    Wait Until Location Is    ${urlCheckoutComplete}   timeout=5s
    


Go to inventory page
    
    Click Button   ${xpathBackHomeButton}
    Wait Until Location Is    ${urlInventory}   timeout=5s