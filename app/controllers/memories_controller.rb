class MemoriesController < ApplicationController
  def new
    @situations = {
      '海辺' => 'seaside',
      '高校時代' => 'high_school',
      '修学旅行' => 'school_trip'
    }
  end
  
  def show
    situation_key = params[:situation]
    memories = load_memories[situation_key]
    @memory = memories.sample
  end
  

  private

  def load_memories
    YAML.load_file(Rails.root.join('config', 'memories.yml'))
  end
end
