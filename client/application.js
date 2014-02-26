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
});