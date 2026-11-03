; Minimal vim highlights - avoids invalid node types from grammar changes

(identifier) @variable

((identifier) @constant
  (#lua-match? @constant "^[A-Z][A-Z_0-9]*$"))

; Keywords
[
  "if"
  "else"
  "elseif"
  "endif"
] @keyword.conditional

[
  "try"
  "catch"
  "finally"
  "endtry"
  "throw"
] @keyword.exception

[
  "for"
  "endfor"
  "in"
  "while"
  "endwhile"
  "break"
  "continue"
] @keyword.repeat

[
  "function"
  "endfunction"
] @keyword.function

; Function related
(function_declaration
  name: (_) @function)

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (scoped_identifier
    (identifier) @function.call))

(parameters
  (identifier) @variable.parameter)

(default_parameter
  (identifier) @variable.parameter)

[
  (bang)
  (spread)
] @punctuation.special

[
  (no_option)
  (inv_option)
  (default_option)
  (option_name)
] @variable.builtin

[
  (scope)
  "a:"
  "$"
] @module

; Commands - use node types instead of string literals
(command_name) @function.macro

(keycode) @character.special

[
  "<buffer>"
  "<nowait>"
  "<silent>"
  "<script>"
  "<expr>"
  "<unique>"
] @constant.builtin

(augroup_name) @module

(au_event) @constant

(hl_attribute
  key: _ @property
  val: _ @constant)

(hl_group) @type

; Literals
(string_literal) @string

(integer_literal) @number

(float_literal) @number.float

(comment) @comment @spell

(line_continuation_comment) @comment @spell

(pattern) @string.special

(pattern_multi) @string.regexp

(filename) @string.special.path

(heredoc
  (body) @string)

[
  (marker_definition)
  (endmarker)
] @label

(literal_dictionary
  (literal_key) @property)

((scoped_identifier
  (scope) @_scope
  .
  (identifier) @boolean)
  (#eq? @_scope "v:")
  (#any-of? @boolean "true" "false"))

; Operators
[
  "||"
  "&&"
  "&"
  "+"
  "-"
  "*"
  "/"
  "%"
  ".."
  "=="
  "!="
  ">"
  ">="
  "<"
  "<="
  "=~"
  "!~"
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  ".="
  "..="
  "<<"
  "=<<"
  "->"
] @operator

[
  "is"
  "isnot"
] @keyword.operator

(unary_operation
  "!" @operator)

(binary_operation
  "." @operator)

; Punctuation
[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

(field_expression
  "." @punctuation.delimiter)

[
  ","
  ":"
] @punctuation.delimiter

(ternary_expression
  [
    "?"
    ":"
  ] @keyword.conditional.ternary)

(inv_option
  "!" @operator)

(set_item
  "?" @operator)
