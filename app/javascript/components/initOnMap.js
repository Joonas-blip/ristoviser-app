const initOnMap = () => {
  const map_link = document.querySelector("#map-button")

  if (map_link) {
    map_link.addEventListener("click", (event) => {
      console.log(event);
      document.querySelector("#toggle-cards").style.display === 'none' ? '' : 'none';
      document.querySelector("#toggle-map").style.display === 'none' ? '' : 'none';
    });
  }

}


export { initOnMap }
