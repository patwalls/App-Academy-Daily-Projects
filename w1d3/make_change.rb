# def make_change(change_needed, register)
#   return [] if change_needed == 0
#
#   biggest_coin = register.max
#
#   biggest_coin_amount = change_needed / biggest_coin
#
#   change = Array.new(biggest_coin_amount, biggest_coin)
#
#   change_remaining = change_needed % biggest_coin
#
#   new_register = register.sort[0...-1]
#   return change + make_change(change_remaining, new_register)
# end

def make_change(change_needed, register)
  return [] if change_needed == 0

      biggest_coin = register.max
    if biggest_coin <= change_needed
      biggest_coin_amount = 1
      change = [biggest_coin]
      change_remaining = change_needed - biggest_coin
      new_register = register
    else
      new_register = register.dup.sort[0...-1]
      change = []
      change_remaining = change_needed
    end

  return change + make_change(change_remaining, new_register)
end
