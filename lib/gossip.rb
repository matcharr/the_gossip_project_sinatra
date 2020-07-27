# frozen_string_literal: true

class Gossip
  attr_accessor :author, :content
  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  def self.find(id)
    gossips = all
    gossips[id.to_i]
  end

  def self.update(new_author, new_content, id)
    gossips = self.all
    gossips[id].author = new_author
    gossips[id].content = new_content
#Je vide le fichier et je le rempli avec les nouvelles valeurs
    CSV.open("db/gossip.csv", "w") { |csv| }
    CSV.open("db/gossip.csv", "w") { |csv| gossips.each { |gossip| gossip.save }}
    end

end
