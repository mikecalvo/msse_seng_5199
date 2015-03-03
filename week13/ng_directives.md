footer: © Citronella Software Ltd 2015
slidenumbers: true

# Angular Directives
## Mike Calvo
## mike@citronellasoftware.com

---
# Angular Opinion
- To manipulate the DOM thou must use a directive

---
# Built-in Directives
- ng-repeat
- ng-model
- ng-if and ng-show
- ng-class
- ng-click and ng-change

---
# Third Party Directives
- Angular ui: typeahead, alerts, popups, accordion
- Data Table
- Angular UI Tree
- Sortable: drag and drop

---
# Reasons to Create Directives
- Reduce duplicative markup in views
- New UI metaphors unique to your application
- Share components between projects

---
# Observations
- Working with Angular will most likely involve creating directives
- It can be challenging
- Expect things to take longer that you would think

---
# Directive Types
- Element
`<alert>`

- Attribute
`<div ng-show="realDeal()">`

---
# Naming Directives
- Every directive has a name (used as either attribute or element)
- To avoid collisions, Angular recommends prefixing directives
- All built-in directives start with ng- (the actual directive name is ngDirectiveName)
- Angular ui directives start with ui-

---
# Matching Directives
- Angular looks for directive names by HTML tag or attribute names
- The following characters are removed and trigger camelCasing: `: - _`
- Most typical is the '-'
- alert resolves to alert
- ng-model resolves ngModel
- ui-accordion resolves to uiAccordion

---
# Directive Parameters
- scope
  - The scope for the directive.  Each directive gets its own
- element
  - The DOM element - jQueryLite or jQuery
- attributes
  - The DOM element attributes

---
# Creating a Directive
- Similar to creating controllers and filters
- Define a factory for directive using Angular module:

``` javascript
angular.module('app').directive('prefixName', function() {
  return directiveDefinition
})
```

---
# Template-expanding Directive
- Most simple directive to create
- Return markup that will be inserted into view where your directive lives
- Simplest ones rely on information provided by a collaborating controller

---
# Example Template-expanding

``` javascript
angular.module('docsSimpleDirective', [])
.controller('Controller', ['$scope', function($scope) {
  $scope.customer = {
    name: 'Naomi',
    address: '1600 Amphitheatre'
  };
}])
.directive('myCustomer', function() {
  return {
    template: 'Name: {{customer.name}} Address: {{customer.address}}'
  };
});
```

``` html
<div myCustomer></div>
```

---
# Directive Compiling
- Each directive is compiled to convert
