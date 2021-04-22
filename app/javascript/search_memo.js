function searchMemo() {
  const searchBox = document.getElementById('search-box')
  searchBox.addEventListener('input',() => {
    const targetText = searchBox.value
    const targetIndex = document.querySelectorAll('.memo-index')
      targetIndex.forEach(index => {
        if (index.innerText.includes(targetText)){
          index.setAttribute('style','display:block;')
        }
        else{
          index.setAttribute('style','display:none;')
        }
    });
  });
};

window.addEventListener('load',searchMemo)