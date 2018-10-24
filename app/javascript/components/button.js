function displayElementContent() {
  const elements = document.querySelectorAll('.step-card-reco-item');
  if (elements) {
    elements.forEach((element)=>{ element.addEventListener('click', (event)=>{
      const myItem = event.target
      const item = myItem.dataset.item
      const id = myItem.dataset.idStep
      const elt = document.getElementById(`${item}_${id}`);
      // const comment = document.getElementById(`comment_${id}`);
      // comment.classList.add("hidden");
      elt.classList.remove("hidden");
      elt.classList.add("border");
      })
    })
  }
}

function closeElementContent() {
  const closes = document.querySelectorAll('.close');
  if (closes) {
    closes.forEach((element)=>{ element.addEventListener('click', (event)=>{
      console.log(event.target)
      const myItem = event.target
      const item = myItem.dataset.item
      const id = myItem.dataset.idStep
      const elt = document.getElementById(`${item}_${id}`);
      elt.classList.add("hidden");
      elt.classList.remove("border");
      })
    })
  }
}

export {displayElementContent};
export {closeElementContent};
