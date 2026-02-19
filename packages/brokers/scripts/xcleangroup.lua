local consumers = redis.call('XINFO', 'CONSUMERS', KEYS[1], ARGS[1])

for i = 1, #consumers do
  local consumer = consumers[i]
  if consumer.idle ~= 0 then
    return false
  end
end

redis.call('XGROUP', 'DESTROY', KEYS[1], ARGS[1])
return true
