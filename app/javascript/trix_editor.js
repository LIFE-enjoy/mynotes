function trixSave() {
  const trixText = document.getElementById("text-content");
  if (!trixText){ return false;}
  trixText.addEventListener('trix-change', (e) => {
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

window.addEventListener('load',trixSave)