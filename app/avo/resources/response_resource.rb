# frozen_string_literal: true

class ResponseResource < Avo::BaseResource
  self.title = :name
  self.includes = %i[]

  field :id, as: :id
  field :request, as: :belongs_to, required: true
  field :name, as: :text, required: true
  field :description, as: :text
  field :conditions, as: :key_value, default: {}
  field :status, as: :number, required: true
  field :throttle, as: :number, default: 0, help: "The number of milliseconds to delay the request."
  field :headers, as: :key_value, default: {}
  field :format, as: :select, enum: Response.formats, default: "json", required: true
  field :body, as: :code, required: true, default: "{}"
end
