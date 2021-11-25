const initOnShare = () => {
  const shareButton = document.getElementById('share-button')
  if (shareButton) {
    shareButton.addEventListener("click", (event) => {
      const title = document.title;
      const url = shareButton.href
        ? document.querySelector(collection_path(collection.id)).href
        : document.location.href;
      try {
        navigator
          .share({
            title,
            url,
          })

        /*
          Show a message if the user shares something
        */
        alert(`Thanks for Sharing!`);
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
