module LovesHelper
  def get_loves(thought_id)
    Like.where(thought: thought_id).length
  end

  def loves?(thought_id, thinker_id = current_user_id?)
    Like.find_by(thought: thought_id, thinker: thinker_id)
  end
end
