# 评分插件封装
# @version 0.0.2
# @author think2011
# @doc wbotelhos.com/raty
do ->
  app = angular.module 'raty', []

  app.directive 'raty', ->
    return {
      restrict: 'A'
      scope:
        ngModel: '='
      link: (scope, element, attrs) ->
        defaults =
          click: (score, evt) ->
            scope.$apply ->
              scope.ngModel = score

          readonly: attrs.readonly is 'true'

        # view to model
        $(element).raty
          click   : defaults.click
          readOnly: defaults.readonly

        # model to view
        scope.$watch 'ngModel', (newVal) ->
          if newVal
            $(element).raty 'score', newVal
          else
            scope.ngModel = 1
    }