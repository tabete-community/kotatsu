(function () {
  var mrtabeteImages = [
    "angry.png",
    "flag.png",
    "laptop.png",
    "bottle.png",
    "highstick.png",
    "pants.png",
    "sit.png",
    "bruh.png",
    "hole-2.png",
    "rice.png",
    "wave.png",
    "chopsticks.png",
    "hole.png",
    "run.png",
    "fall.png",
    "inside.png",
    "shout.png",
  ];

  var randomImage =
    mrtabeteImages[Math.floor(Math.random() * mrtabeteImages.length)];
  var imgElement = document.getElementById("header-image");

  if (imgElement) {
    var basePath = imgElement.getAttribute("data-base-path");
    imgElement.src = basePath + randomImage;
  }
})();
