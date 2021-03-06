import { initMapbox } from "../plugins/init_mapbox";

const initOnMap = () => {
  const map_link = document.querySelector("#map-view")
  // console.log(map_link);

  if (map_link) {
    map_link.addEventListener("click", (event) => {
      // console.log(event);
      // document.querySelector("#toggle-cards").style.display === 'none' ? '' : 'none';
      // document.querySelector("#toggle-map").style.display === 'none' ? '' : 'none';

      const cards = document.querySelector("#toggle-cards");
      console.log(cards.classList);
      cards.classList.toggle('hide');
      // card.classList.contains("hide") ? card.classList.remove("hide") : card.classList.add("hide");
      const map = document.querySelector("#toggle-map");
      map.classList.toggle('hide');
      initMapbox();
      // map.classList.contains("hide") ? map.classList.remove("hide") : map.classList.add("hide");
    });
  }
}


export { initOnMap }
