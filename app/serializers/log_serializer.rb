class LogSerializer < ActiveModel::Serializer
  attributes :id, :action, :message
end
