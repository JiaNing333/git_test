//取得裡面的內容
const content = document.getElementById('content')
const date = document.getElementById('date')
const time = document.getElementById('time')
const addedBtn = document.getElementById('addedBtn')
const deleteBtn = document.getElementById('deleteBtn')
const list = document.getElementById('list')
const reset = document.getElementById('reset')


const listContent = []//矩陣新增物件,下面每unshift一次就會新增新的東西進來

//可以使這個function套用到任何地方
function render(){
    let htmlStr = ''

    //他可以便利陣列內的內容,類似迴圈,forEach會去拿陣列裡面的東西然後放進來item
    listContent.forEach(function (item) {
        //   console.log('item',item)//看到裡面取得什麼
        //模板語法直接將字串插入裡面
        htmlStr = htmlStr + ` 
        <div class="item">
          <div>
            <p>內容:${item.content}</p> 
            <p>時間:${item.date}${item.time}</p>
          </div>
        </div>
        `
    })//${}可以將使用者出入的內容顯示出來,再透過下面的方法顯示到伺服器上,再透過foreach迴圈表示次數

    list.innerHTML = htmlStr //直接把內容輸出到HTML
}

//新增按鈕事件處理,按下新增按鈕可以拿到value
addedBtn.addEventListener('click', function () {
    //   console.log(content.value)
    //   console.log(date.value)
    //   console.log(time.value)
              //unshift從前面新增東西 push從最後新增
    listContent.unshift({//透過物件方式取得每篇備忘錄得記事
        content: content.value,
        date: date.value,
        time: time.value
    })
    //   //看陣列裡面有什麼
    //   console.log(listContent);

    render()//把前面11行的function放進來可以簡化程式不用一樣的程式做兩三遍
})

deleteBtn.addEventListener ('click' , function(){
    listContent.shift()//pop移除最後一個,shift從前面把東西拿出來

render()//把前面11行的function放進來可以簡化程式不用一樣的程式做兩三遍
})

// reset.addEventListener('click',function(){
//     document.getElementById(reset).innerHTML='none';
// })