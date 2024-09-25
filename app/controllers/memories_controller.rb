class MemoriesController < ApplicationController
  def new
    @situations = {
      'カリキュラム' => 'curriculum',
      'mattermost' => 'mattermost',
      'アプリ開発' => 'app_development',
      '転職活動' => 'job_hunt'
    }
  end
  
  def show
    situation_key = params[:situation]
    memories = load_memories["memories"][situation_key] || []
    @memory = memories.sample || "記憶が見つかりませんでした"
  end  
  

  private

  def load_memories
    YAML.load_file(Rails.root.join('config', 'memories.yml'))
  end
end
