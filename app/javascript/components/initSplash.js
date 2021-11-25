// Please do not change!!!!

const splashScreen = document.querySelector(".splashscreen");
const homepage = document.querySelector(".homepage");
const mainLogo = document.querySelector("#main-logo");

const initAnimation = () => {
    console.log(splashScreen);
    console.log(homepage);
    console.log(mainLogo);
    setInterval(() => {
        homepage.classList.remove("d-none");
        splashScreen.classList.add("transition");
        setInterval(() => {
            splashScreen.classList.add("d-none");
            homepage.classList.add("transition-in");
        }, 2000);
    }, 4000);

}

export { initAnimation };