require File.expand_path('../outcome.rb', __FILE__)
class ImmigrationOutcome < Outcome

  def add_values (row)
    #immigration specific defaults set here
    @defaults[:home_office_ucn] = 'A9999999'
    @defaults[:ho_interview] = '0'

    #if certain defaults not passed maybe report error here?
    row.each do |k, v|
      @defaults[k.to_sym] = v
    end

  end

end
