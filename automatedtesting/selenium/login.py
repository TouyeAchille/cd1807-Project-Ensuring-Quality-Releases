#!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import time

# from selenium.webdriver.chrome.service import Service

# --uncomment when running in Azure DevOps.
options = ChromeOptions()
options.add_argument("--headless")
driver = webdriver.Chrome(options=options)

# for demo live uncomment
#driver = webdriver.Chrome()

site_url = "https://www.saucedemo.com/"
print(f"Navigating to site: {site_url}")

print("Starting the browser...")
driver.get(site_url)


# Start the browser and login with standard_user
def login(user, password):

    # Log in to the website
    driver.find_element(By.ID, "user-name").send_keys(user)
    driver.find_element(By.ID, "password").send_keys(password)
    driver.find_element(By.ID, "login-button").click()

    print()
    print("Login submitted. Validating login...")
    print("Login successful. You are now logged in as:", user)
    print()

    all_items = driver.find_element(By.ID, "inventory_container").find_elements(
        By.CLASS_NAME, "inventory_item_name"
    )

    all_items_id = driver.find_element(By.ID, "inventory_container").find_elements(
        By.TAG_NAME, "button"
    )

    print()
    items_ids = [item.get_attribute("id") for item in all_items_id]
    print("All items on the product id page are:")
    for ids in items_ids:
        print("-", ids)

    assert len(items_ids) > 0, "No items id founds on the product"
    assert (
        "add-to-cart-sauce-labs-backpack" in items_ids
    ), "Expected item id not found: add-to-cart-sauce-labs-backpack"

    print()
    print("All items on the product page are:")
    item_names = [item.text for item in all_items]
    for name in item_names:
        print("-", name)

    assert len(item_names) > 0, "No items found on the product page."
    assert (
        "Sauce Labs Backpack" in item_names
    ), "Expected item not found: Sauce Labs Backpack"
    assert (
        "Sauce Labs Bike Light" in item_names
    ), "Expected item not found: Sauce Labs Bike Light"
    assert (
        "Sauce Labs Bolt T-Shirt" in item_names
    ), "Expected item not found: Sauce Labs Bolt T-Shirt"
    assert (
        "Sauce Labs Fleece Jacket" in item_names
    ), "Expected item not found: Sauce Labs Fleece Jacket"
    assert (
        "Sauce Labs Onesie" in item_names
    ), "Expected item not found: Sauce Labs Onesie"
    assert (
        "Test.allTheThings() T-Shirt (Red)" in item_names
    ), "Expected item not found: Test.allTheThings() T-Shirt (Red)"

    print()

    # add product from cart
    add_product_to_cart(driver, item_names, items_ids)
    
    # remove product from cart
    remove_product_from_cart(driver)
   

    #time.sleep(2)

    # Close the browser
    driver.quit()  

def add_product_to_cart(driver, item_names, items_ids):
    wait = WebDriverWait(driver, 10)
    wait.until(EC.presence_of_element_located((By.CLASS_NAME, "inventory_container")))

    for name, product_ids in zip(item_names, items_ids):
        try:
            print("Clicking on item:", name)
            product = wait.until(EC.element_to_be_clickable((By.ID, product_ids)))
            print("Adding item to cart:", name)
            product.click()
        except:
            print(f"Could not click {name} (button ID: {product_id})")

        print("==" * 20)
        print()



def remove_product_from_cart(driver):
    wait = WebDriverWait(driver, 10)
    # Chercher tous les boutons dont l'ID commence par 'remove-'
    remove_buttons = driver.find_elements(
        By.XPATH, "//button[starts-with(@id,'remove-')]"
    )

    remove_ids = [btn.get_attribute("id") for btn in remove_buttons]
    print("All remove items id on the product page are:")
    for rid in remove_ids:
        print("-", rid)
    print()
    for rid in remove_ids:
        button = wait.until(EC.element_to_be_clickable((By.ID, rid)))
        print("Removing item with button ID:", rid)
        button.click()
        print("==" * 20)


# Call the login function with standard_user
login("standard_user", "secret_sauce")
