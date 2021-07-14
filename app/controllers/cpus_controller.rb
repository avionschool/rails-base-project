class CpusController < ApplicationController
  
  def index
    @cpus = Cpu.all
  end

  def scrape
    response = Cpu.process
    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
  end

end
