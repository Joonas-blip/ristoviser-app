const initOnShare = () => {
  const shareButton = document.getElementById('share-button')
  if (shareButton) {
    shareButton.addEventListener("click", (event) => {
      const title = document.title;
      const url = shareButton.dataset.url;
      try {
        navigator
          .share({
            title,
            url,
          })
      } catch (err) {
        /*
          This error will appear if the user cancels the action of sharing.
        */
        alert(`Couldn't share ${err}`);
      }
    });
  }

}

export { initOnShare }
