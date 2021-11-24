const splashScreen = document.querySelector(".splashscreen");
const homepage = document.querySelector(".homepage");
const mainLogo = document.querySelector("#main-logo");

const initAnimation = () => {
    console.log(splashScreen);
    console.log(homepage);
    console.log(mainLogo);
    setInterval(() => {
        splashScreen.classList.add("transition");
        setInterval(() => {
            splashScreen.classList.add("d-none");
            homepage.classList.add("transition-in");
        }, 1000);
    }, 2000);

}

export { initAnimation };