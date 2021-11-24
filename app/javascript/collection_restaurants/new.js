const search = document.querySelector('#search');
const query = document.querySelector('#query');
  // https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=name%2Cphotos%2Cformatted_address&input=La%20Magolfa%20Milano&inputtype=textquery&key=AIzaSyC2Ck1pMVEYNxiPnnhDxY6iaQUV5SBmoZg

  search.addEventListener('submit', (event) => {
    fetch(`https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=name%2Cphotos%2Cformatted_address&input=La%20Magolfa%20Milano&inputtype=textquery&key=AIzaSyC2Ck1pMVEYNxiPnnhDxY6iaQUV5SBmoZg`)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      });
  });
