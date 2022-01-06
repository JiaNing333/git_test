from selenium import webdriver
from selenium.common.exceptions import TimeoutException 
from selenium.webdriver.support.ui import WebDriverWait 
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import json, os, pprint, time
from urllib import parse

options = webdriver.ChromeOptions()
options.add_argument('--start-maximized')
options.add_argument('--incognito')
options.add_argument('--disable-popup-blocking')

driver = webdriver.Chrome(options = options)

listData = []
url = 'https://www.bookwormzz.com/zh/'

def visit(): # 請瀏覽器到這個網址去
    driver.get(url)

def getMainLinks(): # 取得所有主要的連結
    a_elms = driver.find_elements(By.CSS_SELECTOR, 'a[data-ajax="false"]')
    for a in a_elms:
        listData.append({
            "title": a.get_attribute('innerText'),
            "link": parse.unquote( a.get_attribute('href') ) + '#book_toc'
        })
    # pprint.pprint(listData)

def getSubLink():
    for i in range( len(listData) ):
        if "sub" not in listData[i]:
            listData[i]["sub"] = []
        driver.get(listData[i]["link"])

        try:
            WebDriverWait(driver, 3).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'a[rel="external"][class="ui-link"]')))
            a_elms = driver.find_elements(By.CSS_SELECTOR, 'a[rel="external"][class="ui-link"]')
            for a in a_elms:
                listData[i]["sub"].append({
                    "sub_title": a.get_attribute("innerText"),
                    "sub_link": parse.unquote( a.get_attribute('href') )
                })

        except TimeoutException as e:
            continue

    # pprint.pprint(listData)
def saveJson():
    fp = open("seljinyoung.json", "w", encoding="utf-8")
    fp.write( json.dumps(listData, ensure_ascii=False) )
    fp.close()

def writeTxt():
    listContent = [] 
    fp = open("seljinyoung.json", "r", encoding="utf-8")
    strJson = fp.read()
    fp.close()

    folderPath = 'seljinyoung_txt'
    if not os.path.exists(folderPath):
        os.makedirs(folderPath)

    listResult = json.loads(strJson)
    
    for i in range( len(listResult) ):
        for j in range( len(listResult[i]["sub"]) ):
            driver.get( listResult[i]["sub"][j]["sub_link"] )
            div = driver.find_element(By.CSS_SELECTOR, 'div#html > div')
            strContent = div.get_attribute('innerText')
            strContent = strContent.replace(" ", "")
            strContent = strContent.replace("\r", "")
            strContent = strContent.replace("\n", "")
            strContent = strContent.replace("　", "")

            fileName = f"{listResult[i]['title']}_{listResult[i]['sub'][j]['sub_title']}.txt"
            fp = open(f"{folderPath}/{fileName}", "w", encoding="utf-8")
            fp.write( strContent )
            fp.close()
            
            listContent.append(strContent)

        fp = open("seltrain.json", "w", encoding="utf-8")
        fp.write( json.dumps(listContent, ensure_ascii=False) )
        fp.close()

def close():
    driver.quit()

if __name__ == "__main__":
    time1 = time.time()
    visit()
    getMainLinks()
    getSubLink() 
    saveJson()
    writeTxt()
    close()
    print(f"[total] It takes {time.time() - time1}")