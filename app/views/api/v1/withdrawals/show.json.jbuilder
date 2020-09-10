json.array! @withdrawals do |withdrawal|
  json.extract! withdrawal, :id, :amount, :banknotes, :created_at
end
