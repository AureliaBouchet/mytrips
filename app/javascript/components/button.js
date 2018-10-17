function displayingLinksOnClick() {
  const buttons = document.querySelectorAll('btn-links');

  if (buttons) {
    buttons.forEach { |button| button.add.addEventListener('click', () => {
      const links = document.querySelectorAll('links-item');
      links.classList.toggle('hidden');

    });
  }
}

export { displayingLinksOnClick };
