require_relative '../../model/user'

Sequel.seed do
  def run
    [
        ['fdas', 'fdaa'],
        ['fdsa', 'fdas']
    ].each do |name, password|
      User.create name: name, password: password
    end
  end
end