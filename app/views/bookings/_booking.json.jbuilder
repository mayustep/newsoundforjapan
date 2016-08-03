json.extract! booking, :id, :booker_id, :bookee_id, :price, :currency, :bookee_confirmed_at, :booker_confirmed_at, :created_at, :updated_at
json.url booking_url(booking, format: :json)