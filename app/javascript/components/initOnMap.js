const initOnMap = () => {
  const map_link = document.querySelector("#map-view")
  // console.log(map_link);

  if (map_link) {
    map_link.addEventListener("click", (event) => {
      // console.log(event);
      // document.querySelector("#toggle-cards").style.display === 'none' ? '' : 'none';
      // document.querySelector("#toggle-map").style.display === 'none' ? '' : 'none';

      const card = document.querySelector("#toggle-cards");
      console.log(card.classList);
      card.classList.contains("hide") ? card.classList.remove("hide") : card.classList.add("hide");
      const map = document.querySelector("#toggle-map");
      map.classList.contains("hide") ? map.classList.remove("hide") : map.classList.add("hide");
    });
  }

}


export { initOnMap }
