class ActionSerializer < ActiveModel::Serializer
  attributes :fullname, :country, :time_ago

  def fullname
    if object.anonymous
      "Anonymous"
    else
      "#{object.firstname} #{object.lastname}"
    end
  end

  def country
    object.country
  end

  def time_ago
    "#{distance_of_time_in_words_to_now(object.created_at)}"
  end

end
