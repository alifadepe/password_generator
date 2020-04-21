'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "0000d255865246c9b55862d96ffd3089",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "c93a5845a9b51594881ca5383b05ba79",
"icons/Icon-192.png": "af7638108b39ae6f8e23367c4cea11a8",
"icons/Icon-512.png": "2e715f7d917b71f881a075e148b5e5c1",
"index.html": "fb92cdc7c991011b286ec0a7a948e7a5",
"/": "fb92cdc7c991011b286ec0a7a948e7a5",
"main.dart.js": "1a16e8db4f605dd2f5f73145241023b4",
"manifest.json": "dd5d8400abf069558e74764b276372d0"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
