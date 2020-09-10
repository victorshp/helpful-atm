json.array! @withdrawals do |withdrawal|
  json.extract! withdrawal, :id, :amount, :banknotes
end
