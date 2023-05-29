*** Settings ***
Documentation   Variables used in the e-commerce "Saucedemo" test suite.

*** Variables ***
${browser}                         Chrome
${urlLogin}                        https://www.saucedemo.com/
${urlInventory}                    https://www.saucedemo.com/inventory.html
${urlCheckout}                     https://www.saucedemo.com/checkout-step-one.html
${urlCheckoutOverview}             https://www.saucedemo.com/checkout-step-two.html
${urlCheckoutComplete}             https://www.saucedemo.com/checkout-complete.html

# users
${standard_user}                   standard_user
${locked_out_user}                 locked_out_user
${problem_user}                    problem_user
${performance_glitch_user}         performance_glitch_user

# users password
${password}                        secret_sauce

# ordering prices
${orderPriceHighToLow}             Price (high to low)
${orderPriceLowToHigh}             Price (low to high)

# error messages
${lockedUserErrorMessage}          Epic sadface: Sorry, this user has been locked out.
${usernameRequiredErrorMessage}    Epic sadface: Username is required
${passwordRequiredErrorMessage}    Epic sadface: Password is required
${invalidCredentialsErrorMessage}  Epic sadface: Username and password do not match any user in this service

# customer information
${customerFirstname}               Bruno
${customerlastName}                Purvis
${customerPostalCode}              1100

# expected Tax Value in the checkoutPage
${expectedTaxValue}                3.20

# names of the products
${sauceLabsOnesie}                 Sauce Labs Onesie
${sauceLabsBackpack}               Sauce Labs Backpack
${sauceLabsBikeLight}              Sauce Labs Bike Light