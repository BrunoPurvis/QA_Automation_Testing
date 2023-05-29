# QA_Automation_Testing
This repository has been created in order to demonstrate my skills in test automation.

# Frontend testing

-  Assessment:
The objective here is to use the Robot Framework automation tool and create the test cases below:

-Login

Go to https://www.saucedemo.com/ and create a set of test cases (positive and negative scenarios) to
validate the login feature of the page (valid users and passwords are displayed in login page)

-E2E Testing

Automate using Robot Framework and Selenium Library the following scenario:

1. Go to https://www.saucedemo.com/
2. Login as standard user
3. Open cart
4. Check cart is empty
5. Select “All Items” in burger menu
6. Add “Sauce Labs Onesie” to cart
7. Change sort order to “Price (high to low)”
8. Add “Sauce Labs Bike Light” to cart
9. Change sort order to “Price (low to high)”
10. Add “Sauce Labs Backpack” to cart
11. Open cart
12. Verify added items, quantities and prices in cart
13. Remove “Sauce Labs Onesie” from cart
14. Go to checkout
15. Fill checkout information
16. Click continue button
17. Verify items, quantities and prices in checkout overview
18. Click Finish button
19. Verify successful order completion
20. Click back home button
21. Logout

# Libraries that I have installed on my local machine:

- probably you don't need them all to execute the test suites located in this repository, but just in case

appdirs==1.4.4
certifi==2020.12.5
chardet==3.0.4
decorator==5.1.1
distlib==0.3.1
filelock==3.0.12
idna==2.10
jsonpath-ng==1.5.3
jsonschema==4.17.3
ply==3.11
pyrsistent==0.19.3
requests==2.25.0
robotframework==3.2.2
robotframework-jsonlibrary==0.5
robotframework-pythonlibcore==2.1.0
robotframework-requests==0.9.1
robotframework-seleniumlibrary==4.5.0
selenium==3.141.0
six==1.15.0
urllib3==1.26.2
virtualenv==20.2.1