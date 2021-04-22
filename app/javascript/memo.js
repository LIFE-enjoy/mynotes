function inputTitle() {
  const titleEl = document.getElementById("memo-title");
  if (!titleEl){ return false;}
  titleEl.addEventListener('input', () => {
    const inputValue= titleEl.value
    const indexTitle = document.querySelectorAll("memo-index");
    indexTitle.innerHTML= inputValue
  });
}

function saveText(){
  const form = document.getElementById('text-content')
  if (!form){ return false;}
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

window.addEventListener('load',inputTitle)
window.addEventListener('load',saveText)