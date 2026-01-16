; extends
;; method calls like a.b.C()
(call_expression
  function: (selector_expression
              operand: (_) @object
              field: (field_identifier) @method.name)
  arguments: (argument_list) @args)

;; chained selector, e.g., a.b.c.D()
(call_expression
  function: (selector_expression
              operand: (selector_expression) @object
              field: (field_identifier) @method.name)
  arguments: (argument_list) @args)

;; direct function calls
(call_expression
  function: (identifier) @method.name
  arguments: (argument_list) @args)

;; key of a keyed_element
(keyed_element
  key: (literal_element (identifier) @key.name))

;; value of a keyed_element
(keyed_element
  value: (literal_element (_) @value.name))

;; the whole key-value pair
(keyed_element) @pair
