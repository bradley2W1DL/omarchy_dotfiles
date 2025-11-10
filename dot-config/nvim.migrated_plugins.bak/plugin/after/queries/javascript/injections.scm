; extends

(call_expression
  (identifier) @gql_id
  (#eq? @gql_id "gql")
  (template_string) @graphql_str
  (#set! injection.language "graphql")
)
