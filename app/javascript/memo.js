function inputTitle() {
  const titleEl = document.getElementById("memo-title");
  titleEl.addEventListener('input', () => {
    const inputValue= titleEl.value
    const indexTitle = document.querySelectorAll("memo-index");
    indexTitle.innerHTML= inputValue
  });
}

function saveText(){
  const form = document.getElementById('text-content')
  form.addEventListener('change', (e) => {
    e.preventDefault();

    const formResult = document.getElementById('text-content')
    const formData = new FormData(formResult)
    const formAction = formResult.action
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `${formAction}`, true);
    XHR.responseType = "json";
    XHR.send(formData);
  });
};

function autoText (){
  const textarea = document.getElementById('memo-content');
  textarea.addEventListener('input',() => {
    const clientHeight = textarea.clientHeight;
    textarea.style.height = clientHeight + 'px';
    const scrollHeight = textarea.scrollHeight;
    textarea.style.height = scrollHeight + 'px';
  });
};


window.addEventListener('load',inputTitle)
window.addEventListener('load',saveText)