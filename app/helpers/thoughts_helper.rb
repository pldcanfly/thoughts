module ThoughtsHelper
  include ThinkersHelper

  def get_thoughts_for_thinker(thinker)
    if thinker.is_a? Integer # Assume it's the id already
      id = thinker
    elsif thinker.is_a? String # Assume we got the name
      if thinker = get_thinker_by_name(thinker)
        id = thinker.id
      end
    elsif thinker.is_a? Thinker # Oh nice! An Object already!
      id = thinker.id
    end

    if id
      if @thoughts = Thought.where(author: id).order(created_at: :desc).all
        return @thoughts
      end
    end

    return nil
  end

  def get_thought(thought_id)
    return Thought.find_by(id: thought_id)
  end
end
