# frozen_string_literal: true

module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    def notfound(exeption)
      logger.warn exeption
      render file: 'public/404.html', status: :notfound, layout: false
    end
  end
end
