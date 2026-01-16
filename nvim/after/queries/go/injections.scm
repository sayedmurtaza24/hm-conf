; ; extends
;
; (
;   (call_expression
;     function: (selector_expression
;       field: (field_identifier) @_method_name
;         (#match? @_method_name "^(ExecContext|QueryContext|ExecOneContext|QueryOneContext|Exec|Query|ExecOne|QueryOne)$")
;     )
;     arguments: (argument_list
;       (raw_string_literal
;         (raw_string_literal_content) @injection.content
;         (#set! injection.language "sql")
;       )
;     )
;   )
; )
