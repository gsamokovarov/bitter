module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |err|
      render_error err.record.errors.details
    end

    rescue_from ActiveRecord::RecordNotFound do
      render_error code: :not_found
    end
  end

  def render_error(status = :unprocessable_entity, error)
    render json: error, status: status
  end
end
