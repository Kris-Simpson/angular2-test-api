class Todo < ApplicationRecord
  def complete
    update!(completed: true)
  end

  def uncomplete
    update!(completed: false)
  end
end
