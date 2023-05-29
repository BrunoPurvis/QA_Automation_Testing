*** Settings ***
Documentation   A test suite containing test cases related to the e-commerce website: "https://www.saucedemo.com/"

Resource  ${CURDIR}${/}..${/}common-resources${/}variables${/}variables.robot
Resource  ${CURDIR}${/}..${/}common-resources${/}keywords${/}login_keywords.robot
Resource  ${CURDIR}${/}..${/}common-resources${/}keywords${/}saucedemo_keywords.robot

Suite Setup        Run Keywords
...                Set Selenium Implicit Wait     2s
...      AND       Open Browser    browser=${browser}   url=${urlLogin}
...      AND       Wait Until Location Is   ${urlLogin}     timeout=5s
...      AND       Maximize Browser Window
Suite Teardown     Close all browsers


*** Test Cases ***
Accept_Choose three items_remove one_buy two_as a standard user
    [Documentation]    We go to the e-commerce website: "https://www.saucedemo.com/" and login as a "standard_user".
    ...                The cart is validated as being empty and in the inventory page we get the prices of all the items  
    ...                on a dictionary variable in order to validate those prices in the cart and in the
    ...                checkout:overview page. Three items are chosen to be bought: "Sauce Labs Bike Light",
    ...                "Sauce Labs Backpack" and "Sauce Labs Onesie". At this point, it is validated the added items,
    ...                quantities and prices in the cart. Then, the product "Sauce Labs Onesie" it's removed from the cart
    ...                and the checkout is filled with the customer's information. Next, on the checkout overview, it's
    ...                validated the added items, quantities, prices, the sum of thoses prices and the correspondent tax.
    ...                At this step, the finish button is clicked and the successful order completion is validated. It is
    ...                now expected to go to the inventory page logging out afterwards.
    [Setup]            Login as a standard user
    [Teardown]         Logout
    [Tags]             Saucedemo_E2E
    
    Validate that the cart is empty

    # go to the inventory page
    Click all items button

    # gets the price of all items in the iventory page and
    # sets a dictionary variable in order to validate the
    # prices of the items in the cart and in the
    # checkout:overview page  
    Get the price of all items

    # gets the sum of the price of the items that we wish to
    # buy in the inventory page in order to validate if the
    # sum of the prices of the items in the checkout:overview page
    # is correct
    # the variable "${itemsNamesAndPricesDictionary}" is a test
    # variable created in the "Get the price of all items" keyword
    # being a dictionary which relates the name of the item with
    # its price. 
    ${totalPriceOfTheItems}=   Sum of values
    ...   ${itemsNamesAndPricesDictionary['${sauceLabsBackpack}']}
    ...   ${itemsNamesAndPricesDictionary['${sauceLabsBikeLight}']}


    Add "${sauceLabsOnesie}" item to cart
    Change sort order   ${orderPriceHighToLow}
    Add "${sauceLabsBikeLight}" item to cart
    Change sort order   ${orderPriceLowToHigh}
    Add "${sauceLabsBackpack}" item to cart


    # cart
    
    Open cart
    
    Validate the names of the items
    ...   ${sauceLabsOnesie}
    ...   ${sauceLabsBikeLight}
    ...   ${sauceLabsBackpack}
    
    Validate total number of items    3
    
    Validate the quantity of a item    ${sauceLabsOnesie}      1
    Validate the quantity of a item    ${sauceLabsBikeLight}   1
    Validate the quantity of a item    ${sauceLabsBackpack}    1 
    
    # validates the price of the items with the price that we got
    # in the inventory page using the dictionary test variable created
    # in the keyword: "Get the price of all items"
    Validate the prices of the items
    ...   ${sauceLabsOnesie}
    ...   ${sauceLabsBikeLight}
    ...   ${sauceLabsBackpack}
    
    Remove "${sauceLabsOnesie}" item from the cart
    
    
    # checkout page
    
    Go to the checkout page input customer data and go to checkout:overview
    ...   ${customerFirstname}
    ...   ${customerlastName}
    ...   ${customerPostalCode}
    
    
    # checkout:overview page
    
    Validate total number of items    2
    
    Validate the names of the items
    ...   ${sauceLabsBikeLight}
    ...   ${sauceLabsBackpack}
    
    Validate the quantity of a item    ${sauceLabsBikeLight}   1
    Validate the quantity of a item    ${sauceLabsBackpack}    1
    
    # validates the price of the items with the price that we got
    # in the inventory page using the dictionary test variable created
    # in the keyword: "Get the price of all items"
    Validate the prices of the items
    ...   ${sauceLabsBikeLight}
    ...   ${sauceLabsBackpack}
    
    Validate the subtotal price on the checkout:overview page
    ...   ${totalPriceOfTheItems}
    
    Validate the tax value on the checkout:overview page
    ...   ${expectedTaxValue}
    
    Validate the total price on the checkout:overview page
    ...   ${expectedTaxValue}
    ...   ${totalPriceOfTheItems}


    # checkout:complete page
    Go to checkout:complete page and validate successful order completion


    # inventory page
    Go to inventory page