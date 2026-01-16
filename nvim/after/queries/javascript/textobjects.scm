;extends
;; nested method calls: a.b.c()
(call_expression
  function: (member_expression
              object: (member_expression) @object
              property: (property_identifier) @method.name)
  arguments: (arguments) @args)

;; regular method calls: obj.method()
(call_expression
  function: (member_expression
              object: (_) @object
              property: (property_identifier) @method.name)
  arguments: (arguments) @args)

;; direct function calls: func()
(call_expression
  function: (identifier) @method.name
  arguments: (arguments) @args)
