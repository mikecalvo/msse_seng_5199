footer: © Citronella Software Ltd 2015
slidenumbers: true

# Angular Routing
## Mike Calvo
## mike@citronellasoftware.com

---
# Rationale 1: Many Views Per App
- Single page app does not mean single view
- Google Mail:
  - Inbox
  - Compose Message
  - Read Message
  - Settings

---
# Rationale 2: Back Button
- Users have be come accustomed to using back/forward buttons
- Mostly on desktop browsers
- Should be have as expected in single page apps

---
# URL Routes and Templates
- Map URLs with views within the app
- Template is an HTML file that defines a view
  - Not a complete page
- URL comes after the # in the single page:
`http://localhost/auktion/#/listings`

---
#ngRoute
- Optional module in Angular
- 'ngRoute' module provides functionality
- Include "ng-route.js" in your page

``` javascript
angular.module("app", ["ngRoute"]);
```

---
# Configuring Router

``` javascript
angular.module("app").config(function($routeProvider) {
  $route.when("/checkout", {
    templateUrl: "/views/checkout.html"
  });
  $route.when("/products", function {
    templateUrl: "/views/products.html"
  });
  $route.otherwise("/home", function {
    templateUrl: "/views/home.html"
  })
});
```

---
# Templates
- Plain old HTML
- Does not include full page (HTML, HEAD, BODY)
- Contents are inserted into view placeholder
- Can contain directives
  - Including which controller feeds the view

---
# Example Template

``` html
<div ng-controller="CartController">
<table>
  <tr ng-repeat="item in cart.items">
    <td>{{ item.name }}</td>
    <td>${{ item.price }}</td>
    <td><input ng-model="item.quantity" /></td>
    <td><button ng-click="remove(item)">Remove</button></td>
  </tr>
</table>
</div>
```

---
# ngView
- Router needs to know where to put the views you've defined
- Use the ngView directive to mark the element

``` html
<ng-view> <!-- after route your templates go here --></ng-view>
```

OR

``` html
<div ng-view> <!-- stuff here --></div>

```
---
# Getting to Routes
- Use a simple HTML link:

``` html
<a href="#/checkout">Proceed to checkout</a>
```

---
# ngInclude
- Directive to include template or snippet into a view
- Does not require routing
- Simply includes the content in place
- Can be combined with ng-show or ng-if to conditionally show
- Can be used to break up complexity size of templates

---
# ngInclude example

``` html
<ng-include src="templates/item.html" ng-show="item">
  <!-- contents of item.html go here (only displayed if item is truthy) -->
</ng-include>
```
