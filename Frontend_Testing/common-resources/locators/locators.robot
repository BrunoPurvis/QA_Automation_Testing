*** Settings ***
Documentation   xpath expressions used on the e-commerce "Saucedemo" test suite.

*** Variables ***
#-------------------------------------------------------
                         # INPUT TEXT FIELDS
#-------------------------------------------------------
${xpathInputUsername}                //input[@id="user-name"]
${xpathInputPassword}                //input[@id="password"]
#  xpath of the input text fields in the "checkout: your information" page
${checkoutFirstName}                 //input[@id="first-name"]
${checkoutLastName}                  //input[@id="last-name"]
${checkoutPostalCode}                //input[@id="postal-code"]
${xpathLoginButton}                  //input[@id="login-button"]
#  xpath of the continue element in the "checkout: your information" page
${checkoutContinueButton}            //input[@id="continue"]


#-------------------------------------------------------
                         # SPAN
#-------------------------------------------------------
# itens in the shopping car
${xpathShoppingCarElement}           //span[@class="shopping_cart_badge"]


#-------------------------------------------------------
                         # H3
#-------------------------------------------------------
${h3ErrorElement}                    //h3[text()="error message"]
${xpathThankYouOrder}                //h2[text()="Thank you for your order!"]


#-------------------------------------------------------
                         # DIV
#-------------------------------------------------------
# shopping car element
${shoppingCarElement}                //div[@id="shopping_cart_container"]
#  xpath of the quantity of an item
${xpathItemQuantity}                 //div[text()="nameOftheProduct"]/ancestor::div[@class="cart_item"]/div[@class="cart_quantity"]
#  xpath of the price of an item in the shopping car
${xpathItemPrice}                    //div[text()="nameOftheProduct"]/ancestor::div[@class="inventory_item_description"]/descendant::div[@class="inventory_item_price"]
#  xpath of the price of an item on the checkout:overview page
${xpathItemPriceCheckoutOverview}    //div[text()="nameOftheProduct"]/ancestor::div[@class="cart_item_label"]/descendant::div[@class="inventory_item_price"]
# sub total price in the checkout overview page
${xpathSubTotalPriceCheckoutPage}    //div[@class="summary_subtotal_label"]
#  tax value in the checkout page
${xpathTaxCheckoutPage}              //div[@class="summary_tax_label"]
#  xpath of the total price in the checkout page
${xpathTotalPriceValueCheckoutPage}  //div[contains(@class, 'summary_info_label summary_total_label')]
${xpathInventoryItemName}            //div[@class="inventory_item_name"]



#-------------------------------------------------------
                         # BUTTONS
#-------------------------------------------------------
# open left menu button
${xpathOpenMenuButton}               //button[text()="Open Menu"]
# xpath of the "checkout" button in the shopping car page
${xpathCheckoutButton}               //button[@id="checkout"]
# xpath of the finish button in the checkout page
${xpathFinishButtonCheckoutPage}     //button[@id="finish"]
# xpath back home button in the checkout page
${xpathBackHomeButton}               //button[@id="back-to-products"]
#item in the store
${xpathItemInStore}                  //button[@id="add-to-cart-nameOftheProduct"]
# remove item from the shopping car
${xpathRemoveItem}                  //button[@id="remove-nameOftheProduct"]
# xpath back home button
${xpathBackHomeButton}              //button[@id="back-to-products"]



#-------------------------------------------------------
                         # HYPERLINK
#-------------------------------------------------------
# logout button
${xpathLogoutButton}                 //a[@id="logout_sidebar_link"]
# all items button
${xpathAllItemsButton}               //a[@id="inventory_sidebar_link"]


#-------------------------------------------------------
                         # DROPDOWNLIST
#-------------------------------------------------------
${xpathDropDownListOption}    //option[text()="optionList"]