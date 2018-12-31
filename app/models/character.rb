class Character < ActiveRecord::Base
  belongs_to :actor
  belongs_to :show

  def say_that_thing_you_say
    "#{self.name} always says: #{self.catchphrase}"
  end

  def build_show(name:)
    show = Show.create(name: name)
    self.show_id = show.id
    self.save
    self
  end

  def build_network(call_letters:)
    network = Network.create(call_letters: call_letters)
    self.show.network_id = network.id
    self.show.save
  end
end
