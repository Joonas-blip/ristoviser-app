const initOnShare = () => {
  const shareButton = document.querySelectorAll('#share-button');
  if (shareButton) {
    shareButton.forEach((shareLink) => {
      shareLink.addEventListener("click", (event) => {
        const title = document.title;
        const url = shareLink.dataset.url;
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
    });
  }

}

export { initOnShare }
