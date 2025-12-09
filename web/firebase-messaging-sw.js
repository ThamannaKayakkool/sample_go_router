// See this file for the latest firebase-js-sdk version:
// https://github.com/firebase/flutterfire/blob/main/packages/firebase_core/firebase_core_web/lib/src/firebase_sdk_version.dart
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js");

firebase.initializeApp({
    apiKey: "AIzaSyCeSckzPsSaCbCvs4BoH2KVmTFugJeZjVk",
    authDomain: "sample-go-router.firebaseapp.com",
    projectId: "sample-go-router",
    storageBucket: "sample-go-router.firebasestorage.app",
    messagingSenderId: "164790489552",
    appId: "1:164790489552:web:2453ffeb8535c8d347a9d5",
    measurementId: "G-P1232XYRTJ"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});