# frozen_string_literal: true

committee_settings = {
  schema_path: Rails.root.join('schemas/api/private/openapi.yaml'),
  ignore_error: true,
  query_hash_key: 'rack.request.query_hash',
  parse_response_by_content_type: true,
  strict_reference_validation: true,
  error_handler: ->(ex, _env) do
    return if ex.message.include?('longer than max length')
    Rails.logger.info(ex) if Rails.env.development?
  end,
}

Rails.application.configure do
  config.middleware.use(Committee::Middleware::RequestValidation, committee_settings)
  config.middleware.use(Committee::Middleware::ResponseValidation, committee_settings)
end