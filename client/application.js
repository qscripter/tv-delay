Meteor.subscribe("cableProviders");
Meteor.subscribe("commercials");

Router.configure({
  layoutTemplate: 'main'
 })

Router.map(function () {
  /**
   * The route's name is "home"
   * The route's template is also "home"
   * The default action will render the home template
   */
  this.route('home', {
    path: '/',
    template: 'triggerCommercial'
  });

  this.route('admin', {
    path: '/admin',
    template: 'adminCommercials'
  });

  this.route('headers', {
    path: '/headers',
    template: 'headers'
  });

  this.route('contact', {
    path: '/contact'
  });
});

Meteor.startup(function () {
  if ("geolocation" in navigator) {
    /* geolocation is available */
    navigator.geolocation.getCurrentPosition(function(position) {
      Session.set("geolocation", position)
    });
  } else {
    /* geolocation IS NOT available */
  }
});