import json, os, pprint, time
from urllib import parse
import requests as rqs
from bs4 import BeautifulSoup 

listData = []

url = 'https://www.bookwormzz.com/zh/'
headers ={
    'user-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36'
    } 

def getMainLinks():
    r = rqs.get(url, headers = headers)
    # print(r.text)
    soup = BeautifulSoup(r.text, "lxml")
#     print(soup)
    a_elms = soup.select('a[data-ajax="false"]')
    for a in a_elms:
        listData.append({
            "title": a.text,# 不要有一對百分比符號
            "link": url + parse.unquote( a.get('href') ) + '#book_toc' 
        })
    # pprint.pprint(listData)
def getSubLink():
    for i in range( len(listData) ):
        if "sub" not in listData[i]:
            listData[i]['sub'] = []
        r = rqs.get(listData[i]['link'], headers=headers)
        soup = BeautifulSoup(r.text, "lxml")
        a_elms = soup.select('div[data-theme="b"][data-content-theme="c"] a[rel="external"]')
        if len(a_elms) > 0: # 代表有超連結
            for a in a_elms:
                listData[i]['sub'].append({
                    "sub_title": a.text,
                    "sub_link": url + parse.unquote( a.get('href') )
                })
        else:
            continue # 沒有超連結就跳過,往下一個前進
    # pprint.pprint(listData)

def saveJson(): # 存成 json 檔
    fp = open( "jinyoung.json", "w", encoding="utf-8")
    fp.write( json.dumps(listData, ensure_ascii=False))
    fp.close()

def writeText(): # 存成純文字檔
    listContent = []

    fp = open( "jinyoung.json", "r", encoding="utf-8")
    strJson = fp.read()
    fp.close()

    folderPath = 'jinyoung_txt'
    if not os.path.exists(folderPath):
        os.makedirs(folderPath)

    listResult = json.loads(strJson)
    for i in range(len(listResult)):
        for j in range(len(listResult[i]['sub'])):
            r = rqs.get(listResult[i]['sub'][j]['sub_link'], headers=headers)
            soup = BeautifulSoup(r.text, 'lxml')
            div = soup.select_one('div#html > div')
            strContent = div.text
            strContent = strContent.replace(" ", "")
            strContent = strContent.replace("\r", "")
            strContent = strContent.replace("\n", "")
            strContent = strContent.replace("　", "")

            fileName = f"{listResult[i]['title']} {listResult[i]['sub'][j]['sub_title']}"

            fp = open(f"{folderPath}/{fileName}", "w", encoding="utf-8")
            fp.write(strContent)
            fp.close()

            listContent.append(strContent)

    fp = open("train.json", "w", encoding="utf-8")
    fp.write( json.dumps(listContent, ensure_ascii=False) )
    fp.close()




if __name__ == "__main__" :
    time1 = time.time()
    getMainLinks()
    getSubLink()
    saveJson()
    writeText()
    print(f"[total] It takes {time.time() - time1} seconds.")

