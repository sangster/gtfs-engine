# frozen_string_literal: true

module GtfsEngine
  class FareRule < ActiveRecord::Base
    belongs_to :data_set, inverse_of: :trips
    belongs_to :fare_attribute, foreign_key: :fare_id, primary_key: :fare_id
    belongs_to :route, foreign_key: :route_id, primary_key: :route_id

    with_options(class_name: 'Stop', primary_key: :zone_id) do |rule|
      rule.belongs_to(:origin, inverse_of: :origin_rules,
                               foreign_key: :origin_id)
      rule.belongs_to(:destination, inverse_of: :destination_rules,
                                    foreign_key: :destination_id)
    end
  end
end
