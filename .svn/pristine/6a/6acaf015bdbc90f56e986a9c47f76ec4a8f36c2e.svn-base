if('serviceWorker'in navigator){
    window.addEventListener('load',function(){
        navigator.serviceWorker.register('serviceworker.js').then(
            function(registration){console.log('ServiceWorker registered: ',registration.scope);},
            function(err){console.log('ServiceWorker error: ',err);});
    });
} else {
  console.log('ServiceWorker not supported');
}