# app/controllers/concerns/error_formatter.rb
module ErrorFormatter
    def format_model_errors(model)
      model.errors.map do |error|
        {
          field: error.attribute,
          message: error.message,
          code: error.type
        }
      end
    end
end
