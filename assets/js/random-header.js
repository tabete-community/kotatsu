(function() {
  // also used in what.md: chopsticks.png, inside.png, sit.png
  // also used in playbook.md: laptop.png
  var mrtabeteImages = [
    'angry.png', 'bruh.png', 'engarde.png', 'rice.png',
    'flag.png', 'laptop.png', 'pants.png',
    'smile.png', 'transparent.png', 'wave.png',
    'chopsticks.png', 'inside.png', 'sit.png'
  ];

  var randomImage = mrtabeteImages[Math.floor(Math.random() * mrtabeteImages.length)];
  var imgElement = document.getElementById('header-image');

  if (imgElement) {
    var basePath = imgElement.getAttribute('data-base-path');
    imgElement.src = basePath + randomImage;
  }
})();
