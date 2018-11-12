
function displayContentOnClick() {
  const elements = document.querySelectorAll('.btn-see');
  const cards = document.querySelectorAll('.step-card-content')
  if (elements) {
    elements.forEach((element)=>{ element.addEventListener('click', (event)=>{
      const myItem = event.target
      const id = myItem.dataset.idStep
      const mycard = document.getElementById(`card_${id}`);
      const elt = document.getElementById(`reco_content_${id}`);
      elt.classList.remove("hidden");
      mycard.classList.add("hidden");
      })
    })
  }
}

function closeElementContent() {
  const closes = document.querySelectorAll('.close');
  console.log(closes)
  if (closes) {
    closes.forEach((element)=>{ element.addEventListener('click', (event)=>{
      const myItem = event.target
      const id = myItem.dataset.idStep
      const elt = document.getElementById(`reco_content_${id}`);
      const mycard = document.getElementById(`card_${id}`);
      elt.classList.add("hidden");
      mycard.classList.remove("hidden");

      })
    })
  }
}


export {displayContentOnClick};
export {closeElementContent};
