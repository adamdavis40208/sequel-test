require_relative '../../model/user'

Sequel.seed do
  def run
    [
        ['asdf', 'password'],
        ['jimothy', '$#CUR$_P4$$']
    ].each do |name, password|
      User.create name: name, password: password
    end
  end
end