Swagger::Docs::Config.base_api_controller = ActionController::API
Swagger::Docs::Config.register_apis({
  '1.0' => {
    api_extension_type: :json,
    api_file_path: 'public/api/v1/',
    base_path: '/api/v1',
    clean_directory: true
  }
})
